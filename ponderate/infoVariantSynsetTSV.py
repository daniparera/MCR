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
# join variants in a single string separated by "/". Check that query dont return empty set.
variants = "/".join(x.split()[0] + "_" + x.split()[1] for x in tmp.splitlines() if x)

print variants
