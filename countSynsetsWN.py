#!/usr/bin/python

from collections import Counter
import textwrap, argparse

# to get POS correspondence in sense.index file
def translation_ss_type(ss):

	if int(ss) == 1:
		return 'n'
	if int(ss) == 2:
		return 'v'
	if int(ss) == 3:
		return 'a'
	if int(ss) == 4:
		return 'r'
	if int(ss) == 5:
		return 'a'

if __name__ == '__main__':

	argument_parser = argparse.ArgumentParser(
	     prog='countSynsetsWN.py',
	     formatter_class=argparse.RawDescriptionHelpFormatter,
	     description=textwrap.dedent('''\
		 Extract synsets/words stats from WN index.sense files
		 --------------------------------
		     python countSynsetsWN.py --sensefile index-file
		     example of use $python3 %(prog)s --sensefile dict/wn31/index.sense
		 '''))

	argument_parser.add_argument('--sensefile', dest='sensefile', required=True, type=str , help='sense file (required)')

	args = argument_parser.parse_args()

	#---------------------------------------------------------------------------------------------------------
	#
	# 
	#

	sensefile = args.sensefile

	lemmas = {}
	lemmas['n'] = {}
	lemmas['v'] = {}
	lemmas['a'] = {}
	lemmas['r'] = {}

	synsets = {}
	synsets['n'] = {}
	synsets['v'] = {}
	synsets['a'] = {}
	synsets['r'] = {}

	
	sfile = open(sensefile,'r')
	content_file = sfile.readlines()
	
	for line in content_file:

		sense_key,synset_offset,sense_number,tag_cnt = line.split()

		lemma,lex_sense = sense_key.split('%')

		ss_type,lex_filenum,lex_id,head_word,head_id = lex_sense.split(':')

		try:
			lemmas[translation_ss_type(ss_type)][lemma] = 1
		except KeyError:
			lemmas[translation_ss_type(ss_type)][lemma] = 0

		try:
			synsets[translation_ss_type(ss_type)][synset_offset].append(lemma+' '+sense_number)
		except KeyError:
			synsets[translation_ss_type(ss_type)][synset_offset] = [lemma+' '+sense_number]

	
	sfile.close()

	c_uniques = 0
	c_synsets = 0
	c_pairs = 0

	pairs = {}
	pairs['r'] = 0
	pairs['v'] = 0
	pairs['a'] = 0
	pairs['n'] = 0

	for k1,v1 in lemmas.items():

		print "UNIQUE : "+k1+" -> "+str(len(v1.keys()))
		c_uniques += len(v1.keys())

	print "UNIQUE TOTAL -> "+str(c_uniques)+"\n"

	for k1,v1 in synsets.items():

		print "SYNSETS "+k1+" -> "+str(len(v1.keys()))
		c_synsets += len(v1.keys())

		for k2,v2 in v1.items():

			pairs[k1] += len(v2)
			c_pairs += len(v2)

	print "SYNSETS TOTAL -> "+str(c_synsets)+"\n"

	print "Total Word-Sense Pairs -> "+str(pairs)
	print "Total Word-Sense Pairs TOTAL -> "+str(c_pairs)


