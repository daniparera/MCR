#!/usr/bin/python

import textwrap, argparse

from collections import OrderedDict
from collections import defaultdict

class AutoVivification(dict):
    """Implementation of perl's autovivification feature."""
    def __getitem__(self, item):
        try:
            return dict.__getitem__(self, item)
        except KeyError:
            value = self[item] = type(self)()
            return value

if __name__ == '__main__':

	argument_parser = argparse.ArgumentParser(
	     prog='updateMatrix.py',
	     formatter_class=argparse.RawDescriptionHelpFormatter,
	     description=textwrap.dedent('''\
		 update synset-variant-csco matrix with new lexicon
		 --------------------------------
		     example of use: $ python3 %(prog)s --file_matrix matrix.txt --file_lexicon lexicon.txt --new_field_name field_name
		     python updateMatrix.py --file_matrix out/matrix_eng-30.tab --file_lexicon data/wn-cldr-eng_clean.tab --new_field_name cldr
		 '''))

	argument_parser.add_argument('--file_matrix', dest='file_matrix', required=True, type=str , help='matrix\'s file (required)')
	argument_parser.add_argument('--file_lexicon', dest='file_lexicon', required=True, type=str , help='resource lexicon\'s file (required)')
	argument_parser.add_argument('--new_field_name', dest='nfn', required=True, type=str , help='new field name (required)')
	argument_parser.add_argument('--cross_lingual', dest='cl', action='store_false', default='True', help='to append only coincidence (optional)')

	args = argument_parser.parse_args()
	cl = not(bool(args.cl))
	
	if "_" in args.nfn:
		print("invalid name for new field. It can't contain '_' (underscore)")
		exit()
	else:
		if cl:
			args.nfn = args.nfn + "_cl"  

	### Read and Create lexicon ################################################

	input_file_lexicon = open(args.file_lexicon, "r")
	line = input_file_lexicon.readline()

	lexicon_dict = defaultdict(dict)

	for line in input_file_lexicon.readlines():

		syn,word,conf = line.split()[:3]
		lexicon_dict[syn][word] = round(float(conf),2)

	############################################################################

	### Read and Create matrix ################################################

	input_file_matrix = open(args.file_matrix, "r")
	line = input_file_matrix.readline()

	header = line.split()+[args.nfn]
	lex_names = line.split()[3:]

	matrix = AutoVivification()

	for line in input_file_matrix.readlines():

		syn,word = line.split()[:2]
		csco = float(line.split()[2])

		pos = syn.split("-")[1]
		if pos == 's':
			syn = syn.split("-")[0]+"-a"

		# recovery other data present in the file, and store in matrix's data structure
		for idx,elem in enumerate(line.split()[3:]):
			matrix[syn][word][lex_names[idx]] = elem

		# go through a lexicon_dict, try to find an element.
		try:
			matrix[syn][word]['new_field'] = lexicon_dict[syn].pop(word)
			if csco <= 0 and not cl:
				matrix[syn][word]['csco'] = csco - 1
			else:
				matrix[syn][word]['csco'] = csco
				
		except KeyError:
			matrix[syn][word]['new_field'] = 0
			matrix[syn][word]['csco'] = csco

	#new_dict = {k:v for k,v in original_dict.items() if v}

	# delete empty lists
	for k in list(lexicon_dict):
		if not lexicon_dict[k]:
			del lexicon_dict[k]

	if not cl:
		# add other elements not presents in original mcr matrix, with csco = -1
		for syn,words in lexicon_dict.items():

			for word,conf in words.items():

				matrix[syn][word]['csco'] = -1
				for field in lex_names:
					matrix[syn][word][field] = 0
				matrix[syn][word]['new_field'] = conf

	############################################################################

	matrix_ord = OrderedDict(sorted(matrix.items(), key=lambda t: t[0], reverse=False))

	### Output updated matrix ##################################################

	# name for outpput file is the same that last but increment counter
	i_output_name,o_output_name = args.file_matrix.split('_')
	idx,f_output_name, = o_output_name.split('.')

	output_file = open(i_output_name+"_"+str(int(idx)+1)+"."+f_output_name, "w")

	for key in header:
		output_file.write(key+'\t')
	output_file.write('\n')

	for syn,words in matrix_ord.items():
		for word,values in words.items():
			output_file.write(syn+'\t'+word+'\t'+str(values['csco'])+'\t')
			for key in lex_names:
				output_file.write(str(values[key])+'\t')
			output_file.write(str(values['new_field'])+'\n')

	output_file.close()

	############################################################################
