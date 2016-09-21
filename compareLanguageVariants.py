#!/usr/bin/python

import textwrap, argparse
from collections import OrderedDict
import pymysql
#can use this also
#import MySQLdb

if __name__ == '__main__':

    #conflict_handler='resolve')

    parent1 = argparse.ArgumentParser(
         prog='compareLanguageVariants.py',
         formatter_class=argparse.RawDescriptionHelpFormatter,
         description=textwrap.dedent('''\
         Extract information from specific table in MCR, tabulated format
         --------------------------------
             example of use $python3 %(prog)s --host host --db database --user user --pwd password
         '''))

    parent1.add_argument('--host', dest='host_db', required=True, type=str , help='host url\'s database (required)')
    parent1.add_argument('--user', dest='user_db', required=True, type=str , help='user\'s database (required)')
    parent1.add_argument('--pwd', dest='pwd_db', required=True, type=str , help='password\'s database (required)')
    parent1.add_argument('--db', dest='db_db', required=True, type=str , help='database\'s selection (required)')
    parent1.add_argument('--langOrg', required=True, type=str , help='origin language\'s selection (required)')
    parent1.add_argument('--langDst', required=True, type=str , help='destination language\'s selection (required)')

    args1 = parent1.parse_args()

    #choose one of them
    #db = MySQLdb.connect(host=args1.host_db, user=args1.user_db, passwd=args1.pwd_db, db=args1.db_db) 
    #cur = db.cursor(MySQLdb.cursors.DictCursor) 

    db = pymysql.connect(host=args1.host_db, user=args1.user_db, passwd=args1.pwd_db, db=args1.db_db) 
    cur = db.cursor(pymysql.cursors.DictCursor) 

    # we build lists of languages.
    languages_mcr = []
    cur.execute("select * FROM wei_languages")
    rows = cur.fetchall()
    for row in rows: languages_mcr.append(row["code"])

    parent2 = argparse.ArgumentParser(add_help=False)

    parent2.add_argument('--host', dest='host_db', required=True, type=str , help='host url\'s database (required)')
    parent2.add_argument('--user', dest='user_db', required=True, type=str , help='user\'s database (required)')
    parent2.add_argument('--pwd', dest='pwd_db', required=True, type=str , help='password\'s database (required)')
    parent2.add_argument('--db', dest='db_db', required=True, type=str , help='database\'s selection (required)')
    parent2.add_argument('--langOrg', dest='langOrg', required=True, type=str, choices=languages_mcr, help='origin language\'s selection (required)')
    parent2.add_argument('--langDst', dest='langDst', required=True, type=str, choices=languages_mcr, help='destination language\'s selection (required)')

    args2 = parent2.parse_args()

    # this is the top level parser
    parser = argparse.ArgumentParser(
         conflict_handler='resolve',
         parents=[parent1,parent2])

    if args2.langOrg == args2.langDst:
        print("The program need DIFFERENT languages.\n")
        exit()

    cur.execute("SELECT word,offset FROM `wei_"+args2.langOrg+"_variant`")
    rows = cur.fetchall()

    # build a list of variants from the origin language

    variants = {}

    for row in rows:

        syn = '-'.join(row['offset'].split('-')[2:4])

        try:
            variants[syn].append(row['word'])
        except KeyError:
            variants[syn] = [row['word']]

    cur.execute("SELECT word,offset FROM `wei_"+args2.langDst+"_variant`")
    rows = cur.fetchall()

    present_word = {}
    not_present_word = {}
    not_present_synset = {}

    # go through all elements and check that exist or not in a list of variants from the origin language

    for row in rows:

        syn = '-'.join(row['offset'].split('-')[2:4])

        try:
            if row['word'] in variants[syn]:
                try:
                    present_word[syn].append(row['word'])
                except KeyError:
                    present_word[syn] = [row['word']]
            else:
                try:
                    not_present_word[syn].append(row['word'])
                except KeyError:
                    not_present_word[syn] = [row['word']]
        except KeyError:
            try:
                not_present_synset[syn].append(row['word'])
            except KeyError:
                not_present_synset[syn] = [row['word']]

    present_word_ord = OrderedDict(sorted(present_word.items(), key=lambda t: t[0], reverse=False))
    not_present_word_ord = OrderedDict(sorted(not_present_word.items(), key=lambda t: t[0], reverse=False))
    not_present_synset_ord = OrderedDict(sorted(not_present_synset.items(), key=lambda t: t[0], reverse=False))

    # output files


    out_file = open("present_word_"+args2.langOrg+"-"+args2.langDst+".tab", "w")

    for key,words in present_word_ord.items():
        for word in words:
            out_file.write(word+"\t"+key+"\n")

    out_file.close()

    out_file = open("not_present_word_"+args2.langOrg+"-"+args2.langDst+".tab", "w")

    for key,words in not_present_word_ord.items():
        for word in words:
            out_file.write(key+"\t"+word+"\n")

    out_file.close()

    out_file = open("not_present_synset_"+args2.langOrg+"-"+args2.langDst+".tab", "w")

    for key,words in not_present_synset_ord.items():
        for word in words:
            out_file.write(key+"\t"+word+"\n")

    out_file.close()
