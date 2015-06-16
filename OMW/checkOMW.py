#!/usr/bin/python

import os
import textwrap, argparse
import pymysql

#can use this also
#import MySQLdb

parserarg = argparse.ArgumentParser(
     prog='checkOMW.py',
     formatter_class=argparse.RawDescriptionHelpFormatter,
     description=textwrap.dedent('''\
         check MCR with OMW datasets
         --------------------------------
             example of use $python3 %(prog)s --host host --db database --user user --pwd password --pos n/v
         '''))

parserarg.add_argument('--host', dest='host_db', required=True, type=str , help='host url\'s database (required)')
parserarg.add_argument('--user', dest='user_db', required=True, type=str , help='user\'s database (required)')
parserarg.add_argument('--pwd', dest='pwd_db', required=True, type=str , help='password\'s database (required)')
parserarg.add_argument('--db', dest='db_db', required=True, type=str , help='database\'s selection (required)')

parserarg.add_argument('--t', dest='t', required=False, default='wikt', type=str , help='file type (cldr/wikt)')

args = parserarg.parse_args()

t = args.t

if not t == 'cldr' and not t == 'wikt':
	print("t parameter must be 'wikt' or 'cldr'")
	exit(1)

#choose one of them
#db = MySQLdb.connect(host=args.host_db, user=args.user_db, passwd=args.pwd_db, db=args.db_db) 
#cur = db.cursor(MySQLdb.cursors.DictCursor) 

db = pymysql.connect(host=args.host_db, user=args.user_db, passwd=args.pwd_db, db=args.db_db) 
cur = db.cursor(pymysql.cursors.DictCursor) 

cur.execute("select * FROM wei_languages")
rows = cur.fetchall()

# we build lists of file_outputs.
languages = []
for row in rows: languages.append(row["code"])
print languages

if not os.path.exists('out'):
	os.makedirs('out')

for lang in languages:

	lng = lang.split("-")[0]
	print("OPEN FILES FOR LANGUAGE "+lng)

	input_file = open('data/wn-'+t+'-'+lng+'.tab', "r")
	output_file_c = open('out/correct-'+t+'-'+lng+'.tab', "w")
	output_file_m = open('out/missing-'+t+'-'+lng+'.tab', "w")
	output_file_a = open('out/alternatives-'+t+'-'+lng+'.tab', "w")

	for idx,line in enumerate(input_file.readlines()):

		li=line.strip()
		if not li.startswith("#"):

			if(len(li.split("\t")) == 3):	

				syn,lemma,word = li.split("\t")

				p = "SYN:"+syn+"\tW:"+word

				w = word.replace("'","\\'") # get information from OMW file and make a sql with it (synset,word)
				cur.execute("SELECT * FROM `wei_"+lang+"_variant` WHERE `offset` LIKE '"+lang+"-"+syn+"' AND `word` LIKE '"+w+"'")
				rows = cur.fetchall()

				# only one result for word and synset in MCR 
				if len(rows) == 1:

					for row in rows:

						output_file_c.write(p + "\tCS: "+str(row['csco'])+"\tSTS:"+str(row['status'])+"\tW:"+row['word']+"\n")

				# more than one result for word and synset in MCR
				elif len(rows) > 1:

						print rows

						print "ERROR SYNSET:"+syn
						exit(1)

				# no results for word and synset in MCR
				else:

					w = word.replace("'","\\'") # all alternatives, diferents synsets, for specific word in OMW
					cur.execute("SELECT * FROM `wei_"+lang+"_variant` WHERE `word` LIKE '"+w+"'")
					rows_w = cur.fetchall()

					alt = ""

					for row_w in rows_w:

							alt = alt + "\n\tSYN:"+row_w['offset']+"\tSTS:"+str(row_w['status'])+"\tCS: "+str(row_w['csco'])+"\tW:"+row_w['word']

					# if we have alternatives print in alternative file else we write in missing files
					if not alt=="":
						output_file_a.write(p+alt+"\n")
					else:
						output_file_m.write(p+"\n")
			else:
				print "WARNING EMPTY VARIANT AT LINE "+str(idx+1)+"\t FILE:wn-wikt-"+lng+".tab\tSYNSET:"+syn

	input_file.close()
	output_file_c.close()
	output_file_m.close()
	output_file_a.close()
	print("CLOSE FILES FOR LANGUAGE "+lng)
