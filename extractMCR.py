#!/usr/bin/python

import textwrap, argparse
import pymysql
import os

#can use this also
#import MySQLdb
if __name__ == '__main__':

    argument_parser = argparse.ArgumentParser(
         prog='extractMCR.py',
         formatter_class=argparse.RawDescriptionHelpFormatter,
         description=textwrap.dedent('''\
         Extract information from specific table in MCR, tabulated format
         --------------------------------
             example of use $python3 %(prog)s --host host --db database --user user --pwd password
         '''))

    argument_parser.add_argument('--host', dest='host_db', required=True, type=str , help='host url\'s database (required)')
    argument_parser.add_argument('--user', dest='user_db', required=True, type=str , help='user\'s database (required)')
    argument_parser.add_argument('--pwd', dest='pwd_db', required=True, type=str , help='password\'s database (required)')
    argument_parser.add_argument('--db', dest='db_db', required=True, type=str , help='database\'s selection (required)')
    argument_parser.add_argument('--tb', dest='tb_db', required=True, type=str , help='table\'s selection (required)')

    argument_parser.add_argument('--where_k', dest='where_k', required=False, type=str , help='where key (optional)')
    argument_parser.add_argument('--where_v', dest='where_v', required=False, type=str , help='where value (optional)')
    argument_parser.add_argument('--where_c', dest='where_c', required=False, type=str , choices=['>','<','='], help='where comp (optional)')

    argument_parser.add_argument('--outfile', dest='outfile', required=True, type=str , help='out file of (required)')

    argument_parser.add_argument('--f', dest='fields', action='append', required=False, type=str , help='fields (default all, optional)')

    args = argument_parser.parse_args()

    #choose one of them
    #db = MySQLdb.connect(host=args.host_db, user=args.user_db, passwd=args.pwd_db, db=args.db_db) 
    #cur = db.cursor(MySQLdb.cursors.DictCursor) 

    db = pymysql.connect(host=args.host_db, user=args.user_db, passwd=args.pwd_db, db=args.db_db) 
    cur = db.cursor(pymysql.cursors.DictCursor) 

    cur.execute("show columns FROM `"+args.tb_db+"`")
    columns = cur.fetchall()

    fields = args.fields

    sql_orderby = ""

    if fields is None: 
        fields = []
        for field in columns:
            fields.append(field["Field"])
    else: 
        sql_orderby = "ORDER BY "+fields[0]

    sql_where = ""

    print(fields)
    if args.where_k is not None and args.where_v is not None and args.where_c is not None: 

        if args.where_k not in fields:
            print("Where key not in Fields.\n")
            #exit()

        sql_where = " WHERE `"+args.where_k+"` "+args.where_c+" "+args.where_v

    print("SELECT "+", ".join(fields)+" FROM `"+args.tb_db+"` "+sql_where+" "+sql_orderby)
    cur.execute("SELECT "+", ".join(fields)+" FROM `"+args.tb_db+"` "+sql_where+" "+sql_orderby)

    rows = cur.fetchall()

    # create directories #####################

    dirs = args.outfile.split('/')
    acc_d = ''

    for d in dirs[:-1]:

        acc_d = acc_d+d+"/"
        if not os.path.exists(acc_d):
            os.makedirs(acc_d)

    ofile = open(args.outfile,'w')

    for row in rows:
        out = ""
        tab = "\t"
        for field in columns:
            if len(fields) != 0 and field["Field"] == fields[-1]: tab = "\n"
            if field["Field"] in fields: out = out + str(row[field['Field']]) + tab
        ofile.write(out)
