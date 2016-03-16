#!/usr/bin/python

import textwrap, argparse, time

from collections import defaultdict

if __name__ == '__main__':

	argument_parser = argparse.ArgumentParser(
	     prog='extractMatrixtoMCR.py',
	     formatter_class=argparse.RawDescriptionHelpFormatter,
	     description=textwrap.dedent('''\
		 Extract data from Matrix to export data to MCR, Create SQL to change csco from the selected synset-variants
		 --------------------------------
		     example of use $python3 %(prog)s --file_matrix matrix.tab [[--log_files]]
		 '''))

	argument_parser.add_argument('--file_matrix', dest='file_matrix', required=True, type=str , help='matrix\'s file (required)')

	argument_parser.add_argument('--verbose_time', dest='vt', required=False, type=float, default=-1 , help='to show verbose information (optional)')
	argument_parser.add_argument('--log_files', dest='log_files', action='store_true', help='create log files (optional)')
	argument_parser.add_argument('--stats_info', dest='stats_info', action='store_true', help='show statistical information (optional)')
	argument_parser.add_argument('--check_mcr', dest='check_mcr', action='store_true', help='check synset\' existence with MCR batabase (optional)')
	argument_parser.add_argument('--valid_list', dest='valid_list', action='append', type=str, default=[], help='valid field to insert directly in MCR (optional, multiple values)')

	argument_parser.add_argument('--host', dest='host_db', required=False, type=str , help='host url\'s database (required if check_mcr option is set)')
	argument_parser.add_argument('--user', dest='user_db', required=False, type=str , help='user\'s database (required if check_mcr option is set)')
	argument_parser.add_argument('--pwd', dest='pwd_db', required=False, type=str , help='password\'s database (required if check_mcr option is set)')
	argument_parser.add_argument('--db', dest='db_db', required=False, type=str , help='database\'s selection (required if check_mcr option is set)')

	args = argument_parser.parse_args()

	# START, CHECK MCR ##############################################################################################################################3

	if args.check_mcr:

		if args.host_db is None or args.user_db is None or args.pwd_db is None or args.db_db is None:
			print ("Check MCR parameter need connection to MCR parameters!!, see help")
			exit()

		import pymysql,sys

		#can use this also
		#import MySQLdb,sys

		#choose one of them
		#db = MySQLdb.connect(host=args.host_db, user=args.user_db, passwd=args.pwd_db, db=args.db_db) 
		#cur = db.cursor(MySQLdb.cursors.DictCursor) 

		db = pymysql.connect(host=args.host_db, user=args.user_db, passwd=args.pwd_db, db=args.db_db) 
		cur = db.cursor(pymysql.cursors.DictCursor) 

		lang = ('-').join(args.file_matrix.split(".")[0].split("-")[-2:])

		cur.execute("SELECT offset FROM `wei_"+lang+"_synset`")
		rows = cur.fetchall()

		# Create a MCR synsets's list
		synsets_mcr = {}
		for row in rows:

			if sys.version_info[0] < 3:
				syn = "-".join(row['offset'].split("-")[-2:]).decode('iso-8859-1').encode('utf-8')
			else:
				syn = "-".join(row['offset'].split("-")[-2:])

			synsets_mcr[syn] = 1

	# FINISH, CHECK MCR #############################################################################################################################3

	# START, CLASSIFICATION #########################################################################################################################3

	input_file_matrix = open(args.file_matrix, "r")
	line = input_file_matrix.readline()

	header = line.split()
	lex_names = line.split()[3:]

	# Initialize counters
	cnt = {}
	cnt['99'],cnt['rv_vis'],cnt['rv_hide'],cnt['rv_out'],cnt['up49_ok'],cnt['up49_ko'],cnt['49_ok'],cnt['49_ko'],cnt['up00_ok'],cnt['up00_ko'],cnt['n1_ok'],cnt['n1_ko'],cnt['n_oth'] = [0] * 13

	c = {}
	c['n'] = {}
	c['v'] = {}
	c['a'] = {}
	c['r'] = {}

	c['n']['99'],c['n']['rv_vis'],c['n']['rv_hide'],c['n']['rv_out'],c['n']['up49_ok'],c['n']['up49_ko'],c['n']['49_ok'],c['n']['49_ko'],c['n']['up00_ok'],c['n']['up00_ko'],c['n']['n1_ko'] = [0] * 11
	c['v']['99'],c['v']['rv_vis'],c['v']['rv_hide'],c['v']['rv_out'],c['v']['up49_ok'],c['v']['up49_ko'],c['v']['49_ok'],c['v']['49_ko'],c['v']['up00_ok'],c['v']['up00_ko'],c['v']['n1_ko'] = [0] * 11
	c['a']['99'],c['a']['rv_vis'],c['a']['rv_hide'],c['a']['rv_out'],c['a']['up49_ok'],c['a']['up49_ko'],c['a']['49_ok'],c['a']['49_ko'],c['a']['up00_ok'],c['a']['up00_ko'],c['a']['n1_ko'] = [0] * 11
	c['r']['99'],c['r']['rv_vis'],c['r']['rv_hide'],c['r']['rv_out'],c['r']['up49_ok'],c['r']['up49_ko'],c['r']['49_ok'],c['r']['49_ko'],c['r']['up00_ok'],c['r']['up00_ko'],c['r']['n1_ko'] = [0] * 11
	c['n']['n1_ok'],c['n']['n_oth'],c['v']['n_oth'],c['v']['n1_ok'],c['a']['n_oth'],c['a']['n1_ok'],c['r']['n_oth'],c['r']['n1_ok'] = [0] * 8

	synsets_some_up49_before,synsets_some_up49_after,synsets_some_all_before = [{},{},{}]
	syn_s_b,syn_s_a,syn_s_b['n'],syn_s_a['n'],syn_s_b['v'],syn_s_a['v'],syn_s_b['a'],syn_s_a['a'],syn_s_b['r'],syn_s_a['r'] = [{},{},{},{},{},{},{},{},{},{}]

	# list to check selected synset... update sql list and insert sql list
	list_upd = ['up00_ok','up49_ok','49_ok','rv_vis','rv_hide']
	list_ins = ['n1_ok','n_oth','rv_out']

	classification = defaultdict(dict)

	# for each line in input matrix, classify follow some rules...
	for line in input_file_matrix.readlines():

		# recovery first three values, synset, variant and csco
		syn,word,csco_tmp = line.split()[:3]
		pos = syn.split("-")[1]
		csco = float(csco_tmp)

		if args.check_mcr:
			try:
				if synsets_mcr[syn]:
					pass
			except KeyError:
				print("SYNSET "+syn+" WORD "+word+" CSCO "+str(csco)+" NOT IN MCR!!")

		if pos == 's':
			syn = syn.split("-")[0]+"-a"
			pos = "a"

		# check if exist non negative value in some validate column
		ok_rev = 0
		for idx,elem in enumerate(line.split()[3:]):
			if lex_names[idx] in args.valid_list and elem != '0':
				ok_rev = 1

		# Review not hide:
		if ok_rev == 1 and csco > 49:
			select = 'rv_vis'

		# Review hide:
		elif ok_rev == 1 and csco > 0:
			select = 'rv_hide'

		# Review not in MCR:
		elif ok_rev == 1 and csco < 0:
			select = 'rv_out'

		# csco >= 99: Only count it, nothing to do
		elif csco >= 99:
			select = '99'

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
				else:
					select = 'up49_ok'

			elif csco == 49 :

				if ko:
					select = '49_ko'
				else:
					select = '49_ok'

			elif csco >= 0 :

				if ko:
					select = 'up00_ko'
				else:
					select = 'up00_ok'

		# csco==-1: Present in some "language" in MCR OR in some "languages" in resources and "resources" (not babelnet) THEN csco up to 99
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
			else:
				select = 'n1_ko'

		# csco < -1: THEN csco up to 99
		elif csco < -1:
				select = 'n_oth'
		else:
			print("Case not present, exit")
			print(line)
			exit()

		# update counters
		cnt[select] += 1
		c[pos][select] += 1

		# update classification matrix
		try:
			if word not in classification[select][syn]:
				classification[select].setdefault(syn,[]).append(word)
		except KeyError:
			classification[select].setdefault(syn,[]).append(word)

		if args.vt >= 0:
			print(line)
			print(select)
			print(cnt[select])
			print(c[pos][select])
			print("-----------------------------------------------------------------------------")
			time.sleep(args.vt)

		# for statistics ##########################################################

		if csco > 49:
			if syn in synsets_some_up49_before:
				synsets_some_up49_before[syn] += 1
			else:
				synsets_some_up49_before[syn] = 1
			if syn in syn_s_b[pos]:
				syn_s_b[pos][syn] += 1
			else:
				syn_s_b[pos][syn] = 1

		if csco > 0:
			if syn in synsets_some_all_before:
				synsets_some_all_before[syn] += 1
			else:
				synsets_some_all_before[syn] = 1
				

		if csco > 49 or select in list_upd+list_ins:
			if syn in synsets_some_up49_after:
				synsets_some_up49_after[syn] += 1
			else:
				synsets_some_up49_after[syn] = 1
			if syn in syn_s_a[pos]:
				syn_s_a[pos][syn] += 1
			else:
				syn_s_a[pos][syn] = 1

		###########################################################################

	input_file_matrix.close()

	# FINISH, CLASSIFICATION ########################################################################################################################3

	# START, WRITE TO FILES ##########################################################################################################################

	# names and paths for output files
	out_dir = '/'.join(args.file_matrix.split("/")[:-1])
	out_file = args.file_matrix.split("/")[-1]

	out_name = out_file.split(".")[0]
	out_path = out_dir+"/"+out_name

	ext = out_file.split(".")[1]

	# extract language from input filename
	lang = '-'.join(out_name.split("-")[-2:])

	out_file_sql = open(out_path+'_update.sql', "w")
	out_file_sql.seek(0)
	out_file_sql.truncate()
	out_file_sql.write("SET NAMES utf8;\n")
	out_file_sql.close()

	out_file_sql = open(out_path+'_insert.sql', "w")
	out_file_sql.seek(0)
	out_file_sql.truncate()
	out_file_sql.write("SET NAMES utf8;\n")
	out_file_sql.close()


	# output classification... #########################################################################################################
	for sel,values in classification.items():

		# open output files ########################################################################################################
		if args.log_files:
			out_file = open(out_path+'_log_'+sel+'.'+ext, "w")

		if sel in list_upd:
			out_file_sql = open(out_path+'_update.sql', "a")
		if sel in list_ins:
			out_file_sql = open(out_path+'_insert.sql', "a")

		############################################################################################################################

		for syn,words in values.items():
			for word in words:

				word_rep = word.replace("'", "\\'")

				if args.log_files:
					out_file.write(syn+"\t"+word+"\n")

				if sel in list_upd:
					out_file_sql.write("UPDATE `wei_"+lang+"_variant` SET `csco`=99 WHERE `offset` LIKE '"+lang+"-"+syn+"' AND `word` LIKE '"+word_rep+"';\n")
				if sel in list_ins:
					pos = syn.split("-")[-1]
					out_file_sql.write("INSERT INTO `wei_"+lang+"_variant` (`word`,`sense`,`offset`,`pos`,`csco`) VALUES ('"+word_rep+"',-1,'"+lang+"-"+syn+"','"+pos+"',99);\n")

		# close output files #######################################################################################################
		if args.log_files:
			out_file.close()

		if sel in list_upd or sel in list_ins:
			out_file_sql.close()
		############################################################################################################################

	# FINISH, WRITE TO FILES #########################################################################################################################

	# Output Statistical Infromation ##########################################################################################################
	if args.stats_info:

		print("\nSTATS:")
		print("\t99:\t\t"+str(cnt['99']))
		print("\trv_49 => 99\t"+str(cnt['rv_vis']))
		print("\trv_00 => 99\t"+str(cnt['rv_hide']))
		print("\trv_-1 => 99\t"+str(cnt['rv_out']))
		print("\t >49  =>  99\t"+str(cnt['up49_ok']))
		print("\t >49  =>  >49\t"+str(cnt['up49_ko']))
		print("\t  49  =>  99\t"+str(cnt['49_ok']))
		print("\t  49  =>  49\t"+str(cnt['49_ko']))
		print("\t >00  =>  99\t"+str(cnt['up00_ok']))
		print("\t >00  =>  >00\t"+str(cnt['up00_ko']))
		print("\t  -1  =>  99\t"+str(cnt['n1_ok']))
		print("\t  -1  =>  -1\t"+str(cnt['n1_ko']))
		print("\t <-1  =>  99\t"+str(cnt['n_oth'])+"\n")
		print("CHANGES IN MCR:")
		print("\t NEW VARIANTS\t"+str(cnt['n_oth']+cnt['n1_ok']+cnt['rv_hide']+cnt['rv_out']+cnt['49_ok']+cnt['up00_ok']))
		print("\t UPD VARIANTS\t"+str(cnt['up49_ok']+cnt['rv_vis'])+"\n")
		print("SQL INFO:")
		print("\t INSERT\t"+str(cnt['n_oth']+cnt['n1_ok']+cnt['rv_out']))
		print("\t UPDATE\t"+str(cnt['49_ok']+cnt['up00_ok']+cnt['up49_ok']+cnt['rv_hide']+cnt['rv_vis'])+"\n")

		total_variants_before = cnt['99']+cnt['up49_ok']+cnt['up49_ko']+cnt['rv_vis']
		total_variants_after = cnt['99']+cnt['up49_ok']+cnt['up49_ko']+cnt['49_ok']+cnt['up00_ok']+cnt['rv_vis']+cnt['rv_hide']+cnt['rv_out']+cnt['n1_ok']+cnt['n_oth']

		print("STATS")
		print("\t TOTAL VARIANTS MCR BEFORE UPGRADE\t"+str(total_variants_before))
		print("\t TOTAL VARIANTS MCR AFTER UPGRADE\t"+str(total_variants_after)+"\n")

		print("\t TOTAL SYNSETS WITH VARIANTS BEFORE\t"+str(len(synsets_some_up49_before)))
		print("\t TOTAL SYNSETS WITH VARIANTS AFTER\t"+str(len(synsets_some_up49_after))+"\n")

		print("\t TOTAL NOUN S. WITH VARIANTS BEFORE\t"+str(len(syn_s_b['n'])))
		print("\t TOTAL NOUN S. WITH VARIANTS AFTER\t"+str(len(syn_s_a['n']))+"\n")

		print("\t TOTAL VERBS S. WITH VARIANTS BEFORE\t"+str(len(syn_s_b['v'])))
		print("\t TOTAL VERBS S. WITH VARIANTS AFTER\t"+str(len(syn_s_a['v']))+"\n")

		print("\t TOTAL ADJ. SYNS. WITH VARIANTS BEFORE\t"+str(len(syn_s_b['a'])))
		print("\t TOTAL ADJ. SYNS. WITH VARIANTS AFTER\t"+str(len(syn_s_a['a']))+"\n")

		print("\t TOTAL ADVERBS S. WITH VARIANTS BEFORE\t"+str(len(syn_s_b['r'])))
		print("\t TOTAL ADVERBS S. WITH VARIANTS AFTER\t"+str(len(syn_s_a['r']))+"\n")

		print("COVERAGE BEFORE:\t"+str(round((len(synsets_some_up49_before)/118985.0)*100,2))+'%')
		print("MEAN BEFORE:\t\t"+str(1.0*total_variants_before/len(synsets_some_up49_before))+'\n')
		print("COVERAGE AFTER:\t\t"+str(round((len(synsets_some_up49_after)/118985.0)*100,2))+'%')
		print("MEAN AFTER:\t\t"+str(1.0*total_variants_after/len(synsets_some_up49_after))+'\n')
