#!/usr/bin/python

from collections import OrderedDict
import textwrap, argparse
import re, os

if __name__ == '__main__':

	argument_parser = argparse.ArgumentParser(
	     prog='calc_sons_visited.py',
	     formatter_class=argparse.RawDescriptionHelpFormatter,
	     description=textwrap.dedent('''\
		 calculate sons of all synsets from WordNet, version with visited list and without variable sons
		 --------------------------------
		     example of use: $ python3 %(prog)s --outfile data/wn.stats --file dict/wn30/sons.txt [--log]
		                     $ python3 %(prog)s --outfile data/wn.stats --file dict/wn30/sons_n.txt [--log]
		                     $ python3 %(prog)s --outfile data/wn.stats --file dict/wn30/sons_v.txt [--log]
		 '''))

	argument_parser.add_argument('--file', dest='infile', required=True, type=str , help='wordnet file (required)')
	argument_parser.add_argument('--outfile', dest='outfile', required=True, type=str , help='out file (required)')

	args = argument_parser.parse_args()

	infile =  args.infile
	outfile =  args.outfile

	def calcul_sons_rec(synset,visited):

		if synset == '02422663-v': return set() # problematic synset...

		list_sons = synsets[synset]

		for son in list_sons:

			if son not in visited: 
				visited.add(son)

			visited = calcul_sons_rec(son,visited)

		return visited

	# create directories #####################

	dirs = outfile.split('/')
	acc_d = ''

	for d in dirs[:-1]:

		acc_d = acc_d+d+"/"
		if not os.path.exists(acc_d):
			os.makedirs(acc_d)

	##########################################

	out = open(outfile, 'w')

	synsets = {}

	infile = open(infile,'r')
	content_file = infile.readlines()

	for line in content_file:

		result = re.match('^\d{8}', line)

		if result:

			data_aux = line.split("|")
			datalist = data_aux[0].split()

			hypos = []

			for idx,data in enumerate(datalist):

				if data == "~" or data == "~i" :

					hypos.append(datalist[idx+1]+"-"+datalist[idx+2])
			
			# store in the same synset's structure a list hyponims
			synsets[str(datalist[0])+"-"+datalist[2]] = hypos

	infile.close()

	synsets_ord = OrderedDict(sorted(synsets.items(), key=lambda t: t[0], reverse=False))

	for syn in synsets_ord:

		pos = syn.split("-")[-1]

		visit = set()

		if pos == 'n' or pos == 'v':

			visited = calcul_sons_rec(syn,visit)

			out.write(syn+"\t"+str(len(visited))+"\n")

	out.close()
