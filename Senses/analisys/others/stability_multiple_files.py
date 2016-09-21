#!/usr/bin/python

import os, subprocess
import textwrap, argparse

if __name__ == '__main__':

    argument_parser = argparse.ArgumentParser(
         prog='stability_multiple_files.py',
         formatter_class=argparse.RawDescriptionHelpFormatter,
         description=textwrap.dedent('''\
         create a graphical functions from input data, multiple files
         --------------------------------
             example of use $python3 %(prog)s
         '''))

    argument_parser.add_argument('--inputdir', dest='inputdir', required=True, type=str , help='input directory (required)')
    argument_parser.add_argument('--language', dest='lng', action='append', required=False, type=str , help='language (default all, optional)')

    args = argument_parser.parse_args()

    inputdir = args.inputdir
    lng = args.lng

    list_directories = []
    lang_files = []

    for d1 in os.listdir(inputdir):

        list_directories.append(d1)

        for d2 in os.listdir(inputdir+"/"+d1):

            lng_file = d2.replace('.tab','')

            if lng_file not in lang_files:

                lang_files.append(lng_file)

    print(lang_files)

    # if no introduce language parameter, all language. otherwise check that introduced language is in MCR
    if lng is None: 
        languages = lang_files
    else: 
        for l in lng:
            if not l in lang_files:
                print("Language must be present in files, options:"+str(lang_files)+"\n")
                exit(1)
        languages = lng

    # build header #######################################################################################################################

    out_file_2 = open(inputdir+'/../stability_senses_2.csv', "w")

    visit = []

    for elem_1 in list_directories:
        for elem_2 in list_directories:
            if elem_1 != elem_2 and elem_1 not in visit and elem_2 not in visit: 

                out_file_2.write(elem_1 + " vs " + elem_2 + " / " + elem_1 + " , ")
                out_file_2.write(elem_1 + " vs " + elem_2 + " / " + elem_2 + " , ")

        if elem_1 not in visit: visit.append(elem_1)
    
    out_file_2.write("\n")

    # build body #########################################################################################################################

    for lang in languages:

        visit = []

        out_file = open(inputdir+'/../stability_senses_'+lang+'.tab', "w")

        for elem_1 in list_directories:
            for elem_2 in list_directories:
                if elem_1 != elem_2 and elem_1 not in visit and elem_2 not in visit: 

                    num_lines_senses_1 = sum(1 for line in open(inputdir+"/"+elem_1+"/"+lang+".tab"))
                    num_lines_senses_2 = sum(1 for line in open(inputdir+"/"+elem_2+"/"+lang+".tab"))

                    subprocess.check_output("sort "+inputdir+"/"+elem_1+"/"+lang+".tab > tmp1.txt", shell=True)
                    subprocess.check_output("sort "+inputdir+"/"+elem_2+"/"+lang+".tab > tmp2.txt", shell=True)

                    equals = subprocess.check_output("comm -1 -2 tmp1.txt tmp2.txt | wc | gawk '{print $1}'", shell=True).strip()

                    out_file.write(str(float(equals)/num_lines_senses_1)+" ")
                    out_file.write(elem_1 + "_vs_" + elem_2 + "\n")
                    out_file_2.write(str(float(equals)/num_lines_senses_1)+" , ")
                    out_file_2.write(str(float(equals)/num_lines_senses_2)+" , ")

            if elem_1 not in visit: visit.append(elem_1)

        out_file.close()

    out_file_2.write("\n")
    out_file_2.close()
    #subprocess.check_output("sort -r "+inputdir+"/../stability_senses.tab > "+inputdir+"/../stability_senses_ord.tab", shell=True)

