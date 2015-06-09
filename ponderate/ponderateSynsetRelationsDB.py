#!/usr/bin/python

import textwrap, argparse
import os, sys, subprocess
import pymysql

#can use this also
#import MySQLdb

parserarg = argparse.ArgumentParser(
     prog='ponderateSynsetDB',
     formatter_class=argparse.RawDescriptionHelpFormatter,
     description=textwrap.dedent('''\
         calculate ponderated vectors for synset in mcr database
         --------------------------------
             example of use $python3 %(prog)s --synset synset --host host --user user --pwd password --db database [[--debug --variant --relinfo]]
         '''))

parserarg.add_argument('--host', dest='host_db', required=True, type=str , help='host url\'s database (required)')
parserarg.add_argument('--user', dest='user_db', required=True, type=str , help='user\'s database (required)')
parserarg.add_argument('--pwd', dest='pwd_db', required=True, type=str , help='password\'s database (required)')
parserarg.add_argument('--db', dest='db_db', required=True, type=str , help='database\'s selection (required)')

parserarg.add_argument('--debug', action='store_false', default='TRUE', help='to show debug information')
parserarg.add_argument('--variant', action='store_false', default='TRUE', help='to show variant information')
parserarg.add_argument('--relinfo', action='store_false', default='TRUE', help='to show additional relation information')
parserarg.add_argument('--synset', dest='synset', required=True, default='', type=str , help='input synsets (required)')

args = parserarg.parse_args()

debug = not(bool(args.debug))
if debug:	deb="--debug"
else:		deb=""

variant = not(bool(args.variant))
relinfo = not(bool(args.relinfo))

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

#choose one of them
#db = MySQLdb.connect(host=args.host_db, user=args.user_db, passwd=args.pwd_db, db=args.db_db) 
#cur = db.cursor(MySQLdb.cursors.DictCursor) 

db = pymysql.connect(host=args.host_db, user=args.user_db, passwd=args.pwd_db, db=args.db_db) 
cur = db.cursor(pymysql.cursors.DictCursor) 

cur.execute("select * FROM wei_languages")
rows = cur.fetchall()

# we build lists of file_outputs.
languages = []
for row in rows: languages.append(row["code"])
if debug: print languages
if debug: print languages[1]

cmd = "python infoVariantSynset.py --synset "+syn
result_var = subprocess.check_output(cmd, shell=True).strip()

if variant: print "Variants: "+result_var

acc_delete = ''
acc_names = ''

languages = [languages[1]] ## Only second language, english, comment this line to get all languages.

for lang in languages:

	synsets = []


	cur.execute("SELECT * FROM `wei_"+lang+"_relation` WHERE `sourceSynset` LIKE '"+lang+"-"+syn+"'")
	rows = cur.fetchall()

	for row in rows:

		cur.execute("SELECT * FROM `wei_ili_to_domains` WHERE `iliOffSet` LIKE 'ili-30-"+syn+"'")
		rows_dom = cur.fetchall()

		dom = ''

		for row_dom in rows_dom[:-1]:

			dom = dom + row_dom['domain']+"#"

		dom = dom + rows_dom[-1]['domain']

		synsets.append([dom,row['targetSynset'].replace(lang+"-", ""),row['relation'],"s"])


	cur.execute("SELECT * FROM `wei_"+lang+"_relation` WHERE `targetSynset` LIKE '"+lang+"-"+syn+"'")
	rows = cur.fetchall()

	for row in rows:

		cur.execute("SELECT * FROM `wei_ili_to_domains` WHERE `iliOffSet` LIKE 'ili-30-"+syn+"'")
		rows_dom = cur.fetchall()

		dom = ''

		for row_dom in rows_dom[:-1]:

			dom = dom + row_dom['domain']+"#"

		dom = dom + rows_dom[-1]['domain']

		synsets.append([dom,row['sourceSynset'].replace(lang+"-", ""),row['relation'],"t"])


	for synset in synsets:

		cmd = "python ponderateSynset.py --synset "+synset[1]+" "+deb
		result_pond = subprocess.check_output(cmd, shell=True).strip()

		cmd = "python infoVariantSynset.py --synset "+synset[1]
		result_var = subprocess.check_output(cmd, shell=True).strip()

		print "++++++++++++++++++++++"

		print synset[0]+"$"+result_pond

		if relinfo: print synset[1]+"$"+str(synset[2])+"$"+synset[3]

		if variant: print "Variants: "+result_var
