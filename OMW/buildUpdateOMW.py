#!/usr/bin/python

import subprocess, time
import textwrap, argparse
import pymysql

#can use this also
#import MySQLdb

parserarg = argparse.ArgumentParser(
     prog='buildUpdateOMW.py',
     formatter_class=argparse.RawDescriptionHelpFormatter,
     description=textwrap.dedent('''\
         check MCR with OMW datasets
         --------------------------------
             example of use $python3 %(prog)s --host host --db database --user user --pwd password
         '''))

parserarg.add_argument('--host', dest='host_db', required=True, type=str , help='host url\'s database (required)')
parserarg.add_argument('--user', dest='user_db', required=True, type=str , help='user\'s database (required)')
parserarg.add_argument('--pwd', dest='pwd_db', required=True, type=str , help='password\'s database (required)')
parserarg.add_argument('--db', dest='db_db', required=True, type=str , help='database\'s selection (required)')

parserarg.add_argument('--cs', dest='cs', required=False, default='50', type=int , help='cs (default 50)')
parserarg.add_argument('--t', dest='t', required=False, default='wikt', type=str , help='file type (cldr/wikt)')
parserarg.add_argument('--l', dest='l', required=False, default='spa-30', type=str , help='language (default spa-30)')

args = parserarg.parse_args()

cs = args.cs
t = args.t
l = args.l

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

if not l in languages:
	print("language must be present in MCR, options:"+str(languages))
	exit(1)

if not os.path.exists('out'):
	os.makedirs('out')

for lang in languages:

	if lang == l:

		lng = lang.split("-")[0]
		print("OPEN FILES FOR LANGUAGE "+lng)

		input_file = open('data/wn-wikt-'+lng+'.tab', "r")
		output_file_upd = open('out/updateCS-'+lng+'.tab', "w")
		output_file_sql = open('out/updateCS-'+lng+'.sql', "w")

		for idx,line in enumerate(input_file.readlines()):

			li=line.strip()
			if not li.startswith("#"):

				if(len(li.split("\t")) == 3):	

					syn,lemma,word = li.split("\t")

					p = "SYN:"+syn+"\tW:"+word

					w = word.replace("'","\\'") # get information from OMW file and make a sql with it (synset,word)
					cur.execute("SELECT * FROM `wei_"+lang+"_variant` WHERE `offset` LIKE '"+lang+"-"+syn+"' AND `word` LIKE '"+w+"' AND `csco` < "+str(cs))
					rows = cur.fetchall()

					# only one result for word and synset in MCR 
					if len(rows) == 1:

						for row in rows:

							#print (p + "\tCS: "+str(row['csco'])+"\tSTS:"+str(row['status'])+"\tW:"+row['word']+"\n")
							output_file_upd.write(syn + "\t"+str(row['csco'])+"\t"+w+"\n")
							output_file_sql.write("UPDATE `wei_"+lang+"_variant` SET `csco`=99 WHERE `offset` LIKE '"+lang+"-"+syn+"' AND `word` LIKE '"+w+"';\n")

					# more than one result for word and synset in MCR
					elif len(rows) > 1:

							print rows

							print "ERROR SYNSET:"+syn
							exit(1)

		input_file.close()
		output_file_upd.close()
		output_file_sql.close()
		print("CLOSE FILES FOR LANGUAGE "+lng)
