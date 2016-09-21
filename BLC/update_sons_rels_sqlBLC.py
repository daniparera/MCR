#!/usr/bin/python

import os
import textwrap, argparse
import pymysql

if __name__ == '__main__':

    argument_parser = argparse.ArgumentParser(
         prog='update_sons_rels_sqlBLC.py',
         formatter_class=argparse.RawDescriptionHelpFormatter,
         description=textwrap.dedent('''\
         update BLC's represents and relation presents in MCR
         --------------------------------
             example of use: $ python3 %(prog)s --host host --db database --user user --pwd password
         '''))

    #argument_parser.add_argument('--inputfiles', dest='inputfiles', action='append', required=True, type=str , help='input data file (required, without extension), it can be more than one')

    argument_parser.add_argument('--host', dest='host_db', required=True, type=str , help='host url\'s database (required for calculate relations)')
    argument_parser.add_argument('--user', dest='user_db', required=True, type=str , help='user\'s database (required for calculate relations)')
    argument_parser.add_argument('--pwd', dest='pwd_db', required=True, type=str , help='password\'s database (required for calculate relations)')
    argument_parser.add_argument('--db', dest='db_db', required=True, type=str , help='database\'s selection (required for calculate relations)')

    args = argument_parser.parse_args()

    out_file_sql = open('out/update_sons_rels.sql', "w")

    # Check or create output folder ###################################################################################
    if not os.path.exists('out'):
        os.makedirs('out')

    # Create sql connection ###################################################################################
    db = pymysql.connect(host=args.host_db, user=args.user_db, passwd=args.pwd_db, db=args.db_db) 
    cur = db.cursor(pymysql.cursors.DictCursor) 

    cur.execute("SELECT * FROM `wei_ili_to_blc` WHERE modif='+'")

    for row in cur.fetchall():

        synset = '-'.join(row['iliOffset'].split('-')[2:4])

        cur.execute("SELECT COUNT(*) as count from `wei_eng-30_relation` WHERE sourceSynset='eng-30-" + synset + "' OR targetSynset='eng-30-" + synset + "'")

        rels = str(cur.fetchone()['count'])

        cur.execute("SELECT COUNT(*) as represents from `wei_ili_to_blc` WHERE `blc` = 'ili-30-" + synset + "'")

        represent = cur.fetchone()['represents']

        cur.execute("SELECT COUNT(*) as top from `wei_ili_to_blc` WHERE `iliOffset` = 'ili-30-" + synset + "' AND `blc` = 'top'")

        if str(cur.fetchone()['top']) == '1':
             represent = represent + 1

        out_file_sql.write("UPDATE `wei_ili_to_blc` SET `represent`="+str(represent)+", `relations`="+str(rels)+" WHERE `iliOffset` = 'ili-30-"+synset+"';\n")

    out_file_sql.close()
