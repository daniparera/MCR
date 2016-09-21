#!/usr/bin/python

import os
import textwrap, argparse
import pymysql
import time

#can use this also
#import MySQLdb

if __name__ == '__main__':

	argument_parser = argparse.ArgumentParser(
	     prog='statsSynsetsVarariants.py',
	     formatter_class=argparse.RawDescriptionHelpFormatter,
	     description=textwrap.dedent('''\
		 count number of variants for each synset from MCR, and some stats :)
		 --------------------------------
		     example of use: $ python3 %(prog)s --host host --db database --user user --pwd password [[--language spa-30]] [[--language cat-30]] [[...]]
		 '''))

	argument_parser.add_argument('--host', dest='host_db', required=True, type=str , help='host url\'s database (required)')
	argument_parser.add_argument('--user', dest='user_db', required=True, type=str , help='user\'s database (required)')
	argument_parser.add_argument('--pwd', dest='pwd_db', required=True, type=str , help='password\'s database (required)')
	argument_parser.add_argument('--db', dest='db_db', required=True, type=str , help='database\'s selection (required)')

	argument_parser.add_argument('--language', dest='lng', action='append', required=False, type=str , help='language (default all, optional)')

	args = argument_parser.parse_args()

	lng = args.lng

	#choose one of them
	#db = MySQLdb.connect(host=args.host_db, user=args.user_db, passwd=args.pwd_db, db=args.db_db) 
	#cur = db.cursor(MySQLdb.cursors.DictCursor) 

	db = pymysql.connect(host=args.host_db, user=args.user_db, passwd=args.pwd_db, db=args.db_db) 
	cur = db.cursor(pymysql.cursors.DictCursor) 

	# Building lists of languages #####################################################################################
	cur.execute("select * FROM wei_languages")
	rows = cur.fetchall()

	languages_mcr = []
	for row in rows: languages_mcr.append(row["code"])

	# Check if language is correct ####################################################################################
	if lng is None: 
		languages = languages_mcr
	else: 
		for l in lng:
			if not l in languages_mcr:
				print("Language must be present in MCR, options:"+str(languages_mcr)+"\n")
				exit(1)
		languages = lng

	# Check or create output folder ###################################################################################
	if not os.path.exists('out'):
		os.makedirs('out')

	###################################################################################################################

	for lang in languages:

		print("Language "+lang+"\nSQL Selects in MCR...\n")

		cur.execute("SELECT offset FROM `wei_"+lang+"_synset`")
		rows_synsets = cur.fetchall()
		syn_t = len(rows_synsets)

		cur.execute("SELECT offset,csco FROM `wei_"+lang+"_variant`")
		rows_variants = cur.fetchall()
		acc_all = len(rows_variants)

		cur.execute("SELECT offset FROM `wei_"+lang+"_variant` WHERE csco > 49")
		rows_variants_up49 = cur.fetchall()
		acc_up49 = len(rows_variants_up49)

		cur.execute("SELECT DISTINCT offset FROM `wei_"+lang+"_variant`")
		rows_variants_all = cur.fetchall()
		syn_s_all = len(rows_variants_all)

		cur.execute("SELECT DISTINCT offset FROM `wei_"+lang+"_variant` WHERE csco > 49")
		rows_variants_up49 = cur.fetchall()
		syn_s_up49 = len(rows_variants_up49)

		cur.execute("SELECT S.offset, V.csco FROM `wei_"+lang+"_synset` S LEFT JOIN `wei_"+lang+"_variant` V ON V.offset = S.offset ORDER BY S.offset ASC")
		rows_join = cur.fetchall()

		print("synset join :"+str(len(rows_join))+"\n")

		print("Counting.... TOTAL SYNSETS JOIN: "+str(len(rows_join))+"\n")

		occ_up49 = {}
		occ_all = {}
		for row_syn in rows_join:

			if row_syn['csco'] is None:
				occ_all[row_syn['offset']] = 0
				occ_up49[row_syn['offset']] = 0
			else:
				if row_syn['offset'] not in occ_up49: occ_up49[row_syn['offset']] = 0
				if row_syn['offset'] not in occ_all: occ_all[row_syn['offset']] = 0

				occ_all[row_syn['offset']] += 1
				
				if row_syn['csco'] > 49:
					occ_up49[row_syn['offset']] += 1
				
		###########################################################################################################

		print("Write to file out/join_count_up49-"+lang+".tab'\n")
		output_file = open('out/join_count_up49-'+lang+'.tab', "w")

		syn_0_up49 = 0
		for syn,occ in occ_up49.items():

			output_file.write(syn+'\t'+str(occ)+'\n')

			if occ == 0:
				syn_0_up49 += 1

		output_file.close()

		###########################################################################################################

		print("Write to file out/join_count_all-"+lang+".tab'\n")
		output_file = open('out/join_count_all-'+lang+'.tab', "w")

		syn_0_all = 0
		for syn,occ in occ_all.items():

			output_file.write(syn+'\t'+str(occ)+'\n')

			if occ == 0:
				syn_0_all += 1

		output_file.close()

		###########################################################################################################

		print("Write stats to file out/join_stats-"+lang+".tab'\n")
		output_file = open('out/join_stats-'+lang+'.tab', "w")

		output_file.write('TOTAL NUMBER OF SYNSETS:\t'+str(syn_t)+'\n\n')

		syn_s_up49 = syn_t-syn_0_up49
		output_file.write('CONDITION, CSCO > 49:\n')
		output_file.write('SYNSETS WITH 0 VARIANTS:\t'+str(syn_0_up49)+'\n')
		output_file.write('SYNSETS WITH >0 VARIANTS:\t'+str(syn_s_up49)+'\n')
		output_file.write('COVERAGE:\t'+str(round(((1.0*syn_s_up49)/syn_t)*100,2))+'%\n')
		output_file.write('TOTAL VARIANTS:\t\t'+str(acc_up49)+'\n')
		output_file.write('MEAN:\t\t'+str(1.0*acc_up49/syn_s_up49)+'\n\n')

		syn_s_all = syn_t-syn_0_all
		output_file.write('ALL, NO CONDITIONS:\n')
		output_file.write('SYNSETS WITH 0 VARIANTS:\t'+str(syn_0_all)+'\n')
		output_file.write('SYNSETS WITH >0 VARIANTS:\t'+str(syn_s_all)+'\n')
		output_file.write('COVERAGE:\t'+str(round(((1.0*syn_s_all)/syn_t)*100,2))+'%\n')
		output_file.write('TOTAL VARIANTS:\t\t'+str(acc_all)+'\n')
		output_file.write('MEAN:\t\t'+str(1.0*acc_all/syn_s_all)+'\n')

		output_file.close()



		###########################################################################################################
		###########################################################################################################
		###########################################################################################################

		print("Counting.... TOTAL SYNSETS: "+str(syn_t)+" TOTAL VARIANTS: "+str(acc_all)+"\n")

		for row_syn in rows_synsets:
		
			occ_up49[row_syn['offset']] = 0
			occ_all[row_syn['offset']] = 0
		
			for row_var in rows_variants:
		
				if row_syn['offset'] == row_var['offset']:
		
					occ_all[row_syn['offset']] += 1
		
					if row_var['csco'] > 49:
						occ_up49[row_syn['offset']] += 1

		###########################################################################################################

		print("Write to file out/count_count_up49-"+lang+".tab'\n")
		output_file = open('out/count_count_up49-'+lang+'.tab', "w")

		syn_0_up49 = 0
		for syn,occ in occ_up49.items():

			output_file.write(syn+'\t'+str(occ)+'\n')

			if occ == 0:
				syn_0_up49 += 1

		output_file.close()

		###########################################################################################################

		print("Write to file out/count_count_all-"+lang+".tab'\n")
		output_file = open('out/count_count_all-'+lang+'.tab', "w")

		syn_0_all = 0
		for syn,occ in occ_all.items():

			output_file.write(syn+'\t'+str(occ)+'\n')

			if occ == 0:
				syn_0_all += 1

		output_file.close()

		###########################################################################################################

		print("Write stats to file out/count_stats-"+lang+".tab'\n")
		output_file = open('out/count_stats-'+lang+'.tab', "w")

		output_file.write('TOTAL NUMBER OF SYNSETS:\t'+str(syn_t)+'\n\n')

		syn_s_up49 = syn_t-syn_0_up49
		output_file.write('CONDITION, CSCO > 49:\n')
		output_file.write('SYNSETS WITH 0 VARIANTS:\t'+str(syn_0_up49)+'\n')
		output_file.write('SYNSETS WITH >0 VARIANTS:\t'+str(syn_s_up49)+'\n')
		output_file.write('COVERAGE:\t'+str(round(((1.0*syn_s_up49)/syn_t)*100,2))+'%\n')
		output_file.write('TOTAL VARIANTS:\t\t'+str(acc_up49)+'\n')
		output_file.write('MEAN:\t\t'+str(1.0*acc_up49/syn_s_up49)+'\n\n')

		syn_s_all = syn_t-syn_0_all
		output_file.write('ALL, NO CONDITIONS:\n')
		output_file.write('SYNSETS WITH 0 VARIANTS:\t'+str(syn_0_all)+'\n')
		output_file.write('SYNSETS WITH >0 VARIANTS:\t'+str(syn_s_all)+'\n')
		output_file.write('COVERAGE:\t'+str(round(((1.0*syn_s_all)/syn_t)*100,2))+'%\n')
		output_file.write('TOTAL VARIANTS:\t\t'+str(acc_all)+'\n')
		output_file.write('MEAN:\t\t'+str(1.0*acc_all/syn_s_all)+'\n')

		output_file.close()
