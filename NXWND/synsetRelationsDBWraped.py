#!/usr/bin/python

import os, subprocess
import textwrap, argparse

parserarg = argparse.ArgumentParser(
     prog='synsetRelationsDBWraped',
     formatter_class=argparse.RawDescriptionHelpFormatter,
     description=textwrap.dedent('''\
         calculate ponderated vectors of relations for a list of synset, relations are extracted from MCR database (Encapsulated version)
         --------------------------------
             example of use $python3 %(prog)s --file synsets.txt --host host --user user --pwd password --db database [[--debug --variant --relinfo]]
         '''))

parserarg.add_argument('--host', dest='host_db', required=True, type=str , help='host url\'s database (required)')
parserarg.add_argument('--user', dest='user_db', required=True, type=str , help='user\'s database (required)')
parserarg.add_argument('--pwd', dest='pwd_db', required=True, type=str , help='password\'s database (required)')
parserarg.add_argument('--db', dest='db_db', required=True, type=str , help='database\'s selection (required)')

parserarg.add_argument('--debug', action='store_false', default='TRUE', help='to show debug information')
parserarg.add_argument('--weka', action='store_false', default='TRUE', help='to store in weka format')
parserarg.add_argument('--variant', action='store_false', default='TRUE', help='to show variant information')
parserarg.add_argument('--relinfo', action='store_false', default='TRUE', help='to show additional relation information')

parserarg.add_argument('--file', dest='input_file', required=True, default='', type=str , help='input synsets data file (required)')
# TODO, synsets or file of synsets to input parameter
#parserarg.add_argument('--synset', dest='synset', required=True, default='', type=str , help='input synsets (required)')

args = parserarg.parse_args()

debug = not(bool(args.debug))
weka = not(bool(args.weka))
variant = not(bool(args.variant))
relinfo = not(bool(args.relinfo))

if debug:	deb="--debug"
else:		deb=""

if weka:	wek="--weka"
else:		deb=""

if variant:	var="--variant"
else:		var=""

if relinfo:	rinf="--relinfo"
else:		rinf=""

infile = open(args.input_file, 'r')

for syn in infile.read().splitlines():

	cmd = "python synsetRelationsDB.py --synset "+syn+" --host "+args.host_db+" --user "+args.user_db+" --pwd "+args.pwd_db+" --db "+args.db_db+" "+deb+" "+wek+" "+var+" "+rinf

	result = subprocess.check_output(cmd, shell=True).strip()

	print("----------------------")

	print(result)
