#!/usr/bin/python

import textwrap, argparse
import os, sys, subprocess
from collections import OrderedDict
import pymysql

#can use this also
#import MySQLdb

parserarg = argparse.ArgumentParser(
     prog='synsetRelationsDB',
     formatter_class=argparse.RawDescriptionHelpFormatter,
     description=textwrap.dedent('''\
         calculate ponderated vectors of relations for specific synset, relations are extracted from MCR database
         --------------------------------
             example of use $python3 %(prog)s --synset synset --host host --user user --pwd password --db database [[--debug --variant --relinfo]]
         '''))

# DB parameters
parserarg.add_argument('--host', dest='host_db', required=True, type=str , help='host url\'s database (required)')
parserarg.add_argument('--user', dest='user_db', required=True, type=str , help='user\'s database (required)')
parserarg.add_argument('--pwd', dest='pwd_db', required=True, type=str , help='password\'s database (required)')
parserarg.add_argument('--db', dest='db_db', required=True, type=str , help='database\'s selection (required)')

# information parameters
parserarg.add_argument('--debug', action='store_false', default='TRUE', help='to show debug information')
parserarg.add_argument('--weka', action='store_false', default='TRUE', help='to store in weka format')
parserarg.add_argument('--variant', action='store_false', default='TRUE', help='to show variant information')
parserarg.add_argument('--relinfo', action='store_false', default='TRUE', help='to show additional relation information')

# Required parameters
parserarg.add_argument('--synset', dest='synset', required=True, default='', type=str , help='input synsets (required)')

args = parserarg.parse_args()

debug = not(bool(args.debug))
weka = not(bool(args.weka))
variant = not(bool(args.variant))
relinfo = not(bool(args.relinfo))

if debug and not weka:	deb="--debug"
else:			deb=""

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

if not os.path.exists('data/xwnd-30g'):
	print("Download and descompres xwnd-30g file in data directory")
	exit()

# To resolve issue in python 3, renamed raw_input
try: input = raw_input
except NameError: pass

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
if debug: print(languages)
if debug: print(languages[1])

#print("Synset: "+syn)
#
#cmd = "python ponderateSynset.py --synset "+syn
#result_pond = subprocess.check_output(cmd, shell=True).strip().decode('utf-8')
#
#print("PonderaciO: "+result_pond)

cmd = "python infoVariantSynsetDB.py --host "+args.host_db+" --user "+args.user_db+" --pwd "+args.pwd_db+" --db "+args.db_db+" --synset "+syn
#cmd = "python infoVariantSynsetTSV.py --synset "+syn
result_var = subprocess.check_output(cmd, shell=True).strip().decode('utf-8')

if variant: print("Variants: "+result_var)

acc_delete = ''
acc_names = ''

if weka:

	categories_pond = {}
	categories_mcr = {}
	with open("data/xwndg.txt", "r") as cat_file:
		for line in cat_file:
			categories_pond[line.split('.')[0]] = 0
			categories_mcr[line.split('.')[0]] = 0

languages = [languages[1]] ## Only second language, english, comment this line to get all languages.

for lang in languages:

	synsets = []

	cur.execute("SELECT * FROM `wei_"+lang+"_relation` WHERE `sourceSynset` LIKE '"+lang+"-"+syn+"'")
	rows = cur.fetchall()

	for row in rows:

		rlsyn =  row['targetSynset'].replace(lang+"-", "")
		rl = row['relation']

		cur.execute("SELECT * FROM `wei_ili_to_domains` WHERE `iliOffSet` LIKE 'ili-30-"+rlsyn+"'")
		rows_dom = cur.fetchall()

		# join domains in a single string separated by "#". Check that query dont return empty set.
		dom = ''
		dom = "#".join(x['domain'] for x in rows_dom if x)

		synsets.append([dom,rlsyn,rl,"s"])


	cur.execute("SELECT * FROM `wei_"+lang+"_relation` WHERE `targetSynset` LIKE '"+lang+"-"+syn+"'")
	rows = cur.fetchall()

	for row in rows:

		rlsyn =  row['sourceSynset'].replace(lang+"-", "")
		rl = row['relation']

		cur.execute("SELECT * FROM `wei_ili_to_domains` WHERE `iliOffSet` LIKE 'ili-30-"+rlsyn+"'")
		rows_dom = cur.fetchall()

		# join domains in a single string separated by "#". Check that query dont return empty set.
		dom = ''
		dom = "#".join(x['domain'] for x in rows_dom if x)

		synsets.append([dom,rlsyn,rl,"t"])

	print("Synsets: "+str(synsets))

	# to walk around all the constructed list in step before
	for synset in synsets:

		cmd = "python ponderateSynset.py --synset "+synset[1]+" "+deb
		result_pond = subprocess.check_output(cmd, shell=True).strip().decode('utf-8')

		cmd = "python infoVariantSynsetDB.py --host "+args.host_db+" --user "+args.user_db+" --pwd "+args.pwd_db+" --db "+args.db_db+" --synset "+synset[1]
		#cmd = "python infoVariantSynsetTSV.py --synset "+synset[1]
		result_var = subprocess.check_output(cmd, shell=True).strip().decode('utf-8')

		if weka:

			if debug: sys.stderr.write("++++++++++++++++++++++\n")
			if debug: sys.stderr.write(synset[0]+"$"+result_pond+"\n")
			if debug: sys.stderr.write(synset[1]+"$"+str(synset[2])+"$"+synset[3]+"\n")
			if debug: sys.stderr.write("Variants: "+result_var+"\n")

			# check that domain field is not empty
			if synset[0]:
				for cat_mcr in synset[0].split("#"):
					categories_mcr[cat_mcr] = categories_mcr[cat_mcr] + 1
			for cat_pond in result_pond.split("#"):
				categories_pond[cat_pond] = categories_pond[cat_pond] + 1
			
		else:
			print("++++++++++++++++++++++")

			print(synset[0]+"$"+result_pond)

			if relinfo: print(synset[1]+"$"+str(synset[2])+"$"+synset[3])

			if variant: print("Variants: "+result_var)

if weka:
	# order dictionaries by key
	cat_mcr_ord = OrderedDict(sorted(categories_mcr.items(), key=lambda t: t[0], reverse=False))
	cat_pond_ord = OrderedDict(sorted(categories_pond.items(), key=lambda t: t[0], reverse=False))

	# genera new dictiobaries with index in last position

	index = 1
	cat_mcr_ord_key = dict()
	cat_mcr_ord_idx = dict()

	for k,v in cat_mcr_ord.items(): 		
		cat_mcr_ord_key[k] = (v,index)
		cat_mcr_ord_idx[k] = index
		index = index + 1

	index = 1
	cat_pond_ord_key = dict()
	cat_pond_ord_idx = dict()

	for k,v in cat_pond_ord.items(): 		
		cat_pond_ord_key[k] = (v,index)
		cat_pond_ord_idx[k] = index
		index = index + 1

	# order dictionaries by value, number of occurences
	cat_mcr_ord_val = OrderedDict(sorted(cat_mcr_ord_key.items(), key=lambda t: t[1][0], reverse=True))
	cat_pond_ord_val = OrderedDict(sorted(cat_pond_ord_key.items(), key=lambda t: t[1][0], reverse=True))

	for k,v in cat_mcr_ord_val.items(): 
		if v[0] == 0: 
			del cat_mcr_ord_val[k] 	# if no ocurrences of category, delete element
			del cat_mcr_ord_idx[k]

	for k,v in cat_pond_ord_val.items(): 
		if v[0] == 0: 
			del cat_pond_ord_val[k] 	# if no ocurrences of category, delete element
			del cat_pond_ord_idx[k]

	# convert dictionaries in string
	categories_mcr_strVal = "#".join(map(str, cat_mcr_ord.values()))
	categories_pond_strVal = "#".join(map(str, cat_pond_ord.values()))

	print("CAT MCR: "+str(categories_mcr_strVal)+"\n$\nCAT POND: "+str(categories_pond_strVal))

	######################################################### #################################################################
																###
	choice = input("MCR:\n"+str(cat_mcr_ord_val.items())+"\nPOND:\n"+str(cat_pond_ord_val.items())+"\nANSWER: ")		###
																###
	# answer must be a single integer											###
	if choice.strip() == "": choice = -1											###
	elif len(choice) != 1 and len(choice) != 2 and len(choice) != 3: choice = -2						###
	elif not choice.isdigit(): choice = -2											###
																###
	######################################################### #################################################################

	# while answer is not correct, repeat it ##################################################################################
	while not int(choice) in cat_mcr_ord_idx.values() and not int(choice) in cat_pond_ord_idx.values():			###

		print("CHOICE"+ str(choice))
		if choice == -1:												###
			print("\n\nPlease. Select some option!! \n")								###
		else:														###
			print("\n\nPlease. Select one correct option!! \n")							###
																###
		choice = input("MCR:\n"+str(cat_mcr_ord_val.items())+"\nPOND:\n"+str(cat_pond_ord_val.items())+"\nANSWER: ")	###
																###
		# answer must be a single integer										###
		if choice.strip() == "": choice = -1										###
		elif len(choice) != 1 and len(choice) != 2 and len(choice) != 3: choice = -2					###
		elif not choice.isdigit(): choice = -2										###


	for k,v in cat_mcr_ord_val.items(): 
		if v[1] == int(choice): print("\nSelect: "+k+" ! \n")

	for k,v in cat_pond_ord_val.items(): 
		if v[1] == int(choice): print("\nSelect: "+k+" ! \n")

