#!/usr/bin/python

import textwrap, argparse

from collections import defaultdict

if __name__ == '__main__':

	parserarg = argparse.ArgumentParser(
	     prog='extractMatrixtoMCR.py',
	     formatter_class=argparse.RawDescriptionHelpFormatter,
	     description=textwrap.dedent('''\
		 Extract data from Matrix to export data to MCR, change csco from the selected synset-variants
		 --------------------------------
		     example of use $python3 %(prog)s --file_matrix matrix.tab
		 '''))

	parserarg.add_argument('--file_matrix', dest='file_matrix', required=True, type=str , help='matrix\'s file (required)')

	args = parserarg.parse_args()

	input_file_matrix = open(args.file_matrix, "r")
	line = input_file_matrix.readline()

	header = line.split()
	lex_names = line.split()[3:]

	cnt_99 = 0
	cnt_rev = 0
	cnt_up49_ok = 0
	cnt_up49_ko = 0
	cnt_49_ok = 0
	cnt_49_ko = 0
	cnt_up00_ok = 0
	cnt_up00_ko = 0
	cnt_n1_ok = 0
	cnt_n1_ko = 0
	cnt_n_oth = 0

	mat = defaultdict(dict)

	# for each line in input matrix, classify follow some rules...
	for line in input_file_matrix.readlines():

		# recovery first three values, synset, variant and csco
		syn,word,csco_tmp = line.split()[:3]
		csco = float(csco_tmp)

		# check if exist non negative value in revisats column
		ok_rev = 0
		for idx,elem in enumerate(line.split()[3:]):
			if lex_names[idx] == 'revisats' and elem != '0':
				ok_rev = 1

		# csco >= 99: Only count it, nothing to do
		if csco >= 99:

			select = '99'
			cnt_99 = cnt_99 + 1

		# Review: Catalan option, "Revisats" (cat: 12042) 
		elif ok_rev == 1:

			select = 'rev'
			cnt_rev = cnt_rev + 1

		# csco > 0: IF it's present in other "resource" or "language" THEN csco up to 99 ELSE csco not change
		elif csco > 0 :

			ko = 1
			# recovery other data present in the file, and check that all are 0's
			for elem in line.split()[3:]:
				if elem != '0':
					ko = 0
			if csco > 49 :

				if ko:
					select = 'up49_ko'
					cnt_up49_ko = cnt_up49_ko + 1
				else:
					select = 'up49_ok'
					cnt_up49_ok = cnt_up49_ok + 1

			elif csco == 49 :

				if ko:
					select = '49_ko'
					cnt_49_ko = cnt_49_ko + 1
				else:
					select = '49_ok'
					cnt_49_ok = cnt_49_ok + 1

			elif csco >= 0 :

				if ko:
					select = 'up00_ko'
					cnt_up00_ko = cnt_up00_ko + 1
				else:
					select = 'up00_ok'
					cnt_up00_ok = cnt_up00_ok + 1

		# csco==-1: Present in some "language" in MCR OR in some "language" in resorces and in "resource" (not babelnet) resorce THEN csco up to 99 (?)
		elif csco == -1:

			ok = 0
			ok_lng = 0
			ok_rcs = 0
			# recovery other data present in the file, and check some conditions...
			for idx,elem in enumerate(line.split()[3:]):
				# if in other language is present in MCR, change csco 
				if "_cl" in lex_names[idx] and float(elem) > 0:
					ok = 1
				# if in other language is present in resource and... 
				elif "_cl" in lex_names[idx] and float(elem) < 0:
					ok_lng = 1
				# ... also is not in babelnet
				elif lex_names[idx] != 'babelnet' and elem != '0':
					ok_rcs = 1

			if ok or (ok_lng and ok_rcs):
				select = 'n1_ok'
				cnt_n1_ok = cnt_n1_ok + 1
			else:
				select = 'n1_ko'
				cnt_n1_ko = cnt_n1_ko + 1

		# Case 3: IF csco<-1 THEN csco up to 99 (spa: 11866 // cat: 3056 // eus:1575)
		elif csco < -1:
				select = 'n_oth'
				cnt_n_oth = cnt_n_oth + 1
		else:
			print "Case not present, exit"
			print line
			exit()

		try:
			if word not in mat[select][syn]:
				mat[select].setdefault(syn,[]).append(word)

		except KeyError:
			mat[select].setdefault(syn,[]).append(word)

	input_file_matrix.close()
	out_name,ext = args.file_matrix.split(".")
	lang = ('-').join(out_name.split("-")[-2:])

	# list to check selectec synset... update sql list and insert sql list
	list_upd = ['up00_ok','up49_ok','49_ok']
	list_ins = ['n1_ok','n_oth','rev']

	# output classification...
	for sel,values in mat.items():

		output_file = open(out_name+'_'+sel+'.'+ext, "w")

		if sel in list_upd or sel in list_ins:
			output_file_sql = open(out_name+'_'+sel+'.sql', "w")

		for syn,words in values.items():
			for word in words:
				output_file.write(syn+"\t"+word+"\n")

				if sel in list_upd:
					output_file_sql.write("UPDATE `wei_"+lang+"_variant` SET `csco`=99 WHERE `offset` LIKE '"+lang+"-"+syn+"' AND `word` LIKE '"+word+"';\n")
				if sel in list_ins:
					pos = syn.split("-")[-1]
					output_file_sql.write("INSERT INTO `wei_"+lang+"_variant` (`word`,`sense`,`offset`,`pos`,`csco`) VALUES ('"+word+"',-1,'"+lang+"-"+syn+"','"+pos+"',99);\n")

		output_file.close()

		if sel in list_upd or sel in list_ins:
			output_file_sql.close()


	print "\nSTATS:\n"
	print "\t99:\t\t"+str(cnt_99)+"\n"
	print "\tREV => 99\t"+str(cnt_rev)+"\n"
	print "\t>49 => 99\t"+str(cnt_up49_ok)+"\n"
	print "\t>49 => >49\t"+str(cnt_up49_ko)+"\n"
	print "\t 49 => 99\t"+str(cnt_49_ok)+"\n"
	print "\t 49 => 49\t"+str(cnt_49_ko)+"\n"
	print "\t>00 => 99\t"+str(cnt_up00_ok)+"\n"
	print "\t>00 => >00\t"+str(cnt_up00_ko)+"\n"
	print "\t -1 => 99\t"+str(cnt_n1_ok)+"\n"
	print "\t -1 => -1\t"+str(cnt_n1_ko)+"\n"
	print "\t<-1 => 99\t"+str(cnt_n_oth)+"\n"
	print "TOTAL UP CSCO\n"
	print "\t XX => 99\t"+str(cnt_n_oth+cnt_n1_ok+cnt_up00_ok+cnt_49_ok+cnt_up49_ok+cnt_rev)+"\n"

