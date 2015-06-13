#!/usr/bin/python

import subprocess
import textwrap, argparse
import pymysql

#can use this also
#import MySQLdb

parserarg = argparse.ArgumentParser(
     prog='infoVariantSynset',
     formatter_class=argparse.RawDescriptionHelpFormatter,
     description=textwrap.dedent('''\
         get variant info for specific synset
         --------------------------------
             example of use $python3 %(prog)s --synset synset [[--debug]]
         '''))

parserarg.add_argument('--host', dest='host_db', required=True, type=str , help='host url\'s database (required)')
parserarg.add_argument('--user', dest='user_db', required=True, type=str , help='user\'s database (required)')
parserarg.add_argument('--pwd', dest='pwd_db', required=True, type=str , help='password\'s database (required)')
parserarg.add_argument('--db', dest='db_db', required=True, type=str , help='database\'s selection (required)')

parserarg.add_argument('--pos', dest='pos', required=False, default='n', type=str , help='pos (default noun)')

args = parserarg.parse_args()

pos = args.pos

#choose one of them
#db = MySQLdb.connect(host=args.host_db, user=args.user_db, passwd=args.pwd_db, db=args.db_db) 
#cur = db.cursor(MySQLdb.cursors.DictCursor) 

db = pymysql.connect(host=args.host_db, user=args.user_db, passwd=args.pwd_db, db=args.db_db) 
cur = db.cursor(pymysql.cursors.DictCursor) 

cur.execute("SELECT * FROM `wei_ili_record` WHERE `bc` = 1 AND `iliPos` = '"+pos+"' ORDER BY `iliOffset` ASC ")
rows = cur.fetchall()

input_file = open('BLCnoun.rel', "r")
content_file = input_file.read()

for row in rows:

	syn = "-".join(row['iliOffset'].split('-')[2:])

	occ_w = 0 
	for line in content_file:
		if '\t'+syn in line:
			occ_w += 1

	cur.execute("SELECT * FROM `wei_eng-30_variant` WHERE `offset` LIKE 'eng-30-"+syn+"'")
	rows_v = cur.fetchall()

	variants = ''
	# join variants in a single string separated by "/". Check that query dont return empty set.
	variants = " ".join(x['word'] for x in rows_v if x)

	print syn+" "+str(row['semf'])+" "+str(occ_w)+" "+variants
