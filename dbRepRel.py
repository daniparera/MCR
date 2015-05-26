import textwrap, argparse
import os, sys
import MySQLdb

parserarg = argparse.ArgumentParser(
     prog='dbRepRel',
     formatter_class=argparse.RawDescriptionHelpFormatter,
     description=textwrap.dedent('''\
         get score for an imput text and input keyword
         --------------------------------

             example of use $python3 %(prog)s --host host --user user --pwd password --db database [[--debug --name --select]]
         '''))

parserarg.add_argument('--host', dest='host_db', required=True, type=str , help='host url\'s database (required)')
parserarg.add_argument('--user', dest='user_db', required=True, type=str , help='user\'s database (required)')
parserarg.add_argument('--pwd', dest='pwd_db', required=True, type=str , help='password\'s database (required)')
parserarg.add_argument('--db', dest='db_db', required=True, type=str , help='database\'s selection (required)')

parserarg.add_argument('--debug', action='store_false', default='TRUE', help='to show aditional information')
parserarg.add_argument('--name', action='store_false', default='TRUE', help='to show aditional word information')
parserarg.add_argument('--delete', action='store_false', default='TRUE', help='to show delete querys')

args = parserarg.parse_args()

debug = not(bool(args.debug))
name = not(bool(args.name))
delete = not(bool(args.delete))

def select_rel(n):

	if (n == 1) : return '='		#
	if (n == 2) : return '>'		#
	if (n == 4) : return '\\'
	if (n == 6) : return '#s'		#
	if (n == 7) : return '#m'		#
	if (n == 8) : return '#p'		#
	if (n == 12): return '~'
	if (n == 19): return '*'		#
	if (n == 33): return '!'
	if (n == 34): return '&'		#
	if (n == 49): return '^'
	if (n == 52): return '$'		#
	if (n == 61): return 'gloss'	#
	if (n == 64): return '+'
	if (n == 63): return '-c'
	if (n == 66): return '-r'
	if (n == 68): return '-u'
	if (n == 70): return '<'
	return str(n)

db = MySQLdb.connect(host=args.host_db, user=args.user_db, passwd=args.pwd_db, db=args.db_db, port=80) 
cur = db.cursor(MySQLdb.cursors.DictCursor) 
cur.execute("select * FROM wei_languages")
rows = cur.fetchall()

# read input file, format's description in 'input_sel.txt' file
#with open('input_sel.txt','r') as fi:
#	line = fi.readline()	# only read first line

# we build lists of languages.
languages = []
for row in rows: languages.append(row["code"])
if debug: print languages

acc_delete = ''
acc_names = ''

for lang in languages:

	cur.execute("SELECT offset, gloss FROM `wei_"+lang+"_synset`")
	rows_syn = cur.fetchall()

	for row_s in rows_syn: 

		synset = row_s['offset']

		cur.execute("SELECT relation, sourceSynset FROM `wei_"+lang+"_relation` WHERE `targetSynset` LIKE '"+synset+"' AND `sourceSynset` LIKE '"+synset+"'")
		rows = cur.fetchall()

		for row in rows: 

			if name:
				cur.execute("SELECT word FROM `wei_"+lang+"_variant` WHERE `offset` LIKE '"+synset+"'")
				rows_var = cur.fetchall()

				variants = []

				for row_v in rows_var: 

					variants.append(row_v['word'])
				variants = ', '.join(variants)

			if delete:
				rel = row['relation']
				if debug: print "DELETE  FROM `wei_"+lang+"_relation` WHERE `relation` = "+str(rel)+" AND `sourceSynset` = '"+synset+"' AND `targetSynset` = '"+synset+"';"
				acc_delete = acc_delete + "DELETE  FROM `wei_"+lang+"_relation` WHERE `relation` = "+str(rel)+" AND `sourceSynset` = '"+synset+"' AND `targetSynset` = '"+synset+"';\n"

			if name:
				if debug: print synset+" -- "+variants+" -- "+str(row['relation'])
				acc_names = acc_names + synset+" -- "+variants+" -- "+str(row['relation']) + "\n"

if name:
	print acc_names
if delete:
	print acc_delete
