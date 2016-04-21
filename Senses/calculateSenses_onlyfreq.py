#!/usr/bin/python

import os,sys
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
	     prog='calculateSenses_onlyfreq.py',
	     formatter_class=argparse.RawDescriptionHelpFormatter,
	     description=textwrap.dedent('''\
		 extract synset-variants-csco tuples from MCR
		 --------------------------------
		     example of use $python3 %(prog)s --host host --db database --user user --pwd password
		     python createMatrix.py --host adimen.si.ehu.es --user guest --pwd guest --db mcr9 [[--language spa-30]] [[--language cat-30]] [[...]]
		 '''))

	argument_parser.add_argument('--sensefile', dest='sensefile', required=False, type=str , help='sense file (required)')

	argument_parser.add_argument('--host', dest='host_db', required=True, type=str , help='host url\'s database (required)')
	argument_parser.add_argument('--user', dest='user_db', required=True, type=str , help='user\'s database (required)')
	argument_parser.add_argument('--pwd', dest='pwd_db', required=True, type=str , help='password\'s database (required)')
	argument_parser.add_argument('--db', dest='db_db', required=True, type=str , help='database\'s selection (required)')

	argument_parser.add_argument('--language', dest='lng', action='append', required=False, type=str , help='language (default all, optional)')

	argument_parser.add_argument('--log_files', dest='log_files', action='store_true', help='create log files (optional)')

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

	# load sensefile
	freq_synsets = {}
	lemma_synsets = {}

	print("Loading "+args.sensefile+"...\n")

	sfile = open(args.sensefile,'r')
	content_file = sfile.readlines()

	for line in content_file:

		sense_key,synset_offset,sense_number,tag_cnt = line.split()

		lemma,lex_sense = sense_key.split('%')

		ss_type,lex_filenum,lex_id,head_word,head_id = lex_sense.split(':')

		try:
			freq_synsets[synset_offset+'-'+translation_ss_type(ss_type)] = freq_synsets[synset_offset+'-'+translation_ss_type(ss_type)] + int(tag_cnt)
			lemma_synsets[synset_offset+'-'+translation_ss_type(ss_type)] = lemma_synsets[synset_offset+'-'+translation_ss_type(ss_type)] + ", " + lemma+' '+sense_number
		except KeyError:
			freq_synsets[synset_offset+'-'+translation_ss_type(ss_type)] = int(tag_cnt)
			lemma_synsets[synset_offset+'-'+translation_ss_type(ss_type)] = lemma+' '+sense_number

	sfile.close()

	# create output dir if not exists
	if not os.path.exists('out'):
		os.makedirs('out')

	# for each language, calculate new senses
	for lang in languages:

		print("Proces language "+lang+" from MCR.'\n")

		words_dict = defaultdict(dict)
		frequencies_dict = defaultdict(dict)
		senses_dict = defaultdict(dict)

		cur.execute("SELECT offset,word FROM `wei_"+lang+"_variant` WHERE csco > 49")

		rows = cur.fetchall()

		# for each row in SQL result extract synset-variant tuple and put in a dictonary
		for row in rows:

			synset = "-".join(row['offset'].split("-")[-2:])
			word = row['word']

			try:
				words_dict[word][synset] = freq_synsets[synset]

			except KeyError:
				if synset[0] != "8":
					print("NO new Synset WITHOUT Value: "+synset)

		# step 1) for each word in dictionary order synsets by frequency value. step 2) for each ordered list (created in previous step) assign sense value
		for word,syn_freq in words_dict.items():
			frequencies_dict[word] = OrderedDict(sorted(syn_freq.items(), key=lambda t: t[1], reverse=True))
			for sense,synset in enumerate(frequencies_dict[word].keys()):
				senses_dict[word][synset] = sense+1

		ord_senses_dict = OrderedDict(sorted(senses_dict.items(), key=lambda t: t[0], reverse=True))

		# create descriptor and write header to output file
		output_file_sql = open('out/senses-'+lang+'.sql', "w")
		if args.log_files:
			output_file = open('out/senses-'+lang+'.tab', "w")
			output_file.write('synset\tword\tsense\n')

		# for each synset-variant tuple write data to a output file
		for word,values in senses_dict.items():
			if args.log_files:
				output_file.write(str(frequencies_dict[word])+'\n')
			for synset,sense in values.items():

				word_r = word.replace("'", "\\'")

				output_file_sql.write("UPDATE `wei_"+lang+"_variant` SET `sense`="+str(sense)+" WHERE `offset` = '"+lang+"-"+synset+"' AND `word` LIKE '"+word_r+"';\n")
				if args.log_files:
					output_file.write(word+'\t'+synset+'\t'+str(sense)+'\n')


		output_file.close()

