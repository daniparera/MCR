#!/usr/bin/python

import os
import textwrap, argparse
import pymysql
import time

from collections import defaultdict

#import sys  
#reload(sys)  
#sys.setdefaultencoding('iso-8859-1')

#can use this also
#import MySQLdb

class AutoVivification(dict):
    """Implementation of perl's autovivification feature."""
    def __getitem__(self, item):
        try:
            return dict.__getitem__(self, item)
        except KeyError:
            value = self[item] = type(self)()
            return value

if __name__ == '__main__':

	parserarg = argparse.ArgumentParser(
	     prog='updateMatrix.py',
	     formatter_class=argparse.RawDescriptionHelpFormatter,
	     description=textwrap.dedent('''\
		 check MCR with OMW datasets
		 --------------------------------
		     example of use $python3 %(prog)s --file_matrix matrix.txt --file_lexicon lexicon.txt --new_field_name field_name
		     python updateMatrix.py --file_matrix out/matrix_eng-30.tab --file_lexicon data/wn-cldr-eng_clean.tab --new_field_name cldr
		 '''))

	parserarg.add_argument('--file_matrix', dest='file_matrix', required=True, type=str , help='matrix\'s file (required)')
	parserarg.add_argument('--file_lexicon', dest='file_lexicon', required=True, type=str , help='resource lexicon\'s file (required)')
	parserarg.add_argument('--new_field_name', dest='nfn', required=True, type=str , help='new field name (required)')

	args = parserarg.parse_args()

	### Read and Create lexicon ################################################

	input_file_lexicon = open(args.file_lexicon, "r")

	lexicon_dict = defaultdict(dict)
	lexicon_dict_rest = defaultdict(dict)

	for line in input_file_lexicon.readlines():

		#print line
		syn,word,conf = line.split()
		lexicon_dict[syn][word] = round(float(conf),2)

	#print lexicon_dict
	#time.sleep(10)


	############################################################################

	### Read and Create matrix ################################################

	input_file_matrix = open(args.file_matrix, "r")
	line = input_file_matrix.readline()

	header = line.split()+[args.nfn]
	lex_names = line.split()[3:]

	matrix = AutoVivification()

	for line in input_file_matrix.readlines():

		syn,word,csco = line.split()[:3]
		#syn,word,csco = line.replace('\n', '').encode('iso-8859-1').split()[:3]
		matrix[syn][word]['csco'] = csco

		# recovery other data present in the file, and store in matrix's data structure
		for idx,elem in enumerate(line.split()[3:]):
			matrix[syn][word][lex_names[idx]] = elem

		# go through a lexicon_dict, try to find an element
		try:
			matrix[syn][word]['new_field'] = lexicon_dict[syn].pop(word)
				
		except KeyError:
			matrix[syn][word]['new_field'] = 0
			#print syn + " - " + word
			#print "NO TROBAR"
			pass

	#new_dict = {k:v for k,v in original_dict.items() if v}

	for k in lexicon_dict.keys():
		if not lexicon_dict[k]:
			del lexicon_dict[k]

	#print lexicon_dict

	for syn,words in lexicon_dict.items():

		for word,conf in words.items():

			matrix[syn][word]['csco'] = "-1"
			for field in lex_names:
				matrix[syn][word][field] = 0
			matrix[syn][word]['new_field'] = conf

	############################################################################

	### Output updated matrix ##################################################

	i_output_name,o_output_name = args.file_matrix.split('_')
	idx,f_output_name, = o_output_name.split('.')

	output_file = open(i_output_name+"_"+str(int(idx)+1)+"."+f_output_name, "w")

	for key in header:
		output_file.write(key+'\t')
	output_file.write('\n')

	for syn,words in matrix.items():
		for word,values in words.items():
			output_file.write(syn+'\t'+word+'\t'+values['csco']+'\t')
			for key in lex_names:
				output_file.write(str(values[key])+'\t')
			output_file.write(str(values['new_field'])+'\n')

	output_file.close()

	############################################################################
