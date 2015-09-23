#!/usr/bin/python

import os, subprocess
import textwrap, argparse

parserarg = argparse.ArgumentParser(
     prog='ponderateSynsetWraped',
     formatter_class=argparse.RawDescriptionHelpFormatter,
     description=textwrap.dedent('''\
         calculate ponderated vectors for specific synset
         --------------------------------
             example of use $python3 %(prog)s --synset synset [[--debug]]
         '''))

parserarg.add_argument('--debug', action='store_false', default='TRUE', help='to show aditional information')
parserarg.add_argument('--synset', dest='synset', required=True, default='', type=str , help='input synsets (required)')

args = parserarg.parse_args()

debug = not(bool(args.debug))
if debug:	deb="--debug"
else:		deb=""

syn = args.synset

cmd = "python ponderateSynset.py --synset "+syn+" "+deb

result = subprocess.check_output(cmd, shell=True).strip().decode('utf-8')

print("++++++++++++++++++++++")

print(result)
