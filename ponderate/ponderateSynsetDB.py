#!/usr/bin/python

import textwrap, argparse
import os, sys, subprocess
import MySQLdb

parserarg = argparse.ArgumentParser(
     prog='ponderateSynsetDB',
     formatter_class=argparse.RawDescriptionHelpFormatter,
     description=textwrap.dedent('''\
         calculate ponderated vectors for synset in mcr database
         --------------------------------
             example of use $python3 %(prog)s --synset synset --host host --user user --pwd password --db database [[--debug]]
         '''))

parserarg.add_argument('--host', dest='host_db', required=True, type=str , help='host url\'s database (required)')
parserarg.add_argument('--user', dest='user_db', required=True, type=str , help='user\'s database (required)')
parserarg.add_argument('--pwd', dest='pwd_db', required=True, type=str , help='password\'s database (required)')
parserarg.add_argument('--db', dest='db_db', required=True, type=str , help='database\'s selection (required)')

parserarg.add_argument('--debug', action='store_false', default='TRUE', help='to show aditional information')
parserarg.add_argument('--synset', dest='synset', required=True, default='', type=str , help='input synsets (required)')

args = parserarg.parse_args()

debug = not(bool(args.debug))
if debug:	deb="--debug"
else:		deb=""

syn = args.synset

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

# we build lists of file_outputs.
languages = []
for row in rows: languages.append(row["code"])
print languages

print languages[1]

acc_delete = ''
acc_names = ''

languages = [languages[1]] ## Only second language, english, comment this line to get all languages.

for lang in languages:

	synsets = []
	if debug: occ = 0

	cur.execute("SELECT * FROM `wei_"+lang+"_relation` WHERE `sourceSynset` LIKE '"+lang+"-"+syn+"'")
	rows = cur.fetchall()

	for row in rows:

		synsets.append([row['targetSynset'].replace(lang+"-", ""),row['relation']])
		if debug: occ = occ + 1


	cur.execute("SELECT * FROM `wei_"+lang+"_relation` WHERE `targetSynset` LIKE '"+lang+"-"+syn+"'")
	rows = cur.fetchall()

	for row in rows:

		synsets.append([row['sourceSynset'].replace(lang+"-", ""),row['relation']])
		if debug: occ = occ + 1

	for synset in synsets:

		cmd = "python ponderacioSynset.py --synset "+synset[0]+" "+deb

		result = subprocess.check_output(cmd, shell=True).strip()

		print "++++++++++++++++++++++"

		print result+"$"+synset[0]+"$"+str(synset[1])

if debug: sys.stderr.write("SYN LEN : "+str(len(synsets))+"\n")
if debug: sys.stderr.write("OCC     : "+str(occ)+"\n")
