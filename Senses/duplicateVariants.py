#!/usr/bin/python

from collections import defaultdict
import textwrap, argparse
import pymysql

#can use this also
#import MySQLdb

if __name__ == '__main__':

	argument_parser = argparse.ArgumentParser(
	     prog='createMatrix.py',
	     formatter_class=argparse.RawDescriptionHelpFormatter,
	     description=textwrap.dedent('''\
		 check duplicate variant from MCR
		 --------------------------------
		     example of use $python3 %(prog)s --host host --db database --user user --pwd password
		     python createMatrix.py --host adimen.si.ehu.es --user guest --pwd guest --db mcr9 [[--language spa-30]] [[--language cat-30]] [[...]]
		 '''))

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

	#################################################### CHECK LANGUAGE

	words_dict = defaultdict(dict)

	# for each language, calculate new senses
	for lang in languages:

		print("Proces language "+lang+" from MCR.'\n")

		cur.execute("SELECT offset,word FROM `wei_"+lang+"_variant`")

		rows = cur.fetchall()

		# for each row in SQL result extract synset-variant tuple and store it.
		for row in rows:

			synset = "-".join(row['offset'].split("-")[-2:])
			word = row['word']

			try:
				words_dict[word][synset] = 1

			except KeyError:
				if synset[0] != "8":
					print("NO new Synset WITHOUT Value: "+synset)
				else:
					words_dict[word][synset] = 0

		for word,values in words_dict.items():
			for synset,value in values.items():

				word_r = word.replace("'", "\\'")

				cur.execute("SELECT * FROM `wei_"+lang+"_variant` WHERE `offset` = '"+lang+"-"+synset+"' AND `word` LIKE '"+word_r+"'")
				if cur.rowcount != 1:
					print("DUPLICATE: Word --> "+word+' in Synset --> '+synset+'\t'+str(value)+'\n')

