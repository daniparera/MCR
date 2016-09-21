#!/usr/bin/python

import re,time,os
from collections import Counter
from collections import OrderedDict
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

# build a path for synset, from synset to top of the hyper's chain. path's list
def buildBCLRel(synset,synset_list):

	# if no more hypers, base case, store information
	if synsets_hyperList[synset] == []:
		if synset in blcs_list:
			for syn in synset_list:
				blcs_rel[syn] = hyper
		else:
			blcs_rel[syn] = blcs_rel[syn]+" buit"

	for hyper in synsets_hyperList[synset]:
		if hyper in blcs_list:
			for syn in synset_list:
				blcs_rel[syn] = hyper
		else:
			buildBCLRel(hyper,synset_list+[synset])

if __name__ == '__main__':

	argument_parser = argparse.ArgumentParser(
	     prog='set-blc_lists.py',
	     formatter_class=argparse.RawDescriptionHelpFormatter,
	     description=textwrap.dedent('''\
		 create new relation blc's files from a list of blcs
		 --------------------------------
		     example of use: $ python3 %(prog)s --datafile dict/data.noun --blcsfile out/wn30/descmin020/all+gloss/BLCnoun.list --outfile out/wn30/descmin20/all+gloss/BLCnoun_set.rel [[--log]]
		                     $ python3 %(prog)s --datafile dict/data.verb --blcsfile out/wn30/descmin020/all+gloss/BLCverb.list --outfile out/wn30/descmin20/all+gloss/BLCverb_set.rel [[--log]]
		 '''))

	argument_parser.add_argument('--datafile', dest='datafile', required=True, type=str , help='input data file (required)')
	argument_parser.add_argument('--blcsfile', dest='blcsfile', required=True, type=str , help='blcs file (required)')

	argument_parser.add_argument('--outfile', dest='outfile', required=True, type=str , help='out file (required)')

	argument_parser.add_argument('--log', dest='log', action='store_true', help='Show log')

	args = argument_parser.parse_args()

	#---------------------------------------------------------------------------------------------------------
	#
	# 
	#

	outfile = args.outfile

	datafile =  args.datafile
	blcsfile = args.blcsfile

	log = args.log

	timestamp1 = time.time()

	#################################################### LOAD BLCs FILE

	blcs_list = {}

	print "Loading "+blcsfile+"...\n"
	
	sfile = open(sensefile,'r')
	content_file = sfile.readlines()
	
	for line in content_file:

		splited = line.split()

		blcs_list.append(splited[0])
	
	sfile.close()

	#################################################### LOAD DATA FILE

	timestamp1 = time.time()

	print "Loading "+datafile+"...\n"

	sfile = open(datafile,'r')
	content_file = sfile.readlines()

	for line in content_file:

		#prog = re.compile('^\d{8}')
		#result = prog.match(line)

		result = re.match('^\d{8}', line)

		if result:

			data_aux = line.split("|")
			datalist = data_aux[0].split()

			hypers = []

			for idx,data in enumerate(datalist):

				if data == "@" or data == "@i":

					hypers.append(datalist[idx+1]+"-"+datalist[idx+2])
			
			# store in the same synset's structure a list composed by ... [hypernim's list]
			synsets_hyperList[str(datalist[0])+"-"+datalist[2]] = hypers

	sfile.close()

	timestamp2 = time.time()
	print "This took %.2f seconds" % (timestamp2 - timestamp1)

	#################################################### GENERATE BLCS

	timestamp1 = time.time()

	print "Setting BLCs...\n"

	visited = []

	blcs_rel = {}

	# for every synset, create a list of paths
	for syn,info in synsets_hyperList.items():

		buildBCLRel(syn,[])

	timestamp2 = time.time()
	print "This took %.2f seconds" % (timestamp2 - timestamp1)

	#################################################### WRITE OUT FILE

	timestamp1 = time.time()

	print "Writing "+outfile+"...\n";

	blcs_ord = OrderedDict(sorted(blcs_rel.items(), key=lambda t: t[0], reverse=False))

	# create directories #####################

	dirs = outfile.split('/')
	acc_d = ''

	for d in dirs[:-1]:

		acc_d = acc_d+d+"/"
		if not os.path.exists(acc_d):
			os.makedirs(acc_d)

	##########################################

	ofile = open(outfile,'w')

	for k,v in blcs_ord.items():

		ofile.write(k+"\t"+str(v)+"\n")

	ofile.close()

	timestamp2 = time.time()
	print "This took %.2f seconds" % (timestamp2 - timestamp1)

	print "Finished.\n"

