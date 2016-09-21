#!/usr/bin/python

import sys,time
import textwrap, argparse

# build a tree with hypernim's information
def buildTree(syn,level):

	# get general information about weight and sons, with necesary identation (level)
	out = "\t" * level + syn + ", " + " weight: " + str(synsets[syn][1]) + " sons: " + synsets[syn][0]

	# if exists, catch blc information of the synset
	try:
		out = out + " blc: " + blcs_rel[syn]
	except KeyError:
		out = out + " NOBLC "

	# get general information about variants
	out = out + " variants: " + " ".join(synsets[syn][4])

	# if synseet is a blc, catch number of synsets that it represents
	try:
		out = out + "\n" + "\t" * level + " BLC, represents: " + n_blcs[syn]
	except KeyError:
		out = out + " "

	print out

	# follow analisys of next hyper
	for hyper in synsets[syn][2]:

		buildTree(hyper,level+1)

if __name__ == '__main__':

	argument_parser = argparse.ArgumentParser(
		 prog='show_synset_tree-blc.py',
		 formatter_class=argparse.RawDescriptionHelpFormatter,
		 description=textwrap.dedent('''\
		 show tree of blcs
		 --------------------------------
			 example of use: $ python3 %(prog)s --blcsfile blcs.list --inputfile data.data --sonsfile sons.txt [[--synset synset]]
		 '''))

	argument_parser.add_argument('--blcsfile', dest='blcsfile', required=True, type=str , help='file of blcs (required)')
	argument_parser.add_argument('--sonsfile', dest='sonsfile', required=True, type=str , help='file of sons (required)')
	argument_parser.add_argument('--infile', dest='infile', required=True, type=str , help='file of wordnet (required)')

	argument_parser.add_argument('--select', dest='select', required=False, type=str , help='synset to search for (optional)')
	argument_parser.add_argument('--represent', dest='represent', action='store_true', help='show who is represented by synset selected ')

	argument_parser.add_argument('--hypos', dest='hypos', action='store_true', help='show represented by synset\'s hyponims')
	argument_parser.add_argument('--hypers', dest='hypers', action='store_true', help='show represented by synset\'s hypernims')

	argument_parser.add_argument('--log', dest='log', action='store_true', help='Show log')
	#argument_parser.add_argument('-pos', dest='pos', choices=['n','v'], help='POS tag', required=True)

	args = argument_parser.parse_args()


	blcsfile =  args.blcsfile
	sonsfile = args.sonsfile
	infile = args.infile

	select = args.select
	represent = args.represent

	hypers = args.hypers
	hypos = args.hypos

	log = args.log

	if log:
		print len(sys.argv)

	if (represent == 1 or hypers == 1 or hypos == 1) and select is None:
		print "No have sense put represent/hypos/hypers and no select synset... \n"
		exit()

	if len(sys.argv) != 7 and len(sys.argv) != 9 and len(sys.argv) != 10:
		print "Incorrect number of parameters.\nUsage:\npython tree-blc.py inputfile sonsfile infile [select] [represent/hypos/hypers] \n"
		exit()

	##############################

	if log:
		timestamp1 = time.time()
		print "Loading "+blcsfile+".rel and "+blcsfile+".list files...\n";

	# construct array with relation with synset and blc
	blcs_rel = {}
	blcs_parents = {}

	sfile = open(blcsfile+".rel",'r')
	content_file = sfile.readlines()

	for line in content_file:

		datalist = line.split("\t")

		blcs_rel[datalist[0]] = datalist[1].rstrip()
		blcs_parents[datalist[1].rstrip()] = datalist[0]

	sfile.close()

	# construct array with number of blcs that represents blcs synsets.
	n_blcs = {}

	sfile = open(blcsfile+".list",'r')
	content_file = sfile.readlines()

	for line in content_file:

		datalist = line.split()

		n_blcs[datalist[0]] = datalist[2]

	sfile.close()

	if log:
		timestamp2 = time.time()
		print "This took %.2f seconds" % (timestamp2 - timestamp1)

	##############################

		timestamp1 = time.time()
		print "Loading "+sonsfile+"...\n";

	synsets = {}

	# Load data from sons file

	sfile = open(sonsfile,'r')
	content_file = sfile.readlines()

	for line in content_file:

		datalist = line.split()

		try:
			synsets[datalist[0]] = datalist[1] 
		except KeyError:
			continue

	sfile.close()

	if log:
		timestamp2 = time.time()
		print "This took %.2f seconds" % (timestamp2 - timestamp1)

	##############################

		timestamp1 = time.time()
		print "Loading "+infile+"...\n"

	infile = open(infile,'r')
	content_file = infile.readlines()

	# Load data from wordnet file

	for line in content_file[29:]:

		data_aux = line.split("|")
		datalist = data_aux[0].split()

		pointer = 4 + 2 * int(datalist[3],16)
		weight = int(datalist[pointer])

		#print "syn -> "+str(datalist[0])+"-"+datalist[2]+" pointer -> "+str(pointer)+" weight -> "+weight+"\n"

		hypers = []

		for idx,data in enumerate(datalist):

			if data == "@" or data == "@i":

				hypers.append(datalist[idx+1]+"-"+datalist[idx+2])

		hypos = []

		for idx,data in enumerate(datalist):

			if data == "~" or data == "~i":

				hypos.append(datalist[idx+1]+"-"+datalist[idx+2])

		num_variants = int(datalist[3],16)
		variants = {}

		for idx in range(0, num_variants):

			variants[datalist[4+2*idx]] = datalist[5+2*idx]
			
		# store in the same synset's structure a list composed by ... [sons,weight,hypernim's list]
		synsets[str(datalist[0])+"-"+datalist[2]] = [synsets[datalist[0]+"-"+datalist[2]],weight,hypers,hypos,variants]

	infile.close()

	if log:
		timestamp2 = time.time()
		print "This took %.2f seconds" % (timestamp2 - timestamp1)

	##############################

		print "Build tree...\n"
		timestamp1 = time.time()

	# if NOT select a specific synset, build all tree
	if select is None:

		for syn,info in synsets.items():

			if type(info) is list:
				if int(info[0]) == 0:	# no sons is leaf of hypernims tree

					buildTree(syn,0)
					print "\n##################################################################\n"
	elif represent == 1:
		for syn,blc in blcs_rel.items():
			if blc == select:
				buildTree(syn,0)
				print "\n##################################################################\n"
	elif hypos == 1:
		for hypo in synsets[select][3]:
			buildTree(hypo,0)
			print "\n##################################################################\n"
	elif hypers == 1:
		for hyper in synsets[select][2]:
			buildTree(hyper,0)
			print "\n##################################################################\n"
	else:
		buildTree(select,0)

	if log:
		timestamp2 = time.time()
		print "This took %.2f seconds" % (timestamp2 - timestamp1)

		timestamp1 = time.time()
		print "Finished.\n"
