#!/usr/bin/python

import os,re
import textwrap, argparse
import pymysql

#can use this also
#import MySQLdb

from collections import defaultdict
from collections import OrderedDict

# to get POS correspondence in sense.index file
def translation_ss_type(ss):

	if int(ss) == 1:
		return 'n'
	if int(ss) == 2:
		return 'v'
	if int(ss) == 3:
		return 'a'
	if int(ss) == 4:
		return 'r'
	if int(ss) == 5:
		return 'a'

if __name__ == '__main__':

	argument_parser = argparse.ArgumentParser(
	     prog='calculateSenses.py',
	     formatter_class=argparse.RawDescriptionHelpFormatter,
	     description=textwrap.dedent('''\
		 calculate new variant's senses from MCR
		 --------------------------------
		     example of use $python3 %(prog)s --host host --db database --user user --pwd password
		     python createMatrix.py --host adimen.si.ehu.es --user guest --pwd guest --db mcr9 [[--language spa-30]] [[--language cat-30]] [[...]]
		 '''))


	argument_parser.add_argument('--relation', dest='relation', required=False, type=str , choices=['all','all+gloss','freq'], default='freq', help='relation type (optional, default freq)')
	argument_parser.add_argument('--csco', dest='csco', required=False, type=str , choices=['visible','all'], default='all', help='filter by csco (optional, default all)')
	argument_parser.add_argument('--log_files', dest='log_files', required=False, choices=['simple','detail','no'], default='no', help='create log files (optional, default no)')

	argument_parser.add_argument('--datafile', dest='datafile', required=False, type=str , help='input data file (required for all and all+gloss relations options)')
	argument_parser.add_argument('--sensefile', dest='sensefile', required=False, type=str , help='sense file (required for frequency option)')
	argument_parser.add_argument('--glossfile', dest='glossfile', required=False, type=str , help='gloss file (required for all+gloss relations option)')

	argument_parser.add_argument('--host', dest='host_db', required=True, type=str , help='host url\'s database (required)')
	argument_parser.add_argument('--user', dest='user_db', required=True, type=str , help='user\'s database (required)')
	argument_parser.add_argument('--pwd', dest='pwd_db', required=True, type=str , help='password\'s database (required)')
	argument_parser.add_argument('--db', dest='db_db', required=True, type=str , help='database\'s selection (required)')

	argument_parser.add_argument('--language', dest='lng', action='append', required=False, type=str , help='language (default all, optional)')

	args = argument_parser.parse_args()

	#################################################### CHECK LANGUAGE

	lng = args.lng

	#choose one of them
	#db = MySQLdb.connect(host=args.host_db, user=args.user_db, passwd=args.pwd_db, db=args.db_db) 
	#cur = db.cursor(MySQLdb.cursors.DictCursor) 

	db = pymysql.connect(host=args.host_db, user=args.user_db, passwd=args.pwd_db, db=args.db_db) 
	cur = db.cursor(pymysql.cursors.DictCursor) 

	# we build lists of languages.
	languages_mcr = []
	cur.execute("select * FROM wei_languages")
	rows = cur.fetchall()
	for row in rows: languages_mcr.append(row["code"])

	# if no introduce language parameter, all language. otherwise check that introduced language is in MCR
	if lng is None: 
		languages = languages_mcr
	else: 
		for l in lng:
			if not l in languages_mcr:
				print("Language must be present in MCR, options:"+str(languages_mcr)+"\n")
				exit(1)
		languages = lng

	#################################################### LOAD DATA

	relation_opt = args.relation
	csco = args.csco

	datafile =  args.datafile
	sensefile = args.sensefile
	glossfile = args.glossfile

	#################################################### LOAD SENSE FILE

	if relation_opt == "freq" and sensefile is None:
		print("Frequency relation option need sensefile.\n")
		exit()
	elif relation_opt == "freq":

		synsets_weight = {}

		print("Loading "+sensefile+"...\n")
	
		sfile = open(sensefile,'r')
		content_file = sfile.readlines()
	
		for line in content_file:

			sense_key,synset_offset,sense_number,tag_cnt = line.split()

			lemma,lex_sense = sense_key.split('%')

			ss_type,lex_filenum,lex_id,head_word,head_id = lex_sense.split(':')

			try:
				synsets_weight[synset_offset+'-'+translation_ss_type(ss_type)] = synsets_weight[synset_offset+'-'+translation_ss_type(ss_type)] + int(tag_cnt)
			except KeyError:
				synsets_weight[synset_offset+'-'+translation_ss_type(ss_type)] = int(tag_cnt)
	
		sfile.close()

	#################################################### LOAD GLOSS FILE

	if relation_opt == "all+gloss" and (glossfile is None or datafile is None):
		print("all+gloss relation option need glossfile and datafile.\n")
		exit()
	elif relation_opt == "all+gloss":

		gloss_synsets = {}

		print("Loading "+glossfile+"...\n")
	
		sfile = open(glossfile,'r')
		content_file = sfile.readlines()
	
		for line in content_file:

			synset_offset,rel_gloss = line.split()

			gloss_synsets[synset_offset] = int(rel_gloss)
	
		sfile.close()

	#################################################### LOAD DATA FILE

	if relation_opt == "all" and datafile is None:
		print("all relation option need datafile.\n")
		exit()
	elif relation_opt == "all+gloss" or relation_opt == "all":

		synsets_weight = {}

		files = [datafile+'.noun',datafile+'.verb',datafile+'.adj',datafile+'.adv']

		for f in files:

			print("Loading "+f+"...\n")

			sfile = open(f,'r')
			content_file = sfile.readlines()

			for line in content_file:

				result = re.match('^\d{8}', line)

				if result:

					data_aux = line.split("|")
					datalist = data_aux[0].split()

					pointer = 4 + 2 * int(datalist[3],16)

					if datalist[2] == "s":
						pos = "a"
					else:
						pos = datalist[2]

					# WEIGHT RELATED TO RELATION OPTION
					if relation_opt == "all+gloss":
						weight = int(datalist[pointer])+gloss_synsets[str(datalist[0])+"-"+pos]
					elif relation_opt == "all":
						weight = int(datalist[pointer])
	
					# store synset's frequency list
					synsets_weight[str(datalist[0])+"-"+pos] = weight

			sfile.close()

	# create output dir if not exists
	if not os.path.exists('out'):
		os.makedirs('out')

	pos_list = ['n','v','a','r']
	frequencies_dict = {}
	words_dict = {}

	# for each language, calculate new senses
	for lang in languages:

		print("Proces language "+lang+" from MCR.'\n")

		senses_dict = defaultdict(dict)

		for pos in pos_list:

			frequencies_dict[pos] = defaultdict(dict)
			words_dict[pos] = defaultdict(dict)

			if csco == 'visible':
				cur.execute("SELECT offset,word FROM `wei_"+lang+"_variant` WHERE csco > 49 AND pos = '"+pos+"'")
			else:
				cur.execute("SELECT offset,word FROM `wei_"+lang+"_variant` WHERE pos = '"+pos+"'")

			rows = cur.fetchall()

			# for each row in SQL result extract synset-variant tuple and assign frequency/weight to it.
			for row in rows:

				synset = "-".join(row['offset'].split("-")[-2:])
				word = row['word']

				try:
					words_dict[pos][word][synset] = synsets_weight[synset]

				except KeyError:
					if synset[0] != "8":
						print("NO new Synset WITHOUT Value: "+synset)
					else:
						words_dict[pos][word][synset] = 0

			# step 1) for each word in dictionary order synsets by frequency value. step 2) for each ordered list (created in previous step) assign sense value
			for word,values_list in words_dict[pos].items():
				frequencies_dict[pos][word] = OrderedDict(sorted(values_list.items(), key=lambda t: t[1], reverse=True))
				for sense,synset in enumerate(frequencies_dict[pos][word].keys()):
					senses_dict[word][synset] = sense+1

		# order dictionary for logs, two levels of keys. Order first by inner key (synset) and later order by outer key (word)
		ord_bysyn_senses_dict = {}
		for word in senses_dict.keys():
			ord_bysyn_senses_dict[word] = OrderedDict(sorted(senses_dict[word].items(), key=lambda t: t[0], reverse=False))
		ord_senses_dict = OrderedDict(sorted(ord_bysyn_senses_dict.items(), key=lambda t: t[0], reverse=False))

		# create descriptor and write header to output file
		output_file_sql = open('out/senses-'+relation_opt+'-'+lang+'.sql', "w")
		output_file_sql.write("SET NAMES utf8;\n")

		
		if args.log_files != 'no':
			output_file_log = open('out/senses-'+relation_opt+'-'+lang+'.tab', "w")
			#output_file_log.write('word\tsynset\tsense\n')

		# for each synset-variant tuple write data to a output file
		for word,values in ord_senses_dict.items():
			for synset,sense in values.items():

				word_r = word.replace("'", "\\'")

				output_file_sql.write("UPDATE `wei_"+lang+"_variant` SET `sense`="+str(sense)+" WHERE `offset` = '"+lang+"-"+synset+"' AND `word` LIKE '"+word_r+"';\n")
				if args.log_files != 'no':
					output_file_log.write(word+'#'+synset+'\t'+str(sense)+'\n')

			if args.log_files == 'detail':
				output_file_log.write("FREQUENCY LIST:\n")
				for pos in pos_list:
					output_file_log.write("\tPOS "+pos+":\n")
					output_file_log.write("\t\t"+str(frequencies_dict[pos][word])+"\n")
				output_file_log.write("SENSES LIST\n")
				output_file_log.write("\t"+str(senses_dict[word])+"\n\n")
				output_file_log.write("============================================================================\n")

		output_file_sql.close()
		if args.log_files != 'no':
			output_file_log.close()

