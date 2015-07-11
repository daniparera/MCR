#!/usr/bin/python

import subprocess
import textwrap, argparse

parserarg = argparse.ArgumentParser(
     prog='sqlBLC.py',
     formatter_class=argparse.RawDescriptionHelpFormatter,
     description=textwrap.dedent('''\
         create a BLC data file from data stored in BLC datasets to import to MCR
         --------------------------------
             example of use $python3 %(prog)s
         '''))

output_file = open('sql/data.tsv', "w")

files = ['data/BLCnoun.rel','data/BLCverb.rel']

for f in files:

	input_file = open(f, "r")
	content_file = input_file.readlines()

	for line in content_file:
		source,target = line.rstrip().split('\t')

		if source == target: 	modif = '='
		else: 					modif = '+'

		spos = source.split('-')[-1]

		# blc \t iliOffset \t iliPos \t iliWnId \t modif
		output_file.write('ili-30-'+target + '\t' + 'ili-30-'+source + '\t' + spos + '\t' + 'eng-30' + '\t' + modif + '\n')

	input_file.close()
output_file.close()
