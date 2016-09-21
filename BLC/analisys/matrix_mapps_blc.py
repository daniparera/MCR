#!/usr/bin/python

# check quins bc hi ha a MCR. d'on provenen...

import os,sys
import textwrap, argparse

from collections import defaultdict
from collections import OrderedDict

if __name__ == '__main__':

    argument_parser = argparse.ArgumentParser(
        prog='matrix_mapps_blc.py',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        description=textwrap.dedent('''\
            compare different blc's sets
            --------------------------------
                example of use $python3 %(prog)s 
                python matrix_mapps_blc.py [[--language spa-30]] [[--language cat-30]] [[...]]
            '''))

    argument_parser.add_argument('--in_file', dest='in_file', action='append', required=True, type=str , help='input\'s file (required)')
    argument_parser.add_argument('--out_file', dest='out_file', required=True, type=str , help='output\'s file (required)')
    argument_parser.add_argument('--occ', dest='occ', required=False, type=int, help='minimum occurences (optional)')

    args = argument_parser.parse_args()

    header = args.in_file

    if args.occ == None:
        occ = 0
    else:
        occ = args.occ

    matrix_dict = defaultdict(dict)

    for fitxer in args.in_file:

        input_file = open(fitxer, "r")

        for line in input_file.readlines():

            syn = line.split()[0]

            matrix_dict[syn][fitxer] = 1

    matrix_dict_ord = OrderedDict(sorted(matrix_dict.items(), key=lambda t: t[0], reverse=False))

    ### Output updated matrix ##################################################

    output_file = open(str(occ)+"_"+args.out_file, "w")

    output_file.write('synset\t')

    for key in header:
        output_file.write(key+'\t')

    output_file.write('\n')

    for syn,pair in matrix_dict_ord.items():
        if occ <= len(pair):
            output_file.write(syn)
            for fitxer in header:
                if fitxer in pair:
                    output_file.write('\t1')
                else:
                    output_file.write('\t0')
            output_file.write('\n')

    output_file.close()
