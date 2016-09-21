#!/usr/bin/python

import os, subprocess
import textwrap, argparse

if __name__ == '__main__':

    argument_parser = argparse.ArgumentParser(
         prog='stability.py',
         formatter_class=argparse.RawDescriptionHelpFormatter,
         description=textwrap.dedent('''\
         create a graphical functions from input data
         --------------------------------
             example of use $python3 %(prog)s
         '''))

    argument_parser.add_argument('--inputdir', dest='inputdir', required=True, type=str , help='input directory (required)')
    argument_parser.add_argument('--mode', dest='mode', required=False, type=str , choices=['v','h'], default='v', help='weight type (optional, default freq)')

    args = argument_parser.parse_args()

    inputdir = args.inputdir
    mode = args.mode

    list_directories = []

    #for d1 in os.listdir(inputdir):

    #    list_directories.append(d1)

    list_directories = ['all+gloss+freq', 'all+gloss', 'gloss+freq', 'all+freq', 'all', 'gloss', 'freq']

    out_file = open('stability_senses.csv', "w")

    # build header #######################################################################################################################

    out_file.write("vs,all,nouns,verbs\n")

    # build body #########################################################################################################################

    visit = []

    for elem_1 in list_directories:
        for elem_2 in list_directories:
            if elem_1 != elem_2 and elem_1 not in visit and elem_2 not in visit: 

                out_file.write(elem_1 + "_vs_" + elem_2 + ",")

                # all
                subprocess.check_output("sort "+inputdir+"/"+elem_1+"/eng-30.tab > tmp1.txt", shell=True)
                subprocess.check_output("sort "+inputdir+"/"+elem_2+"/eng-30.tab > tmp2.txt", shell=True)

                equals = subprocess.check_output("comm -1 -2 tmp1.txt tmp2.txt | wc | gawk '{print $1}'", shell=True).strip()
                num_lines_senses = sum(1 for line in open("tmp1.txt"))

                # nouns
                subprocess.check_output("sort "+inputdir+"/"+elem_1+"/eng-30.tab | grep '\-n' > tmp1.txt", shell=True)
                subprocess.check_output("sort "+inputdir+"/"+elem_2+"/eng-30.tab | grep '\-n' > tmp2.txt", shell=True)

                equals_n = subprocess.check_output("comm -1 -2 tmp1.txt tmp2.txt | wc | gawk '{print $1}'", shell=True).strip()
                num_lines_senses_n = sum(1 for line in open("tmp1.txt"))

                # verbs
                subprocess.check_output("sort "+inputdir+"/"+elem_1+"/eng-30.tab | grep '\-v' > tmp1.txt", shell=True)
                subprocess.check_output("sort "+inputdir+"/"+elem_2+"/eng-30.tab | grep '\-v' > tmp2.txt", shell=True)

                equals_v = subprocess.check_output("comm -1 -2 tmp1.txt tmp2.txt | wc | gawk '{print $1}'", shell=True).strip()
                num_lines_senses_v = sum(1 for line in open("tmp1.txt"))

                out_file.write(str(float(equals)/num_lines_senses)+","+str(float(equals_n)/num_lines_senses_n)+","+str(float(equals_v)/num_lines_senses_v)+"\n")

        if elem_1 not in visit: visit.append(elem_1)

    out_file.close()
    subprocess.check_output("rm tmp1.txt", shell=True)
    subprocess.check_output("rm tmp2.txt", shell=True)

