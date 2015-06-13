#!/usr/bin/python

import subprocess
import textwrap, argparse

parserarg = argparse.ArgumentParser(
     prog='infoVariantSynset',
     formatter_class=argparse.RawDescriptionHelpFormatter,
     description=textwrap.dedent('''\
         get variant info for specific synset
         --------------------------------
             example of use $python3 %(prog)s --synset synset [[--debug]]
         '''))

parserarg.add_argument('--synset', dest='synset', required=True, default='', type=str , help='input synsets (required)')

args = parserarg.parse_args()
syn = args.synset

cmd = "fgrep "+syn+" data/wei_eng-30_variant.tsv | nawk '{print $1,$2}'"
tmp = subprocess.check_output(cmd, shell=True)

variants = ''

for variant in tmp.splitlines()[:-1]:

	aux = variant.split()
	variants = variants + aux[0] + "_" + aux[1] + "/"

variant = tmp.splitlines()[-1]
aux = variant.split()

print variants + aux[0] + "_" + aux[1]
