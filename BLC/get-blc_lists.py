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


# get larger tree with maximum value
def get_largest_max(synset):

	tree,w_g,d_g = 0,0,0

	for path in globalPathlList[synset]:

		w_t,dis = 0,0

		for element in path:

			if w_t < element[2]: w_t = element[2]

		if w_g < w_t or (w_g == w_t and d_g < len(path)): w_g,d_g,select = w_t,len(path),tree
		tree = tree + 1

	return select

# get tree with maximum value nearest from initial synset
def get_nearest_max(synset):

	tree,w_g,d_g = 0,0,10000

	for path in globalPathlList[synset]:

		w_t,dis = 0,0

		for element in path:

			if w_t < element[2]: w_t,d_t = element[2],dis
			dis = dis + 1

		if w_g < w_t or (w_g == w_t and d_g > d_t): w_g,d_g,select = w_t,d_t,tree
		tree = tree + 1

	return select

# get tree with maximum value farthest from initial synset
def get_farthest_max(synset):

	tree,w_g,d_g = 0,0,0

	for path in globalPathlList[synset]:

		w_t,dis = 0,0

		for element in path:

			if w_t <= element[2]: w_t,d_t = element[2],dis
			dis = dis + 1

		if w_g < w_t or (w_g == w_t and d_g < d_t): w_g,d_g,select = w_t,d_t,tree
		tree = tree + 1

	return select

# get position of maxim in a tree
def get_position_max(path):

	w,p = 0,0

	for element in path:

		if w <= element[2]: w,p = element[2],dis
		dis = dis + 1

	return p


# build a path for synset, from synset to top of the hyper's chain. path's list contain information about sons and weight.
def buildPathList(synset,infoList,initialSynset):

	synset_sons = synsets[synset][0]
	synset_weight = synsets[synset][1]

	# if no more hypers, base case, store information
	if synsets[synset][2] == []:
		try:
			globalPathlList[initialSynset].append(infoList+[[synset,synset_sons,synset_weight]])
		except KeyError:
			globalPathlList[initialSynset] = [infoList+[[synset,synset_sons,synset_weight]]]

	for hyper in synsets[synset][2]:
		buildPathList(hyper,infoList+[[synset,synset_sons,synset_weight]],initialSynset)

# 3 variables for conditions: 
#		- weight.	it can be greater than maxlocal or not
#		- sons. 	it can be greater than sons_descmin or not
#		- hypers	it can be 0 or more than 0
# cases:
#		if weight is greater than maxlocal and had more hypers, explore next
#		if weight is smaller than maxlocal and sons of synset's child is greater than

def procesPathList(ksyn,tree,offset,blc_synsets):

	synset = globalPathlList[ksyn][tree][offset][0]
	synset_sons = globalPathlList[ksyn][tree][offset][1]
	synset_weight = globalPathlList[ksyn][tree][offset][2]

	synset_child = ""
	synset_child_sons = -1
	synset_child_weight = -1

	synset_child_ant_weight = -1
	synset_hyper_weight = -1

	# get weights and sons of other synsets, child 
	if len(blc_synsets) > 0:

		synset_child = globalPathlList[ksyn][tree][offset-1][0]
		synset_child_sons = globalPathlList[ksyn][tree][offset-1][1]
		synset_child_weight = globalPathlList[ksyn][tree][offset-1][2]

		if len(blc_synsets) > 1:

			synset_child_ant_weight = globalPathlList[ksyn][tree][offset-2][2]


	if offset < len(globalPathlList[ksyn][tree]) - 1:
		synset_hyper_weight = globalPathlList[ksyn][tree][offset+1][2]

	#if synsets[synset][2] != []:

	if log:
		print "INICI -> "+str(offset)
		print blc_synsets
		print len(globalPathlList[ksyn][tree])

		print "synset -> "+str(synset)
		print "weight -> "+str(synset_weight)

		print "synset_child -> "+synset_child
		print "synset_child_sons -> "+str(synset_child_sons)
		print "synset_child_weight -> "+str(synset_child_weight)

		print "synset_child_ant_weight -> "+str(synset_child_ant_weight)
		print "synset_hyper_weight -> "+str(synset_hyper_weight)

	# decrease phase, previously increase phase, and minimum sons
	if synset_child_sons >= sons_descmin and (synset_weight < synset_child_weight or (synset_weight == synset_child_weight and synset_weight > synset_hyper_weight) ) and synset_child_weight >= synset_child_ant_weight and synset_child_ant_weight > 0:

		if log:
			print "candidate to update blcs list"

		blc_synsets.pop()

		#blc_parent = blc_synsets.pop()
		#blc_parent = synset_child

		for idx,child in enumerate(blc_synsets):
			if log:
				print "blcs["+child+"] => "+synset_child+",  distance "+str(len(blc_synsets) - idx)+", weight "+str(synsets[synset_child][1])
			try: 
				# if new distance between synset and blc is smaller than previous OR equal but weight is bigger than previous...
				if blcs['dis'][child] > (len(blc_synsets) - idx) or (blcs['dis'][child] == (len(blc_synsets) - idx) and blcs['val'][child] < synsets[synset_child][1]):
					if log:
						print " update, old blcs["+child+"] parent "+blcs['rel'][child]+" value distance "+str(blcs['dis'][child])+" value weight "+str(blcs['val'][child])
						print " update, new blcs["+child+"] parent "+synset_child+" value distance "+str(len(blc_synsets) - idx)+" value weight "+str(synsets[synset_child][1])
					blcs['rel'][child] = synset_child
					blcs['val'][child] = int(synsets[synset_child][1])
					blcs['dis'][child] = len(blc_synsets) - idx
				else:
					if log:
						print " NO update, blcs["+child+"] parent "+blcs['rel'][child]+" value distance "+str(blcs['dis'][child])+" value weight "+str(blcs['val'][child])
			# key don't exist, store new value
			except KeyError:
				if log:
					print " NOT exist, created "
				blcs['rel'][child] = synset_child	
				blcs['val'][child] = int(synsets[synset_child][1])
				blcs['dis'][child] = len(blc_synsets) - idx

		procesPathList(ksyn,tree,offset,[synset_child])

	# last path's element, nothhig to do if blc already assigned. otherwise
	elif offset == len(globalPathlList[ksyn][tree]) - 1:

		blc_synsets.append(synset)

		#blc_parent = synset

		for idx,child in enumerate(blc_synsets):
			if log:
				print "blcs["+child+"] => "+synset+", distance "+str(len(blc_synsets) - idx - 1)+", weight "+str(synsets[synset][1])
			try:
				# if new distance between synset and blc is smaller than previous OR equal but weight is bigger than previous...
				if blcs['dis'][child] > (len(blc_synsets) - idx - 1) or (blcs['dis'][child] == (len(blc_synsets) - idx - 1) and blcs['val'][child] < synsets[synset][1]):
					if log:
						print " update, old blcs["+child+"] parent "+blcs['rel'][child]+" value distance "+str(blcs['dis'][child])+" value weight "+str(blcs['val'][child])
						print " update, new blcs["+child+"] parent "+synset+" value distance "+str(len(blc_synsets) - idx - 1)+" value weight "+str(synsets[synset][1])
						print " NO UPDATE, INFORMATION PRESENT "
				else:
					if log:
						print " NO update, blcs["+child+"] parent "+blcs['rel'][child]+" value distance "+str(blcs['dis'][child])+" value weight "+str(blcs['val'][child])
			# key don't exist, store new value
			except KeyError:
				if log:
					print " NOT exist, created "
				blcs['rel'][child] = synset	
				blcs['val'][child] = int(synsets[synset][1])
				blcs['dis'][child] = len(blc_synsets) - idx - 1

	# NO conditions, next
	else:
		procesPathList(ksyn,tree,offset+1,blc_synsets+[synset])

def procesPathList_globalMaxim(ksyn,tree):

	pos,w,maxPos,ln = 0,0,0,len(globalPathlList[ksyn][tree])

	for element in globalPathlList[ksyn][tree]:

		if w < element[2]: w,maxPos = element[2],pos
		pos = pos + 1


	synset_hyper = globalPathlList[ksyn][tree][ln-1][0]
	synset_hyper_sons = globalPathlList[ksyn][tree][ln-1][1]
	synset_hyper_weight = globalPathlList[ksyn][tree][ln-1][2]


	synset_maxPos = globalPathlList[ksyn][tree][maxPos][0]
	synset_maxPos_sons = globalPathlList[ksyn][tree][maxPos][1]
	synset_maxPos_weight = globalPathlList[ksyn][tree][maxPos][2]

	for pos in range(ln):

		synset = globalPathlList[ksyn][tree][pos][0]
		synset_sons = globalPathlList[ksyn][tree][pos][1]
		synset_weight = globalPathlList[ksyn][tree][pos][2]

		if pos < maxPos:

			if log:
				print "blcs["+synset+"] => "+synset_maxPos+", weight "+str(synsets[synset_maxPos][1])
			try: 
				# if weight is bigger than previous...
				if blcs['val'][synset] < synsets[synset_maxPos][1]:
					if log:
						print " update, old blcs["+synset+"] parent "+blcs['rel'][synset]+" value weight "+str(blcs['val'][synset])
						print " update, new blcs["+synset+"] parent "+synset_maxPos+" value weight "+str(synsets[synset_maxPos][1])
					blcs['rel'][synset] = synset_maxPos
					blcs['val'][synset] = int(synsets[synset_maxPos][1])
				else:
					if log:
						print " NO update, blcs["+synset+"] parent "+blcs['rel'][synset]+" value weight "+str(blcs['val'][synset])
			# key don't exist, store new value
			except KeyError:
				if log:
					print " NOT exist, created "
				blcs['rel'][synset] = synset_maxPos	
				blcs['val'][synset] = int(synsets[synset_maxPos][1])

		else:

			if log:
				print "blcs["+synset+"] => "+synset_hyper+", weight "+str(synsets[synset_hyper][1])
			try: 
				# if weight is bigger than previous...
				if blcs['val'][synset] < synsets[synset_hyper][1]:
					if log:
						print " update, old blcs["+synset+"] parent "+blcs['rel'][synset]+" value weight "+str(blcs['val'][synset])
						print " update, new blcs["+synset+"] parent "+synset_hyper+" value weight "+str(synsets[synset_hyper][1])
					blcs['rel'][synset] = synset_hyper
					blcs['val'][synset] = int(synsets[synset_hyper][1])
				else:
					if log:
						print " NO update, blcs["+synset+"] parent "+blcs['rel'][synset]+" value weight "+str(blcs['val'][synset])
			# key don't exist, store new value
			except KeyError:
				if log:
					print " NOT exist, created "
				blcs['rel'][synset] = synset_hyper	
				blcs['val'][synset] = int(synsets[synset_hyper][1])


if __name__ == '__main__':

	argument_parser = argparse.ArgumentParser(
	     prog='get-blc_lists.py',
	     formatter_class=argparse.RawDescriptionHelpFormatter,
	     description=textwrap.dedent('''\
		 build blc's files
		 --------------------------------
		     example of use: $ python3 %(prog)s --datafile dict/data.noun --sonsfile sons_all.txt --descmin {0..5..20..100} --weight all
		                     $ python3 %(prog)s --datafile dict/wn30/data.verb --sonsfile dict/wn30/sons_v.txt --glossfile dict/wn30/gloss.rel --outfile out/wn30/descmin100/all+gloss/BLCverb --descmin 20 --weight all+gloss 
		 '''))

	argument_parser.add_argument('--sonsfile', dest='sonsfile', required=True, type=str , help='sons file (required)')
	argument_parser.add_argument('--descmin', dest='descmin', required=True, type=str , help='minimum descendent threshold (required)')
	argument_parser.add_argument('--weight', dest='weight', required=True, type=str , choices=['all','gloss','all+gloss','freq','all+freq','gloss+freq','all+gloss+freq'], help='weight type (required)')
	argument_parser.add_argument('--filter_list', dest='filter_list', required=False, type=str , choices=['farthest_max','nearest_max','largest_max'], help='filter tree (optional)')

	argument_parser.add_argument('--globalmax', dest='globalmax', action='store_true', help='Maxim global option')

	argument_parser.add_argument('--datafile', dest='datafile', required=True, type=str , help='input data file (required)')
	argument_parser.add_argument('--sensefile', dest='sensefile', required=False, type=str , help='sense file (required for frequency weight option)')
	argument_parser.add_argument('--glossfile', dest='glossfile', required=False, type=str , help='gloss file (required for gloss weight option)')

	argument_parser.add_argument('--outfile', dest='outfile', required=True, type=str , help='out file of (required)')

	argument_parser.add_argument('--log', dest='log', action='store_true', help='Show log')

	args = argument_parser.parse_args()

	#---------------------------------------------------------------------------------------------------------
	#
	# 
	#

	outfile = args.outfile

	sonsfile = args.sonsfile
	sons_descmin = int(args.descmin)
	weight_opt = args.weight
	filter_list = args.filter_list

	globalmax = args.globalmax

	datafile =  args.datafile
	sensefile = args.sensefile
	glossfile = args.glossfile

	log = args.log

	if not sons_descmin >= 0:
		print "The minimum descendent threshold must be equal or higher than 0.\n"
		exit()

	timestamp1 = time.time()

	#################################################### LOAD SENSE FILE

	if weight_opt in ["freq","all+freq","gloss+freq","all+gloss+freq"] and sensefile is None:
		print "Frequency weight option need sensefile.\n"
		exit()
	elif weight_opt in ["freq","all+freq","gloss+freq","all+gloss+freq"]:

		synsets_frequency = {}
		lemma_synsets = {}

		print "Loading "+sensefile+"...\n"
	
		sfile = open(sensefile,'r')
		content_file = sfile.readlines()
	
		for line in content_file:

			sense_key,synset_offset,sense_number,tag_cnt = line.split()

			lemma,lex_sense = sense_key.split('%')

			ss_type,lex_filenum,lex_id,head_word,head_id = lex_sense.split(':')

			try:
				synsets_frequency[synset_offset+'-'+translation_ss_type(ss_type)] = synsets_frequency[synset_offset+'-'+translation_ss_type(ss_type)] + int(tag_cnt)
				lemma_synsets[synset_offset+'-'+translation_ss_type(ss_type)] = lemma_synsets[synset_offset+'-'+translation_ss_type(ss_type)] + ", " + lemma+' '+sense_number
			except KeyError:
				synsets_frequency[synset_offset+'-'+translation_ss_type(ss_type)] = int(tag_cnt)
				lemma_synsets[synset_offset+'-'+translation_ss_type(ss_type)] = lemma+' '+sense_number
	
		sfile.close()

	#################################################### LOAD GLOSS FILE

	if weight_opt in ["gloss","all+gloss","gloss+freq","all+gloss+freq"] and glossfile is None:
		print "gloss weight option need glossfile.\n"
		exit()
	elif weight_opt in ["gloss","all+gloss","gloss+freq","all+gloss+freq"]:

		gloss_synsets = {}

		print "Loading "+glossfile+"...\n"
	
		sfile = open(glossfile,'r')
		content_file = sfile.readlines()
	
		for line in content_file:

			synset_offset,rel_gloss = line.split()

			gloss_synsets[synset_offset] = int(rel_gloss)
	
		sfile.close()

	#################################################### LOAD SONS FILE

	print "Loading "+sonsfile+"...\n";

	sfile = open(sonsfile,'r')
	content_file = sfile.readlines()

	synsets = {}

	for line in content_file:

		datalist = line.split()

		try:
			synsets[datalist[0]] = int(datalist[1]) 
		except KeyError:
			continue

	sfile.close()

	timestamp2 = time.time()
	print "This took %.2f seconds" % (timestamp2 - timestamp1)

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

			pointer = 4 + 2 * int(datalist[3],16)

			# WEIGHT RELATED TO weight OPTION
			if weight_opt == "all":
				weight = int(datalist[pointer])
			elif weight_opt == "gloss":
				weight = gloss_synsets[str(datalist[0])+"-"+datalist[2]]
			elif weight_opt == "freq":
				weight = synsets_frequency[str(datalist[0])+"-"+datalist[2]]
			elif weight_opt == "all+gloss":
				weight = int(datalist[pointer])+gloss_synsets[str(datalist[0])+"-"+datalist[2]]
			elif weight_opt == "all+freq":
				weight = int(datalist[pointer])+synsets_frequency[str(datalist[0])+"-"+datalist[2]]
			elif weight_opt == "gloss+freq":
				weight = gloss_synsets[str(datalist[0])+"-"+datalist[2]]+synsets_frequency[str(datalist[0])+"-"+datalist[2]]
			elif weight_opt == "all+gloss+freq":
				weight = int(datalist[pointer])+gloss_synsets[str(datalist[0])+"-"+datalist[2]]+synsets_frequency[str(datalist[0])+"-"+datalist[2]]
			else:
				print "ERROR: not weight_opt present.\n"
				exit()

			#print "syn -> "+str(datalist[0])+"-"+datalist[2]+" pointer -> "+str(pointer)+" weight -> "+weight+"\n"

			hypers = []

			for idx,data in enumerate(datalist):

				if data == "@" or data == "@i":

					hypers.append(datalist[idx+1]+"-"+datalist[idx+2])

			senses = datalist[1]

			num_variants = int(datalist[3],16)
			variants = {}

			for idx in range(0, num_variants):

				variants[datalist[4+2*idx]] = datalist[5+2*idx]
			
			# store in the same synset's structure a list composed by ... [sons,weight,hypernim's list]
			synsets[str(datalist[0])+"-"+datalist[2]] = [synsets[datalist[0]+"-"+datalist[2]],weight,hypers,senses,variants]

	sfile.close()

	timestamp2 = time.time()
	print "This took %.2f seconds" % (timestamp2 - timestamp1)

	#################################################### GENERATE BLCS

	timestamp1 = time.time()

	print "Generating BLCs...\n"

	visited = []

	blcs = {}
	blcs['rel'] = {}
	blcs['val'] = {}
	blcs['dis'] = {}

	globalPathlList = {}

	# for every synset, create a list of paths
	for syn,info in synsets.items():

		buildPathList(syn,[],syn)

		if(filter_list == 'farthest_max'):
			globalPathlList[syn] = [globalPathlList[syn][get_farthest_max(syn)]]
		elif(filter_list == 'nearest_max'):
			globalPathlList[syn] = [globalPathlList[syn][get_nearest_max(syn)]]
		elif(filter_list == 'largest_max'):
			globalPathlList[syn] = [globalPathlList[syn][get_largest_max(syn)]]

	for syn,info in synsets.items():

		#if type(info) is list:
		#	if int(info[0]) == 0:	# no sons is leaf of hypernims tree

		for tree in range(0,len(globalPathlList[syn])):
			#print globalPathlList[syn][tree]
			if not globalmax:
				procesPathList(syn,tree,0,[])
			else:
				procesPathList_globalMaxim(syn,tree)

	timestamp2 = time.time()
	print "This took %.2f seconds" % (timestamp2 - timestamp1)

	#################################################### WRITE OUT FILE

	timestamp1 = time.time()

	print "Writing "+outfile+"...\n";

	blcs_ord = OrderedDict(sorted(blcs['rel'].items(), key=lambda t: t[0], reverse=False))

	# create directories #####################

	dirs = outfile.split('/')
	acc_d = ''

	for d in dirs[:-1]:

		acc_d = acc_d+d+"/"
		if not os.path.exists(acc_d):
			os.makedirs(acc_d)

	##########################################

	ofile = open(outfile+".rel",'w')

	for k,v in blcs_ord.items():

		ofile.write(k+"\t"+str(v)+"\n")

	ofile.close()

	# create a list of number of occurrences for each synset 
	blcs_count = Counter(blcs['rel'].values())
	blcs_count_ord = OrderedDict(sorted(blcs_count.items(), key=lambda t: t[0], reverse=False))

	ofile = open(outfile+".list",'w')

	for k,v in blcs_count_ord.items():

		str_variants = " ".join(synsets[k][4].keys())

		ofile.write(str(k)+" "+str(synsets[k][3])+" "+str(v)+" "+str(synsets[k][0])+" "+str_variants+"\n")

	ofile.close()

	timestamp2 = time.time()
	print "This took %.2f seconds" % (timestamp2 - timestamp1)

	print "Finished.\n"

