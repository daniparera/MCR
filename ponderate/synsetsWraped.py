#!/usr/bin/python

import os, sys, subprocess
import textwrap, argparse


parserarg = argparse.ArgumentParser(
     prog='synsetWraped',
     formatter_class=argparse.RawDescriptionHelpFormatter,
     description=textwrap.dedent('''\
         calculate ponderated vectors for specific synset
         --------------------------------
             example of use $python3 %(prog)s --synset synset [[--debug]]
         '''))

parserarg.add_argument('--host', dest='host_db', required=True, type=str , help='host url\'s database (required)')
parserarg.add_argument('--user', dest='user_db', required=True, type=str , help='user\'s database (required)')
parserarg.add_argument('--pwd', dest='pwd_db', required=True, type=str , help='password\'s database (required)')
parserarg.add_argument('--db', dest='db_db', required=True, type=str , help='database\'s selection (required)')

parserarg.add_argument('--debug', action='store_false', default='TRUE', help='to show debug information')
parserarg.add_argument('--weka', action='store_false', default='TRUE', help='to store in weka format')
parserarg.add_argument('--variant', action='store_false', default='TRUE', help='to show variant information')
parserarg.add_argument('--relinfo', action='store_false', default='TRUE', help='to show additional relation information')

parserarg.add_argument('--file', dest='input_file', required=True, default='', type=str , help='input synsets file (required)')

args = parserarg.parse_args()

debug = not(bool(args.debug))
weka = not(bool(args.weka))
variant = not(bool(args.variant))
relinfo = not(bool(args.relinfo))

wek, var, rli, deb, dbvars = ["", "", "", ""]

if weka: wek_str="--weka"	
if variant: var="--variant"	
if relinfo: rli="--relinfo"
if debug and not weka: bdeb="--debug"	
dbvars = " --host "+args.host_db+" --user "+args.user_db+" --pwd "+args.pwd_db+" --db "+args.db_db

#choose one of them
#db = MySQLdb.connect(host=args.host_db, user=args.user_db, passwd=args.pwd_db, db=args.db_db) 
#cur = db.cursor(MySQLdb.cursors.DictCursor) 

db = pymysql.connect(host=args.host_db, user=args.user_db, passwd=args.pwd_db, db=args.db_db) 
cur = db.cursor(pymysql.cursors.DictCursor) 

fname = args.input_file
input_file = open(fname, "r")

with open(fname) as f:
	content = f.readlines()

for syn in content:

	syn = syn.strip()

	cmd = "python ponderateSynset.py --synset "+syn+" "+deb
	result_syn = subprocess.check_output(cmd, shell=True).strip()

	cur.execute("SELECT * FROM `wei_ili_to_domains` WHERE `iliOffSet` LIKE 'ili-30-"+syn+"'")
	rows_dom = cur.fetchall()

	# join domains in a single string separated by "#". Check that query dont return empty set.
	dom_syn = ''
	dom_syn = "#".join(x['domain'] for x in rows_dom if x)

	cmd = "python synsetRelationsDB.py --synset "+syn+" "+deb+" --host "+args.host_db+" --user "+args.user_db+" --pwd "+args.pwd_db+" --db "+args.db_db
	result_rl = subprocess.check_output(cmd, shell=True).strip()

	if weka:

		print syn+result_syn+result_rl+dom_syn+result_rl

	else:

		if variant: 

			cmd = "python infoVariantSynsetDB.py --synset "+syn+" "+dbvars
			result_var = subprocess.check_output(cmd, shell=True).strip()

			print "Variants: "+result_var

		print "++++++++++++++++++++++"

		print "Syn: "+syn+" Pond: "+result_syn+" Dom: "+dom_syn+" Rl: "+result_rl
