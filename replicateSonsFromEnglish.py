#!/usr/bin/python

import textwrap, argparse
import pymysql

#can use this also
#import MySQLdb
if __name__ == '__main__':

    argument_parser = argparse.ArgumentParser(
         prog='replicateSonsFromEnglish.py',
         formatter_class=argparse.RawDescriptionHelpFormatter,
         description=textwrap.dedent('''\
         Generate sql to create new synsets in MCR from a list of synsets.
         --------------------------------
             example of use $python3 %(prog)s --host host --db database --user user --pwd password
         '''))

    argument_parser.add_argument('--host', dest='host_db', required=True, type=str , help='host url\'s database (required)')
    argument_parser.add_argument('--user', dest='user_db', required=True, type=str , help='user\'s database (required)')
    argument_parser.add_argument('--pwd', dest='pwd_db', required=True, type=str , help='password\'s database (required)')
    argument_parser.add_argument('--db', dest='db_db', required=True, type=str , help='database\'s selection (required)')

    argument_parser.add_argument('--outfile', dest='outfile', required=True, type=str , help='out file of (required)')

    args = argument_parser.parse_args()

    db = pymysql.connect(host=args.host_db, user=args.user_db, passwd=args.pwd_db, db=args.db_db) 
    cur = db.cursor(pymysql.cursors.DictCursor) 

    ofile = open(args.outfile,'w')

    cur.execute("SELECT offset,sons FROM `wei_eng-30_synset`")

    rows = cur.fetchall()

    for row in rows:

        off = row['offset'].split('-')[2]
        pos = row['offset'].split('-')[3]

        for lng in ['cat','eus','glg','por','spa']:

            ofile.write("UPDATE `wei_"+lng+"-30_synset` SET `sons` = '"+str(row['sons'])+"' WHERE `offset` = '"+lng+"-30-"+off+"-"+pos+"';\n")

    ofile.close()
