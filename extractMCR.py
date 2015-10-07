#!/usr/bin/python

import textwrap, argparse
import pymysql

#can use this also
#import MySQLdb

parserarg = argparse.ArgumentParser(
     prog='extractMCR.py',
     formatter_class=argparse.RawDescriptionHelpFormatter,
     description=textwrap.dedent('''\
         Extract information from specific table in MCR, tabulated format
         --------------------------------
             example of use $python3 %(prog)s --host host --db database --user user --pwd password
         '''))

parserarg.add_argument('--host', dest='host_db', required=True, type=str , help='host url\'s database (required)')
parserarg.add_argument('--user', dest='user_db', required=True, type=str , help='user\'s database (required)')
parserarg.add_argument('--pwd', dest='pwd_db', required=True, type=str , help='password\'s database (required)')
parserarg.add_argument('--db', dest='db_db', required=True, type=str , help='database\'s selection (required)')
parserarg.add_argument('--tb', dest='tb_db', required=True, type=str , help='table\'s selection (required)')

parserarg.add_argument('--f', dest='fields', action='append', required=False, type=str , help='fields (default all, optional)')

args = parserarg.parse_args()

#choose one of them
#db = MySQLdb.connect(host=args.host_db, user=args.user_db, passwd=args.pwd_db, db=args.db_db) 
#cur = db.cursor(MySQLdb.cursors.DictCursor) 

db = pymysql.connect(host=args.host_db, user=args.user_db, passwd=args.pwd_db, db=args.db_db) 
cur = db.cursor(pymysql.cursors.DictCursor) 

cur.execute("show columns FROM `"+args.tb_db+"`")
columns = cur.fetchall()

fields = args.fields

sql_orderby = ""

if fields is None: 
	fields = []
	for field in columns:
		fields.append(field["Field"])
else: 
	sql_orderby = "ORDER BY "+fields[0]

cur.execute("SELECT * FROM `"+args.tb_db+"` "+sql_orderby)
rows = cur.fetchall()

for row in rows:
	out = ""
	tab = "\t"
	for field in columns:
		if len(fields) != 0 and field["Field"] == fields[-1]: tab = ""
		if field["Field"] in fields: out = out + str(row[field['Field']]) + tab
	print(out)
