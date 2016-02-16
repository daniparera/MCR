#!/usr/bin/python

import os
import textwrap, argparse
import pymysql
from collections import defaultdict

#can use this also
#import MySQLdb

if __name__ == '__main__':

	parserarg = argparse.ArgumentParser(
	     prog='count_variants_synsets.py',
	     formatter_class=argparse.RawDescriptionHelpFormatter,
	     description=textwrap.dedent('''\
		 count number of variants for each synset from MCR, and a mean :)
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

		print("Counting.... language "+lang+" from MCR in file 'out/count-"+lang+".tab'\n")

		matrix_dict = defaultdict(dict)

		output_file = open('out/count-'+lang+'.tab', "w")

		cur.execute("SELECT * FROM `wei_"+lang+"_synset`")
		rows = cur.fetchall()

		syn_t = len(rows)
		syn_0 = 0
		acc = 0

		for row in rows:

			syn = row['offset']

			cur.execute("SELECT * FROM `wei_"+lang+"_variant` WHERE offset = '"+syn+"' AND csco > 49")
			count = len(cur.fetchall())

			acc = acc + count
			if count == 0:
				syn_0 = syn_0 + 1

			output_file.write(syn+'\t'+str(count)+'\n')

		output_file.write('SYN:\t'+str(syn_t)+'\n')
		output_file.write('SYN_0:\t'+str(syn_0)+'\n')
		output_file.write('ACC:\t'+str(acc)+'\n')
		output_file.write('MEAN:\t'+str(1.0*acc/(syn_t-syn_0))+'\n')
		output_file.write('COVERAGE:\t'+str(round(((1.0*syn_t-syn_0)/syn_t)*100,2))+'%\n')

		output_file.close()
