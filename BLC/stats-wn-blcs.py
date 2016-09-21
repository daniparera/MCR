#!/usr/bin/python

import time
from collections import OrderedDict
import textwrap, argparse

# build a path for synset, from synset to top of the hyper's chain. path's list contain information about sons and weight.
def pathList(synset,infoList,initialSynset):

	# if no more hypers, base case, store information
	if synsets[synset][1] == []:
		try:
			globalPathlList[initialSynset].append(infoList+[[synset]])
		except KeyError:
			globalPathlList[initialSynset] = [infoList+[[synset]]]

	for hyper in synsets[synset][1]:
		pathList(hyper,infoList+[[synset]],initialSynset)

def exploreHyperTree(synset):

		if len(synsets[synset][1]) == 0:
			return 1
		else:
			# follow analisys of next hyper
			values = []
			for hyper in synsets[synset][1]:
				if log:
					print "synset -> "+synset
					print "--------> "+str(synsets[synset][1])
					print "hyper --> "+hyper
				values.append(exploreHyperTree(hyper) + 1)
			return max(values)
		print error

def exploreHypoTree(synset):

		if len(synsets[synset][2]) == 0:
			return 1
		else:
			# follow analisys of next hyper
			values = []
			for hypo in synsets[synset][2]:
				if log:
					print "synset -> "+synset
					print "--------> "+str(synsets[synset][2])
					print "hypo ---> "+hypo
				values.append(exploreHypoTree(hypo) + 1)
			return max(values)
		print error

if __name__ == '__main__':

	argument_parser = argparse.ArgumentParser(
	     prog='stats-wn-blcs.py',
	     formatter_class=argparse.RawDescriptionHelpFormatter,
	     description=textwrap.dedent('''\
		 Extract blcs statistical information from MCR
		 --------------------------------
		     example of use: $ python3 %(prog)s --infile dict/wn30/data.noun --outfile data/wn.stats --sonsfile dict/wn30/sons_n.txt [--log]
		                     $ python3 %(prog)s --infile dict/wn30/data.verb --outfile data/wn.stats --sonsfile dict/wn30/sons_v.txt [--log]
		 '''))


	argument_parser.add_argument('--outfile', dest='outfile', required=True, type=str , help='output file (required)')
	argument_parser.add_argument('--infile', dest='infile', action='append', required=True, type=str , help='input(s) file(s) (required)')
	argument_parser.add_argument('--sonsfile', dest='sonsfile', action='append', required=True, type=str , help='son\'s file(s) (required)')
	argument_parser.add_argument('--log', dest='log', action='store_true', help='Show log')

	args = argument_parser.parse_args()

	#---------------------------------------------------------------------------------------------------------

	infiles =  args.infile
	sonsfiles = args.sonsfile

	outfile = args.outfile
	log = args.log

	timestamp1 = time.time()

	sons = {}
	count_sons_v = 0
	count_sons_n = 0

	for f in sonsfiles:

		print "Loading "+f+"...\n";

		sfile = open(f,'r')
		content_file = sfile.readlines()

		for line in content_file:

			datalist = line.split()

			sons[datalist[0]] = int(datalist[1]) 

			if datalist[0][-1] == "n":
				count_sons_n = count_sons_n + 1
			elif datalist[0][-1] == "v":
				count_sons_v = count_sons_v + 1
			else:
				print "STRANGE KEY --> "+k
				exit()

		sfile.close()

	timestamp2 = time.time()
	print "This took %.2f seconds" % (timestamp2 - timestamp1)

	###############

	timestamp1 = time.time()

	synsets = {}
	count_synsets_n = 0
	count_synsets_v = 0

	for f in infiles:

		print "Loading "+f+"...\n"

		infile = open(f,'r')
		content_file = infile.readlines()

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

			senses = datalist[1]

			num_variants = int(datalist[3],16)
			variants = {}

			for idx in range(0, num_variants):

				variants[datalist[4+2*idx]] = datalist[5+2*idx] 
			
			# store in the same synset's structure a list composed by ... [sons,hypernim's list,hyponim's list,weight]
			synsets[datalist[0]+"-"+datalist[2]] = [sons[datalist[0]+"-"+datalist[2]],hypers,hypos,weight]

			if datalist[2] == "n":
				count_synsets_n = count_synsets_n + 1
			elif datalist[2] == "v":
				count_synsets_v = count_synsets_v + 1
			else:
				print "STRANGE KEY --> "+datalist[0]+"-"+datalist[2]
				exit()

		infile.close()

	synsets_ord = OrderedDict(sorted(synsets.items(), key=lambda t: t[0], reverse=False))

	timestamp2 = time.time()
	print "This took %.2f seconds" % (timestamp2 - timestamp1)

	timestamp1 = time.time()

	print "Generating synset's depth in hyper tree...\n";

	#depth = {}
	#
	#for syn,info in synsets.items():
	#
	#	depth[syn] = exploreHyperTree(syn)

	globalPathlList = {}

	for syn,info in synsets.items():

		pathList(syn,[],syn)

	timestamp2 = time.time()
	print "This took %.2f seconds" % (timestamp2 - timestamp1)

	########

	timestamp1 = time.time()

	g_max_sons = 0
	g_max_hypo = 0
	g_max_weight = 0
	g_max_weight_n = 0
	g_max_weight_v = 0

	g_min_sons = 1000000
	g_min_hypo = 1000000
	g_min_weight = 1000000
	g_min_weight_n = 1000000
	g_min_weight_v = 1000000

	g_acc_sons = 0
	g_acc_hypo = 0
	g_acc_weight = 0
	g_acc_weight_n = 0
	g_acc_weight_v = 0
	g_acc_max_depth = 0
	g_acc_min_depth = 0
	g_acc_depth = 0

	print "Writing "+outfile+"...\n";

	ofile = open(outfile+".stats",'w')

	ofile.write("SYNSET\t\tSONS\tMAX_H\tMIN_H\tMEAN_H\tHYPO\tRELATIONS\n")

	for k,v in synsets_ord.items():

		max_depth = 0
		min_depth = 1000000
		acc_depth = 0

		for tree in range(0,len(globalPathlList[k])):
			if max_depth < len(globalPathlList[k][tree]):
				max_depth = len(globalPathlList[k][tree])

		for tree in range(0,len(globalPathlList[k])):
			if min_depth > len(globalPathlList[k][tree]):
				min_depth = len(globalPathlList[k][tree])

		for tree in range(0,len(globalPathlList[k])):
			acc_depth = acc_depth + len(globalPathlList[k][tree])

		mean_depth = 1.0*acc_depth/len(globalPathlList[k])

		ofile.write(k+"\t"+str(v[0])+"\t"+str(max_depth)+"\t"+str(min_depth)+"\t"+str(round(mean_depth,2))+"\t"+str(len(v[2]))+"\t"+str(v[3])+"\n")

		# Calc global variables

		g_acc_max_depth = g_acc_max_depth + max_depth
		g_acc_min_depth = g_acc_min_depth + min_depth
		g_acc_depth = g_acc_depth + mean_depth

		if g_max_sons < v[0]:
			g_max_sons = v[0]

		if g_min_sons > v[0]:
			g_min_sons = v[0]

		g_acc_sons = g_acc_sons + v[0]

		if g_max_hypo < len(v[2]):
			g_max_hypo = len(v[2])

		if g_min_hypo > len(v[2]):
			g_min_hypo = len(v[2])

		g_acc_hypo = g_acc_hypo + len(v[2])

		if g_max_weight < v[3]:
			g_max_weight = v[3]

		if g_min_weight > v[3]:
			g_min_weight = v[3]

		g_acc_weight = g_acc_weight + v[3]

		if k[-1] == "n":
			if g_max_weight_n < v[3]:
				g_max_weight_n = v[3]
			if g_min_weight_n > v[3]:
				g_min_weight_n = v[3]
			g_acc_weight_n = g_acc_weight_n + v[3]

		elif k[-1] == "v":  
			if g_max_weight_v < v[3]:
				g_max_weight_v = v[3]
			if g_min_weight_v > v[3]:
				g_min_weight_v = v[3]
			g_acc_weight_v = g_acc_weight_v + v[3]
		else:
			print "STRANGE KEY --> "+k
			exit()

	ofile.write("\n")
	ofile.write("MIN_SONS  -> "+str(g_min_sons)      + "\t\tMAX_SONS  -> "+str(g_max_sons)+"\n")
	ofile.write("MIN_HYPO  -> "+str(g_min_hypo)      + "\t\tMAX_HYPO  -> "+str(g_max_hypo)+"\n")
	ofile.write("MIN_REL   -> "+str(g_min_weight)    + "\t\tMAX_REL   -> "+str(g_max_weight)+"\n")

	if count_synsets_n != 0:
		ofile.write("MIN_REL_N -> "+str(g_min_weight_n) + "\t\tMAX_REL_N -> "+str(g_max_weight_n)+"\n")
	if count_synsets_v != 0:
		ofile.write("MIN_REL_V -> "+str(g_min_weight_v) + "\t\tMAX_REL_V -> "+str(g_max_weight_v)+"\n\n")

	ofile.write("ACC_SONS   / # SYNSETS   -> "+str(1.0*g_acc_sons/len(synsets))+"\n")
	ofile.write("ACC_MAX_H  / # SYNSETS   -> "+str(1.0*g_acc_max_depth/len(synsets))+"\n")
	ofile.write("ACC_MIN_H  / # SYNSETS   -> "+str(1.0*g_acc_min_depth/len(synsets))+"\n")
	ofile.write("ACC_H      / # SYNSETS   -> "+str(1.0*g_acc_depth/len(synsets))+"\n")
	ofile.write("ACC_HYPO   / # SYNSETS   -> "+str(1.0*g_acc_hypo/len(synsets))+"\n")
	ofile.write("ACC_REL    / # SYNSETS   -> "+str(1.0*g_acc_weight/len(synsets))+"\n")

	if count_synsets_n != 0:
		ofile.write("ACC_REL_N  / # SYNSETS_N -> "+str(1.0*g_acc_weight_n/count_synsets_n)+"\n")
	if count_synsets_v != 0:
		ofile.write("ACC_REL_V  / # SYNSETS_V -> "+str(1.0*g_acc_weight_v/count_synsets_v)+"\n\n")

	if log:
		ofile.write(str(g_acc_sons)+"\t")
		ofile.write(str(g_acc_max_depth)+"\t")
		ofile.write(str(g_acc_min_depth)+"\t")
		ofile.write(str(g_acc_depth)+"\t")
		ofile.write(str(g_acc_hypo)+"\t")
		ofile.write(str(g_acc_weight)+"\t")
		ofile.write(str(g_acc_weight_n)+"\t")
		ofile.write(str(g_acc_weight_v)+"\t\t")
		ofile.write(str(len(synsets))+"\t")
		ofile.write(str(count_sons_n)+"\t")
		ofile.write(str(count_sons_v)+"\t")

	if count_sons_n != count_synsets_n:
		ofile.write("NOUNS NO CONCORDANCE\n")
	if count_sons_v != count_synsets_v:
		ofile.write("VERBS NO CONCORDANCE\n")
	if count_sons_n+count_synsets_v != len(synsets):
		ofile.write("GENERAL NO CONCORDANCE\n")

	ofile.close()

	timestamp2 = time.time()
	print "This took %.2f seconds" % (timestamp2 - timestamp1)

	print "Finished.\n"

