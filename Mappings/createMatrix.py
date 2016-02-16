#!/usr/bin/python

import os
import textwrap, argparse
import pymysql

#import sys
#reload(sys)  
#sys.setdefaultencoding('utf-8')

from collections import defaultdict

#can use this also
#import MySQLdb

if __name__ == '__main__':

	parserarg = argparse.ArgumentParser(
	     prog='createMatrix.py',
	     formatter_class=argparse.RawDescriptionHelpFormatter,
	     description=textwrap.dedent('''\
		 extract synset-variants-csco tuples from MCR
		 --------------------------------
		     example of use $python3 %(prog)s --host host --db database --user user --pwd password
		     python createMatrix.py --host adimen.si.ehu.es --user guest --pwd guest --db mcr9 [[--language spa-30]] [[--language cat-30]] [[...]]
		 '''))

	parserarg.add_argument('--host', dest='host_db', required=True, type=str , help='host url\'s database (required)')
	parserarg.add_argument('--user', dest='user_db', required=True, type=str , help='user\'s database (required)')
	parserarg.add_argument('--pwd', dest='pwd_db', required=True, type=str , help='password\'s database (required)')
	parserarg.add_argument('--db', dest='db_db', required=True, type=str , help='database\'s selection (required)')

	parserarg.add_argument('--language', dest='lng', action='append', required=False, type=str , help='language (default all, optional)')

	args = parserarg.parse_args()

	lng = args.lng

	#choose one of them
	#db = MySQLdb.connect(host=args.host_db, user=args.user_db, passwd=args.pwd_db, db=args.db_db) 
	#cur = db.cursor(MySQLdb.cursors.DictCursor) 

	db = pymysql.connect(host=args.host_db, user=args.user_db, passwd=args.pwd_db, db=args.db_db) 
	cur = db.cursor(pymysql.cursors.DictCursor) 

	# we build lists of languages.
	cur.execute("select * FROM wei_languages")
	rows = cur.fetchall()

	languages_mcr = []
	for row in rows: languages_mcr.append(row["code"])

	if lng is None: 
		languages = languages_mcr
	else: 
		for l in lng:
			if not l in languages_mcr:
				print("Language must be present in MCR, options:"+str(languages_mcr)+"\n")
				exit(1)
		languages = lng

	if not os.path.exists('out'):
		os.makedirs('out')

	for lang in languages:

		print("Extract language "+lang+" from MCR in file 'out/matrix-"+lang+".tab'\n")

		matrix_dict = defaultdict(dict)

		output_file = open('out/matrix-'+lang+'_0.tab', "w")

		cur.execute("SELECT * FROM `wei_"+lang+"_variant`")
		rows = cur.fetchall()

		for row in rows:

			syn = "-".join(row['offset'].split("-")[-2:]).decode('iso-8859-1').encode('utf-8')
			word = row['word'].decode('iso-8859-1').encode('utf-8')

			matrix_dict[syn][word] = row['csco']

		output_file.write('synset\tword\tcsco\n')

		print len(matrix_dict)

		for key,val in matrix_dict.items():
			for word,csco in val.items():
				output_file.write(key+'\t'+word+'\t'+str(csco)+'\n')

		output_file.close()
