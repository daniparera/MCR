#!/usr/bin/python

import textwrap, argparse

#can use this also
#import MySQLdb
if __name__ == '__main__':

    argument_parser = argparse.ArgumentParser(
         prog='generateSQLNewSynsets.py',
         formatter_class=argparse.RawDescriptionHelpFormatter,
         description=textwrap.dedent('''\
         Generate sql to create new synsets in MCR from a list of synsets.
         --------------------------------
             example of use $python3 %(prog)s --host host --db database --user user --pwd password
         '''))

    argument_parser.add_argument('--infile', dest='infile', required=True, type=str , help='in file of (required)')
    argument_parser.add_argument('--outfile', dest='outfile', required=True, type=str , help='out file of (required)')

    args = argument_parser.parse_args()

    db = pymysql.connect(host=args.host_db, user=args.user_db, passwd=args.pwd_db, db=args.db_db) 
    cur = db.cursor(pymysql.cursors.DictCursor) 

    sfile = open(args.infile,'r')
    content_file = sfile.readlines()

    ofile = open(args.outfile,'w')
	
    for line in content_file:

        striped = line.strip()

        lng = striped.split('-')[0]
        pos = striped.split('-')[3]

        ofile.write("INSERT INTO `wei_"+lng+"-30_synset` (`offset`, `pos`, `sons`, `status`, `lexical`, `instance`, `gloss`, `level`, `levelFromTop`, `mark`, `note`) VALUES ('"+striped+"', '"+pos+"', '0', '-', '-', '0', '', '0', '0', '------', '');\n")
	
    sfile.close()
    ofile.close()
