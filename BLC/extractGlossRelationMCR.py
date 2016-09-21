#!/usr/bin/python

import textwrap, argparse
import pymysql

#can use this also
#import MySQLdb

parserarg = argparse.ArgumentParser(
     prog='extractGlossRelationMCR.py',
     formatter_class=argparse.RawDescriptionHelpFormatter,
     description=textwrap.dedent('''\
         extract number of gloss's relations from MCR
         --------------------------------
             example of use: $ python3 %(prog)s --host host --db database --user user --pwd password > outfile_glossRel.txt
         '''))

parserarg.add_argument('--host', dest='host_db', required=True, type=str , help='host url\'s database (required)')
parserarg.add_argument('--user', dest='user_db', required=True, type=str , help='user\'s database (required)')
parserarg.add_argument('--pwd', dest='pwd_db', required=True, type=str , help='password\'s database (required)')
parserarg.add_argument('--db', dest='db_db', required=True, type=str , help='database\'s selection (required)')

args = parserarg.parse_args()

#choose one of them
#db = MySQLdb.connect(host=args.host_db, user=args.user_db, passwd=args.pwd_db, db=args.db_db) 
#cur = db.cursor(MySQLdb.cursors.DictCursor) 

db = pymysql.connect(host=args.host_db, user=args.user_db, passwd=args.pwd_db, db=args.db_db) 
cur = db.cursor(pymysql.cursors.DictCursor) 

cur.execute("SELECT * FROM `wei_eng-30_synset`")
rows = cur.fetchall()

for row in rows:

	syn = "-".join(row['offset'].split("-")[-2:])

	cur.execute("SELECT * FROM `wei_eng-30_relation` WHERE `relation` = 61 AND `sourceSynset` = 'eng-30-"+syn+"'")
	rows_rel_1 = cur.fetchall()

	cur.execute("SELECT * FROM `wei_eng-30_relation` WHERE `relation` = 61 AND `targetSynset` = 'eng-30-"+syn+"'")
	rows_rel_2 = cur.fetchall()

	print syn+" "+str(len(rows_rel_1)+len(rows_rel_2))

