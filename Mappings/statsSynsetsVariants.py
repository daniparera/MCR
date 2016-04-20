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
		 count number of variants for each synset from MCR, and a mean :)
		 --------------------------------
		     example of use $python3 %(prog)s --host host --db database --user user --pwd password
		     python createMatrix.py --host adimen.si.ehu.es --user guest --pwd guest --db mcr9 [[--language spa-30]] [[--language cat-30]] [[...]]
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

		total_synsets = cur.execute("SELECT offset FROM `wei_"+lang+"_synset`")

		total_synsets_n = cur.execute("SELECT offset FROM `wei_"+lang+"_synset` WHERE pos='n'")
		total_synsets_v = cur.execute("SELECT offset FROM `wei_"+lang+"_synset` WHERE pos='v'")
		total_synsets_a = cur.execute("SELECT offset FROM `wei_"+lang+"_synset` WHERE pos='a'")
		total_synsets_r = cur.execute("SELECT offset FROM `wei_"+lang+"_synset` WHERE pos='r'")

		total_variants_all = cur.execute("SELECT offset FROM `wei_"+lang+"_variant`")
		total_variants_up49 = cur.execute("SELECT offset FROM `wei_"+lang+"_variant` WHERE csco > 49")

		total_variants_up49_n = cur.execute("SELECT offset FROM `wei_"+lang+"_variant` WHERE csco > 49 AND pos='n'")
		total_variants_up49_v = cur.execute("SELECT offset FROM `wei_"+lang+"_variant` WHERE csco > 49 AND pos='v'")
		total_variants_up49_a = cur.execute("SELECT offset FROM `wei_"+lang+"_variant` WHERE csco > 49 AND pos='a'")
		total_variants_up49_r = cur.execute("SELECT offset FROM `wei_"+lang+"_variant` WHERE csco > 49 AND pos='r'")

		synsets_some_all = cur.execute("SELECT DISTINCT offset FROM `wei_"+lang+"_variant`")
		synsets_some_up49 = cur.execute("SELECT DISTINCT offset FROM `wei_"+lang+"_variant` WHERE csco > 49")

		synsets_some_up49_n = cur.execute("SELECT DISTINCT offset FROM `wei_"+lang+"_variant` WHERE csco > 49 AND pos='n'")
		synsets_some_up49_v = cur.execute("SELECT DISTINCT offset FROM `wei_"+lang+"_variant` WHERE csco > 49 AND pos='v'")
		synsets_some_up49_a = cur.execute("SELECT DISTINCT offset FROM `wei_"+lang+"_variant` WHERE csco > 49 AND pos='a'")
		synsets_some_up49_r = cur.execute("SELECT DISTINCT offset FROM `wei_"+lang+"_variant` WHERE csco > 49 AND pos='r'")

		total_gloss = cur.execute("SELECT offset FROM `wei_"+lang+"_synset` WHERE `gloss` != ''")

		total_gloss_n = cur.execute("SELECT offset FROM `wei_"+lang+"_synset` WHERE pos='n' AND `gloss` != ''")
		total_gloss_v = cur.execute("SELECT offset FROM `wei_"+lang+"_synset` WHERE pos='v' AND `gloss` != ''")
		total_gloss_a = cur.execute("SELECT offset FROM `wei_"+lang+"_synset` WHERE pos='a' AND `gloss` != ''")
		total_gloss_r = cur.execute("SELECT offset FROM `wei_"+lang+"_synset` WHERE pos='r' AND `gloss` != ''")

		print("Write stats to file out/stats-"+lang+".tab'\n")
		output_file = open('out/stats-'+lang+'.tab', "w")

		output_file.write('TOTAL NUMBER OF SYNSETS:\t'+str(total_synsets)+'\n\n')

		output_file.write('CONDITION, CSCO > 49:\n')
		output_file.write('SYNSETS WITH SOME VARIANTS:\t'+str(synsets_some_up49)+'\n')
		output_file.write('COVERAGE:\t'+str(round(((1.0*synsets_some_up49)/total_synsets)*100,2))+'%\n')
		output_file.write('TOTAL VARIANTS:\t\t'+str(total_variants_up49)+'\n')
		output_file.write('MEAN:\t\t'+str(1.0*total_variants_up49/synsets_some_up49)+'\n\n')

		output_file.write('NOUNS, CONDITION, CSCO > 49:\n')
		output_file.write('TOTAL SYNSETS NOUNS:\t'+str(total_synsets_n)+'\n')
		output_file.write('SYNSETS NOUNS WITH SOME VARIANTS:\t'+str(synsets_some_up49_n)+'\n')
		output_file.write('COVERAGE:\t'+str(round(((1.0*synsets_some_up49_n)/total_synsets_n)*100,2))+'%\n')
		output_file.write('TOTAL NOUNS VARIANTS:\t\t'+str(total_variants_up49_n)+'\n')
		output_file.write('MEAN:\t\t'+str(1.0*total_variants_up49_n/synsets_some_up49_n)+'\n\n')

		output_file.write('VERBS, CONDITION, CSCO > 49:\n')
		output_file.write('TOTAL SYNSETS VERBS:\t'+str(total_synsets_v)+'\n')
		output_file.write('SYNSETS VERBS WITH SOME VARIANTS:\t'+str(synsets_some_up49_v)+'\n')
		output_file.write('COVERAGE:\t'+str(round(((1.0*synsets_some_up49_v)/total_synsets_v)*100,2))+'%\n')
		output_file.write('TOTAL VERBS VARIANTS:\t\t'+str(total_variants_up49_v)+'\n')
		output_file.write('MEAN:\t\t'+str(1.0*total_variants_up49_v/synsets_some_up49_v)+'\n\n')

		output_file.write('ADJECTIVES, CONDITION, CSCO > 49:\n')
		output_file.write('TOTAL SYNSETS ADJ.:\t'+str(total_synsets_a)+'\n')
		output_file.write('SYNSETS ADJECTIVES WITH SOME VARIANTS:\t'+str(synsets_some_up49_a)+'\n')
		output_file.write('COVERAGE:\t'+str(round(((1.0*synsets_some_up49_a)/total_synsets_a)*100,2))+'%\n')
		output_file.write('TOTAL ADJECTIVES VARIANTS:\t\t'+str(total_variants_up49_a)+'\n')
		if synsets_some_up49_a == 0:
			output_file.write('MEAN:\t\t0\n\n')
		else:
			output_file.write('MEAN:\t\t'+str(1.0*total_variants_up49_a/synsets_some_up49_a)+'\n\n')

		output_file.write('ADVERBS, CONDITION, CSCO > 49:\n')
		output_file.write('TOTAL SYNSETS ADV.:\t'+str(total_synsets_r)+'\n')
		output_file.write('SYNSETS ADVERBS WITH SOME VARIANTS:\t'+str(synsets_some_up49_r)+'\n')
		output_file.write('COVERAGE:\t'+str(round(((1.0*synsets_some_up49_r)/total_synsets_r)*100,2))+'%\n')
		output_file.write('TOTAL ADVERBS VARIANTS:\t\t'+str(total_variants_up49_r)+'\n')
		if synsets_some_up49_r == 0:
			output_file.write('MEAN:\t\t0\n\n')
		else:
			output_file.write('MEAN:\t\t'+str(1.0*total_variants_up49_r/synsets_some_up49_r)+'\n\n')

		output_file.write('ALL, NO CONDITIONS:\n')
		output_file.write('SYNSETS WITH SOME VARIANTS:\t'+str(synsets_some_all)+'\n')
		output_file.write('COVERAGE:\t'+str(round(((1.0*synsets_some_all)/total_synsets)*100,2))+'%\n')
		output_file.write('TOTAL VARIANTS:\t\t'+str(total_variants_all)+'\n')
		output_file.write('MEAN:\t\t'+str(1.0*total_variants_all/synsets_some_all)+'\n\n')

		output_file.write('SUMMARY:\n')
		output_file.write('\tNouns\tVerbs\tAdjectives\tAdverbs\tTotal\n')
		output_file.write('\t'+str(total_variants_up49_n)+'\t'+str(total_variants_up49_v)+'\t'+str(total_variants_up49_a)+'\t\t'+str(total_variants_up49_r)+'\t'+str(synsets_some_up49)+'\n')

		output_file.write('GLOSS:\n')
		output_file.write('\tNouns\tVerbs\tAdjectives\tAdverbs\tTotal\n')
		output_file.write('\t'+str(total_gloss_n)+'\t'+str(total_gloss_v)+'\t'+str(total_gloss_a)+'\t\t'+str(total_gloss_r)+'\t'+str(total_gloss)+'\n')

		output_file.close()
