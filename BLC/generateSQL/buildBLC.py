#!/usr/bin/python

import subprocess
import textwrap, argparse
import pymysql

#can use this also
#import MySQLdb

parserarg = argparse.ArgumentParser(
     prog='buildBLC.py',
     formatter_class=argparse.RawDescriptionHelpFormatter,
     description=textwrap.dedent('''\
         build a BLC file from data stored in MCR and datasets to compare with BLC information
         --------------------------------
             example of use $python3 %(prog)s --host host --db database --user user --pwd password --pos n/v
         '''))

parserarg.add_argument('--host', dest='host_db', required=True, type=str , help='host url\'s database (required)')
parserarg.add_argument('--user', dest='user_db', required=True, type=str , help='user\'s database (required)')
parserarg.add_argument('--pwd', dest='pwd_db', required=True, type=str , help='password\'s database (required)')
parserarg.add_argument('--db', dest='db_db', required=True, type=str , help='database\'s selection (required)')

parserarg.add_argument('--pos', dest='pos', required=True, default='n', type=str , help='pos (required)')

args = parserarg.parse_args()

pos = args.pos

if pos == 'n': name = 'noun'
elif pos == 'v': name = 'verb'
else:
	print("POS parameter must be 'n' or 'v'")
	exit(1)


#choose one of them
#db = MySQLdb.connect(host=args.host_db, user=args.user_db, passwd=args.pwd_db, db=args.db_db) 
#cur = db.cursor(MySQLdb.cursors.DictCursor) 

db = pymysql.connect(host=args.host_db, user=args.user_db, passwd=args.pwd_db, db=args.db_db) 
cur = db.cursor(pymysql.cursors.DictCursor) 

cur.execute("SELECT * FROM `wei_ili_record` WHERE `bc` = 1 AND `iliPos` = '"+pos+"' ORDER BY `iliOffset` ASC ")
rows = cur.fetchall()


input_file = open('BLC'+name+'.rel', "r")
content_file = input_file.readlines()

for row in rows:

	# to obtain the synset without 'ili' string
	syn = "-".join(row['iliOffset'].split('-')[2:])

	occ_w = 0 
	for line in content_file:
		if '\t'+syn in line:	# it's in right position?? in that case it is a BLC
			occ_w += 1			# in that case add 1 to occurence counter 

	cur.execute("SELECT * FROM `wei_eng-30_variant` WHERE `offset` LIKE 'eng-30-"+syn+"'")
	rows_v = cur.fetchall()

	variants = ''
	# join variants in a single string separated by "/". Check that query dont return empty set.
	variants = " ".join(x['word'] for x in rows_v if x)

	print syn+" "+str(row['semf'])+" "+str(occ_w)+" "+variants
