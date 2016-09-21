#!/usr/bin/python

import os
import textwrap, argparse

if __name__ == '__main__':

    argument_parser = argparse.ArgumentParser(
         prog='sqlBLC.py',
         formatter_class=argparse.RawDescriptionHelpFormatter,
         description=textwrap.dedent('''\
         create a BLC data file from data stored in BLC datasets to import to MCR
         --------------------------------
             example of use: $ python3 %(prog)s --inputfiles out/wn30/descmin20/all+gloss/BLCnoun [[--inputfiles out/wn30/descmin20/all+gloss/BLCverb]] [[--host host --db database --user user --pwd password --relations]]
         '''))

    argument_parser.add_argument('--inputfiles', dest='inputfiles', action='append', required=True, type=str , help='input data file (required, without extension), it can be more than one')

    argument_parser.add_argument('--host', dest='host_db', required=False, type=str , help='host url\'s database (required for calculate relations)')
    argument_parser.add_argument('--user', dest='user_db', required=False, type=str , help='user\'s database (required for calculate relations)')
    argument_parser.add_argument('--pwd', dest='pwd_db', required=False, type=str , help='password\'s database (required for calculate relations)')
    argument_parser.add_argument('--db', dest='db_db', required=False, type=str , help='database\'s selection (required for calculate relations)')

    argument_parser.add_argument('--relations', dest='relations', action='store_true', help='Calculate relations')

    args = argument_parser.parse_args()

    relations = args.relations

    # Check or create output folder ###################################################################################
    if not os.path.exists('out'):
        os.makedirs('out')

    # Check sql connection ###################################################################################
    if relations:

        if args.host_db is None or args.user_db is None or args.pwd_db is None or args.db_db is None:

            print("Relations option need SQL connection parameters.\n")
            exit()

        else:

            import pymysql

            db = pymysql.connect(host=args.host_db, user=args.user_db, passwd=args.pwd_db, db=args.db_db) 
            cur = db.cursor(pymysql.cursors.DictCursor) 

    out_file_sql = open('out/blcs.sql', "w")
    out_file_sql.write("DELETE FROM `wei_ili_to_blc`;\n")

    for f in args.inputfiles:

        input_file_rel = open(f+".rel", "r")
        content_file_rel = input_file_rel.readlines()
        input_file_list = open(f+".list", "r")
        content_file_list = input_file_list.readlines()

        blcs = {}

        for line in content_file_list:

            blc,sf,represent,sons = line.rstrip().split()[0:4]
            blcs[blc] = represent

        for line in content_file_rel:
            source,target = line.rstrip().split('\t')

            if source in blcs:     modif,rep = ['+',blcs[source]]
            else:             modif,rep = ['',0]

            spos = source.split('-')[-1]

            if relations:

                cur.execute("SELECT COUNT(*) as count from `wei_eng-30_relation` where sourceSynset='eng-30-" + source + "' OR targetSynset='eng-30-" + source + "'")

                rels = str(cur.fetchone()['count'])

                sql_insert = "INSERT INTO `wei_ili_to_blc` (`iliWnId`, `modif`, `represent`, `iliPos`, `iliOffset`, `blc`, `relations`) VALUES "

                if source != target:
                    out_file_sql.write( sql_insert + "('eng-30','" + modif + "'," + str(rep) + ",'" + spos + "','ili-30-" + source + "','ili-30-" + target + "'," + rels + ");\n")
                else:
                    out_file_sql.write( sql_insert + "('eng-30','" + modif + "'," + str(rep) + ",'" + spos + "','ili-30-" + source + "', 'top'," + rels + ");\n")

            else:
                sql_insert = "INSERT INTO `wei_ili_to_blc` (`iliWnId`, `modif`, `represent`, `iliPos`, `iliOffset`, `blc`) VALUES "

                # blc , iliOffset , iliPos , iliWnId , modif
                if source != target:
                    out_file_sql.write( sql_insert + "('eng-30','" + modif + "'," + str(rep) + ",'" + spos + "','ili-30-" + source + "','ili-30-" + target + "');\n")
                else:
                    out_file_sql.write( sql_insert + "('eng-30','" + modif + "'," + str(rep) + ",'" + spos + "','ili-30-" + source + "', 'top');\n")
                    #if spos == 'v':
                    #    out_file_sql.write( sql_insert + "('eng-30','" + modif + "'," + str(rep) + ",'" + spos + "','ili-30-" + source + "', 'top_verbs');\n")
                    #if spos == 'n':
                    #    out_file_sql.write( sql_insert + "('eng-30','" + modif + "'," + str(rep) + ",'" + spos + "','ili-30-" + source + "', 'top_nouns');\n")

        input_file_rel.close()
        input_file_list.close()
    out_file_sql.close()
