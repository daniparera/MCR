#!/usr/bin/python

import textwrap, argparse, sys
import pymysql

#can use this also
#import MySQLdb

parserarg = argparse.ArgumentParser(
     prog='buildUpdateOMW.py',
     formatter_class=argparse.RawDescriptionHelpFormatter,
     description=textwrap.dedent('''\
         check MCR with OMW datasets
         --------------------------------
             example of use $python3 %(prog)s --host host --db database --user user --pwd password
         '''))

parserarg.add_argument('--host', dest='host_db', required=True, type=str , help='host url\'s database (required)')
parserarg.add_argument('--user', dest='user_db', required=True, type=str , help='user\'s database (required)')
parserarg.add_argument('--pwd', dest='pwd_db', required=True, type=str , help='password\'s database (required)')
parserarg.add_argument('--db', dest='db_db', required=True, type=str , help='database\'s selection (required)')
parserarg.add_argument('--tb', dest='tb_db', required=True, type=str , help='table\'s selection (required)')

parserarg.add_argument('--all', action='store_false', default='TRUE', help='get all information')
parserarg.add_argument('--f', dest='field', required=False, type=str , help='field to search')
parserarg.add_argument('--o', dest='select', required=False, type=str , help='value to search')

parserarg.add_argument('--p', dest='pages', required=False, type=int, default=200 , help='pagination value')

args = parserarg.parse_args()

n_reg_pag = args.pages

#choose one of them
#db = MySQLdb.connect(host=args.host_db, user=args.user_db, passwd=args.pwd_db, db=args.db_db) 
#cur = db.cursor(MySQLdb.cursors.DictCursor) 

db = pymysql.connect(host=args.host_db, user=args.user_db, passwd=args.pwd_db, db=args.db_db) 
cur = db.cursor(pymysql.cursors.DictCursor) 

a = not(bool(args.all))

cur.execute("show columns FROM `"+args.tb_db+"`")
columns = cur.fetchall()

sql_head = "INSERT INTO `"+args.tb_db+"` ("

for field in columns[:-1]:
	sql_head = sql_head + "`" + field['Field'] + "`, "
sql_head = sql_head + "`" + columns[-1]['Field'] + "`) VALUES \n"

sql_result = sql_head

print args.field
print args.select

if args.field is None: 
	if a is False:
		sys.stderr.write("Need 'all' or 'f/o' parameters\n")
		exit()
	elif args.field is not None and a is True: 
		sys.stderr.write("'all' or 'f/o' parameters not both.\n")
		exit()
	else:

		################################# Not Filtered case ############################################

		#print("SELECT * FROM `"+args.tb_db+"` WHERE "+args.field+" = \""+value.strip()+"\"")
		cur.execute("SELECT * FROM `"+args.tb_db+"`")
		rows = cur.fetchall()

		index = 0

		# first until to last occurences
		for row in rows[:-1]:
			sql_result = sql_result + "("
			index = index + 1
			for field in columns[:-1]:
				sql_result = sql_result + "'" + str(row[field['Field']]) + "', "
			# last row's occurences
			sql_result = sql_result + "'" + str(row[columns[-1]['Field']]) + "'"
			if index % n_reg_pag == 0:
				sql_result = sql_result + ");\n"
				print(sql_result)
				sql_result = sql_head
			else:
				sql_result = sql_result + "),\n"

		# last sql's sentence occurences 
		sql_result = sql_result + "("
		for field in columns[:-1]:
			sql_result = sql_result + "'" + str(rows[-1][field['Field']]) + "', "
		# last row's occurences
		sql_result = sql_result + "'" + str(rows[-1][columns[-1]['Field']]) + "');"

		################################# Not Filtered case ############################################

################################# Filtered case ############################################

else:
	if args.select is None: 
		sys.stderr.write("f's parameter need o's parameter\n")
		exit()
	elif a is True: 
		sys.stderr.write("'all' or 'f/o' parameters not both\n")
		exit()

	input_file = open(args.select, "r")
	aux = input_file.readlines()
	n_reg_rows = len(aux)

	for idx,value in enumerate(aux):

		cur.execute("SELECT * FROM `"+args.tb_db+"` WHERE "+args.field+" = \""+value.strip()+"\"")
		rows = cur.fetchall()

		#print(rows)
		if (len(rows) != 1):
			print("LEN SELECTED ROWS != 1")
			exit(-1)

		# first until last occurences
		#for row in rows[:-1]:
		#	sql_result = sql_result + "("
		#	for field in columns[:-1]:
		#		sql_result = sql_result + "'" + str(row[field['Field']]) + "', "
		#	sql_result = sql_result + "'" + str(row[columns[-1]['Field']]) + "'),\n"

		# last occurences
		sql_result = sql_result + "("
		for field in columns[:-1]:
			sql_result = sql_result + "'" + str(rows[-1][field['Field']]) + "', "
		sql_result = sql_result + "'" + str(rows[-1][columns[-1]['Field']]) + "')"

		# if not is first and is multiple of pagination OR is the last, print and 
		if idx != 0 and idx % n_reg_pag == 0 or idx == n_reg_rows - 1:
			sql_result = sql_result + ";\n"
			print(sql_result)
			sql_result = sql_head
		else:
			sql_result = sql_result + ",\n"

################################# Filtered case ############################################
