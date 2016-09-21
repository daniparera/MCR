#!/usr/bin/python

import os, subprocess
import textwrap, argparse
import itertools
from collections import OrderedDict

# to get POS correspondence in sense.index file
def translation_ss_type(ss):

	if int(ss) == 1:
		return 'n'
	if int(ss) == 2:
		return 'v'
	if int(ss) == 3:
		return 'a'
	if int(ss) == 4:
		return 'r'
	if int(ss) == 5:
		return 'a'

options = ['count','stability','polysemy']
combs = []

for i in range(1, len(options)+1):
    els = ["+".join(list(x)) for x in itertools.combinations(options, i)]
    combs.extend(els)

if __name__ == '__main__':

    argument_parser = argparse.ArgumentParser(
         prog='stability_list.py',
         formatter_class=argparse.RawDescriptionHelpFormatter,
         description=textwrap.dedent('''\
         create a data file to display graphical functions from blc's input data
         --------------------------------
             example of use $python3 %(prog)s
         '''))

#    argument_parser.add_argument('--inputfiles', dest='inputfiles', action='append', required=True, type=str , help='input data file (required, without extension), it can be more than one')
    argument_parser.add_argument('--mode', dest='mode', required=False, type=str , choices=combs, default='count', help='mode (optional, default count)')
    argument_parser.add_argument('--sensefile', dest='sensefile', required=False, type=str , help='sense file (required for count option)')

    args = argument_parser.parse_args()

    mode = args.mode.split("+")
    sensefile = args.sensefile

    # create output dir if not exists
    if not os.path.exists('out'):
        os.makedirs('out')


    # starts count declarations #####################################################################################################################################

    if "count" in mode:

        if sensefile is None:
            print("Count option need sensefile.\n")
            exit()

        lex_synsets = {}

        sfile = open(sensefile,'r')
        content_file = sfile.readlines()
    
        for line in content_file:

            sense_key,synset_offset,sense_number,tag_cnt = line.split()

            lemma,lex_sense = sense_key.split('%')

            ss_type,lex_filenum,lex_id,head_word,head_id = lex_sense.split(':')

            lex_synsets[synset_offset+"-"+translation_ss_type(ss_type)] = lex_filenum

    list_occ_n = {}
    list_occ_n_sf = {}
    list_occ_n_sf_alt = {}
    list_occ_v = {}
    list_occ_v_sf = {}
    list_occ_v_sf_alt = {}

    list_occ_n["general"] = {}
    list_occ_n_sf["general"] = {}
    list_occ_n_sf_alt["general"] = {}
    list_occ_v["general"] = {}
    list_occ_v_sf["general"] = {}
    list_occ_v_sf_alt["general"] = {}

    list_occ_not_generated = True

    #list_cnt_n = {}
    #list_cnt_v = {}

    for d1 in sorted(os.listdir("../out/wn30/")):

        for d2 in os.listdir("../out/wn30/"+d1):

            if list_occ_not_generated == True:
                list_occ_n[d2] = {}
                list_occ_n_sf[d2] = {}
                list_occ_n_sf_alt[d2] = {}
                list_occ_v[d2] = {}
                list_occ_v_sf[d2] = {}
                list_occ_v_sf_alt[d2] = {}

        list_occ_not_generated = False

    # end count declarations #####################################################################################################################################

    # starts stability declarations #####################################################################################################################################

    if "stability" in mode:

        of_stability_n_list = open('out/stability_n_list.csv', "w")
        of_stability_v_list = open('out/stability_v_list.csv', "w")
        of_stability_n_rel = open('out/stability_n_rel.csv', "w")
        of_stability_v_rel = open('out/stability_v_rel.csv', "w")

        of_stability_n_list.write("sons , ")
        of_stability_v_list.write("sons , ")
        of_stability_n_rel.write("sons , ")
        of_stability_v_rel.write("sons , ")

    # end stability declarations #####################################################################################################################################

    # starts polysemy declarations #####################################################################################################################################

    if "polysemy" in mode:

        of_polysemy_n = open('out/polysemy_n.csv', "w")
        of_polysemy_v = open('out/polysemy_v.csv', "w")

        of_polysemy_n.write("sons , ")
        of_polysemy_v.write("sons , ")

        of_polysemy_names = {}
        for x in range(3,29): of_polysemy_names["n_"+str(x).zfill(2)] = open('out/polysemy_n-'+str(x).zfill(2)+'.csv', "w")
        for x in range(29,44): of_polysemy_names["v_"+str(x)] = open('out/polysemy_v-'+str(x)+'.csv', "w")

        for x in range(3,29): of_polysemy_names["n_"+str(x).zfill(2)].write("sons , ")
        for x in range(29,44): of_polysemy_names["v_"+str(x)].write("sons , ")

    # end polysemy declarations #####################################################################################################################################

    #print [os.path.join(d,o) for o in os.listdir(d) if os.path.isdir(os.path.join(d,o))]

    # start stability and polysemy headers #####################################################################################################################################

    for d1 in sorted(os.listdir("../out/wn30/")):

        list_d = []
        visit = []

        for d2 in os.listdir("../out/wn30/"+d1):

            list_d.append(d2)

        header_array = []
        num_lines_dict = {}

        for elem_1 in list_d:
            for elem_2 in list_d:
                if elem_1 != elem_2 and elem_1 not in visit and elem_2 not in visit:

                    # start stability header #####################################################################################################################################

                    if "stability" in mode:

                        of_stability_n_list.write(elem_1 + " vs " + elem_2 + " / " + elem_1 + " , ")
                        of_stability_v_list.write(elem_1 + " vs " + elem_2 + " / " + elem_1 + " , ")
                        of_stability_n_rel.write(elem_1 + " vs " + elem_2 + " , ")
                        of_stability_v_rel.write(elem_1 + " vs " + elem_2 + " , ")

                        of_stability_n_list.write(elem_1 + " vs " + elem_2 + " / " + elem_2 + " , ")
                        of_stability_v_list.write(elem_1 + " vs " + elem_2 + " / " + elem_2 + " , ")

                    # end stability header #####################################################################################################################################

            # start polysemy header #####################################################################################################################################

            if "polysemy" in mode:

                of_polysemy_n.write(elem_1 + "_Cls, "+elem_1 + "_R, "+elem_1 + "_Cls/R, ")
                of_polysemy_v.write(elem_1 + "_Cls, "+elem_1 + "_R, "+elem_1 + "_Cls/R, ")

                for x in range(3,29): of_polysemy_names["n_"+str(x).zfill(2)].write(elem_1 + "_Cls, "+elem_1 + "_R, "+elem_1 + "_Cls/R, ")
                for x in range(29,44): of_polysemy_names["v_"+str(x)].write(elem_1 + "_Cls, "+elem_1 + "_R, "+elem_1 + "_Cls/R, ")

            # end polysemy header #####################################################################################################################################

            if elem_1 not in visit: visit.append(elem_1)
        break

    if "stability" in mode:

        of_stability_n_list.write("\n")
        of_stability_v_list.write("\n")
        of_stability_n_rel.write("\n")
        of_stability_v_rel.write("\n")

    if "polysemy" in mode:

        of_polysemy_n.write("\n")
        of_polysemy_v.write("\n")

        for x in range(3,29): of_polysemy_names["n_"+str(x).zfill(2)].write("\n")
        for x in range(29,44): of_polysemy_names["v_"+str(x)].write("\n")

    for d1 in sorted(os.listdir("../out/wn30/")):

        visit = []

        descendents = int(d1.replace('descmin',''))

        if "stability" in mode:

            of_stability_n_list.write(str(descendents)+" , ")
            of_stability_v_list.write(str(descendents)+" , ")
            of_stability_n_rel.write(str(descendents)+" , ")
            of_stability_v_rel.write(str(descendents)+" , ")

        if "polysemy" in mode:

            of_polysemy_n.write(str(descendents)+" , ")
            of_polysemy_v.write(str(descendents)+" , ")

            for x in range(3,29): of_polysemy_names["n_"+str(x).zfill(2)].write(str(descendents)+" , ")
            for x in range(29,44): of_polysemy_names["v_"+str(x)].write(str(descendents)+" , ")

        # end stability and polysemy headers #####################################################################################################################################

        # start stability and polysemy bodies #####################################################################################################################################

        for elem_1 in list_d:
            for elem_2 in list_d:
                if elem_1 != elem_2 and elem_1 not in visit and elem_2 not in visit and "stability" in mode: 

                    # stability body #####################################################################################################################################

                    num_lines_noun_list_1 = sum(1 for line in open("../out/wn30/"+d1+"/"+elem_1+"/"+"BLCnoun.list"))
                    num_lines_verb_list_1 = sum(1 for line in open("../out/wn30/"+d1+"/"+elem_1+"/"+"BLCverb.list"))
                    num_lines_noun_rel = sum(1 for line in open("../out/wn30/"+d1+"/"+elem_1+"/"+"BLCnoun.rel"))
                    num_lines_verb_rel = sum(1 for line in open("../out/wn30/"+d1+"/"+elem_1+"/"+"BLCverb.rel"))

                    num_lines_noun_list_2 = sum(1 for line in open("../out/wn30/"+d1+"/"+elem_2+"/"+"BLCnoun.list"))
                    num_lines_verb_list_2 = sum(1 for line in open("../out/wn30/"+d1+"/"+elem_2+"/"+"BLCverb.list"))

                    subprocess.check_output("cat ../out/wn30/"+d1+"/"+elem_1+"/BLCnoun.list | gawk '{print $1}' > tmp1.txt", shell=True)
                    subprocess.check_output("cat ../out/wn30/"+d1+"/"+elem_2+"/BLCnoun.list | gawk '{print $1}' > tmp2.txt", shell=True)
                    eq_n_list = subprocess.check_output("comm -1 -2 tmp1.txt tmp2.txt | wc | gawk '{print $1}'", shell=True).strip()

                    eq_n_rel = subprocess.check_output("comm -1 -2 ../out/wn30/"+d1+"/"+elem_1+"/BLCnoun.rel ../out/wn30/"+d1+"/"+elem_2+"/BLCnoun.rel | wc | gawk '{print $1}'", shell=True).strip()

                    subprocess.check_output("cat ../out/wn30/"+d1+"/"+elem_1+"/BLCverb.list | gawk '{print $1}' > tmp1.txt", shell=True)
                    subprocess.check_output("cat ../out/wn30/"+d1+"/"+elem_2+"/BLCverb.list | gawk '{print $1}' > tmp2.txt", shell=True)
                    eq_v_list = subprocess.check_output("comm -1 -2 tmp1.txt tmp2.txt | wc | gawk '{print $1}'", shell=True).strip()

                    eq_v_rel = subprocess.check_output("comm -1 -2 ../out/wn30/"+d1+"/"+elem_1+"/BLCverb.rel ../out/wn30/"+d1+"/"+elem_2+"/BLCverb.rel | wc | gawk '{print $1}'", shell=True).strip()

                    of_stability_n_list.write(str(float(eq_n_list)/num_lines_noun_list_1)+" , ")
                    of_stability_v_list.write(str(float(eq_v_list)/num_lines_verb_list_1)+" , ")
                    of_stability_n_rel.write(str(float(eq_n_rel)/num_lines_noun_rel)+" , ")
                    of_stability_v_rel.write(str(float(eq_v_rel)/num_lines_verb_rel)+" , ")

                    of_stability_n_list.write(str(float(eq_n_list)/num_lines_noun_list_2)+" , ")
                    of_stability_v_list.write(str(float(eq_v_list)/num_lines_verb_list_2)+" , ")

            if elem_1 not in visit: visit.append(elem_1)

            # polysemy body, first for loop ####################################################################################################################################

            if "polysemy" in mode:

                # general



                r_n = float(subprocess.check_output("tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '{print $4\"-n\",$1}' | sort | uniq | join - ../out/wn30/"+d1+"/"+elem_1+"/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}'", shell=True).strip())

                r_v = float(subprocess.check_output("tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%2' | gawk '{print $4\"-v\",$1}' | sort | uniq | join - ../out/wn30/"+d1+"/"+elem_1+"/BLCverb.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}'", shell=True).strip())

                cls_n = float(subprocess.check_output("cat ../out/wn30/"+d1+"/"+elem_1+"/BLCnoun.list | gawk '$2=\"05\"{print $1}'| wc | gawk '{print $1}'", shell=True).strip())
                cls_v = float(subprocess.check_output("cat ../out/wn30/"+d1+"/"+elem_1+"/BLCverb.list | gawk '$2=\"13\"{print $1}'| wc | gawk '{print $1}'", shell=True).strip())

                of_polysemy_n.write(str(cls_n)+" , "+str(r_n)+" , "+str(cls_n/r_n)+" , ")
                of_polysemy_v.write(str(cls_n)+" , "+str(r_n)+" , "+str(cls_v/r_v)+" , ")

                # calcule r values

                r = {}

                for x in range(3,29): 
                    result = subprocess.check_output("tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2==\""+str(x).zfill(2)+"\"{print $4\"-n\",$1}' | sort | uniq | join - ../out/wn30/"+d1+"/"+elem_1+"/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print $1,$2}'", shell=True).split(" ")

                    tmp1,tmp2 = [float(result[0]),float(result[1].strip())]

                    if tmp2 != 0:
                        r["n_"+str(x).zfill(2)] = (tmp2-tmp1)/tmp1
                    else:
                        r["n_"+str(x).zfill(2)] = -1

                for x in range(29,44):

                    cmd = "tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%2' | gawk '$2==\""+str(x)+"\"{print $4\"-v\",$1}' | sort | uniq | join - ../out/wn30/"+d1+"/"+elem_1+"/BLCverb.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}'"

                    r["v_"+str(x)] = float(subprocess.check_output(cmd, shell=True).strip())

                # calcule class values

                cls = {} # create a dictionary to store class values. key is a string composed by "n" or "v" and supersense value.

                for x in range(3,29): 

                    cmd = "cat ../out/wn30/"+d1+"/"+elem_1+"/BLCnoun.list | gawk '$2=\""+str(x).zfill(2)+"\"{print $1}'| wc | gawk '{print $1}'"

                    cls["n_"+str(x).zfill(2)] = float(subprocess.check_output(cmd, shell=True).strip())

                for x in range(29,44): 

                    cls["v_"+str(x)] = float(subprocess.check_output("cat ../out/wn30/"+d1+"/"+elem_1+"/BLCverb.list | gawk '$2=\""+str(x)+"\"{print $1}'| wc | gawk '{print $1}'", shell=True).strip())

                # write to output

                for x in range(3,29):

                    of_polysemy_names["n_"+str(x).zfill(2)].write(str(cls["n_"+str(x).zfill(2)])+" , "+str(r["n_"+str(x).zfill(2)])+" , "+str(cls["n_"+str(x).zfill(2)]/r["n_"+str(x).zfill(2)])+" , ")

                for x in range(29,44): 

                    of_polysemy_names["v_"+str(x)].write(str(cls["v_"+str(x)])+" , "+str(r["v_"+str(x)])+" , "+str(cls["v_"+str(x)]/r["v_"+str(x)])+" , ")

            # end stability and polysemy bodies #####################################################################################################################################

            # start counter calculus #####################################################################################################################################

            if "count" in mode:

                for line in open("../out/wn30/"+d1+"/"+elem_1+"/"+"BLCnoun.list"):

                    cls = elem_1+"_"+str(descendents)
                    syn = line.split()[0]
                    sf = line.split()[1]
                    sf_alt = lex_synsets[syn]

                    # general counter for nouns
                    if syn in list_occ_n["general"]:
                        list_occ_n["general"][syn].append(cls)
                        #list_cnt[syn] += 1
                    else:
                        list_occ_n["general"][syn] = [cls]
                        #list_cnt[syn] = 1

                    # sf counter for nouns
                    if syn+"_"+sf in list_occ_n_sf["general"]:
                        list_occ_n_sf["general"][syn+"_"+sf].append(cls)
                    else:
                        list_occ_n_sf["general"][syn+"_"+sf] = [cls]

                    # alternative sf counter for nouns
                    if syn+"_"+sf_alt in list_occ_n_sf_alt["general"]:
                        list_occ_n_sf_alt["general"][syn+"_"+sf_alt].append(cls)
                    else:
                        list_occ_n_sf_alt["general"][syn+"_"+sf_alt] = [cls]

                    # general counter for nouns, only subclass
                    if syn in list_occ_n[elem_1]:
                        list_occ_n[elem_1][syn].append(cls)
                    else:
                        list_occ_n[elem_1][syn] = [cls]

                    # sf counter for nouns, only subclass
                    if syn+"_"+sf in list_occ_n_sf[elem_1]:
                        list_occ_n_sf[elem_1][syn+"_"+sf].append(cls)
                    else:
                        list_occ_n_sf[elem_1][syn+"_"+sf] = [cls]

                    # alternative sf counter for nouns, only subclass
                    if syn+"_"+sf_alt in list_occ_n_sf_alt[elem_1]:
                        list_occ_n_sf_alt[elem_1][syn+"_"+sf_alt].append(cls)
                    else:
                        list_occ_n_sf_alt[elem_1][syn+"_"+sf_alt] = [cls]


                for line in open("../out/wn30/"+d1+"/"+elem_1+"/"+"BLCverb.list"):

                    cls = elem_1+"_"+str(descendents)
                    syn = line.split()[0]
                    sf = line.split()[1]
                    sf_alt = lex_synsets[syn]

                    # general counter for verbs
                    if syn in list_occ_v["general"]:
                        list_occ_v["general"][syn].append(cls)
                    else:
                        list_occ_v["general"][syn] = [cls]

                    # sf counter for verbs
                    if syn+"_"+sf in list_occ_v_sf["general"]:
                        list_occ_v_sf["general"][syn+"_"+sf].append(cls)
                    else:
                        list_occ_v_sf["general"][syn+"_"+sf] = [cls]

                    # alternative sf counter for verbs
                    if syn+"_"+sf_alt in list_occ_v_sf_alt["general"]:
                        list_occ_v_sf_alt["general"][syn+"_"+sf_alt].append(cls)
                    else:
                        list_occ_v_sf_alt["general"][syn+"_"+sf_alt] = [cls]

                    # general counter for verbs, only subclass
                    if syn in list_occ_v[elem_1]:
                        list_occ_v[elem_1][syn].append(cls)
                    else:
                        list_occ_v[elem_1][syn] = [cls]

                    # sf counter for verbs, only subclass
                    if syn+"_"+sf in list_occ_v_sf[elem_1]:
                        list_occ_v_sf[elem_1][syn+"_"+sf].append(cls)
                    else:
                        list_occ_v_sf[elem_1][syn+"_"+sf] = [cls]

                    # alternative sf counter for verbs, only subclass
                    if syn+"_"+sf_alt in list_occ_v_sf_alt[elem_1]:
                        list_occ_v_sf_alt[elem_1][syn+"_"+sf_alt].append(cls)
                    else:
                        list_occ_v_sf_alt[elem_1][syn+"_"+sf_alt] = [cls]

            # end counter section #####################################################################################################################################

        # final elem_1 for loop #######################################################################################################################################

        if "stability" in mode:

            of_stability_n_list.write("\n")
            of_stability_v_list.write("\n")
            of_stability_n_rel.write("\n")
            of_stability_v_rel.write("\n")

        if "polysemy" in mode:

            of_polysemy_n.write("\n")
            of_polysemy_v.write("\n")
            for x in range(3,29): of_polysemy_names["n_"+str(x).zfill(2)].write("\n")
            for x in range(29,44): of_polysemy_names["v_"+str(x)].write("\n")

    # final d1 for loop ###############################################################################################################################################

    if "stability" in mode:

        of_stability_n_list.close()
        of_stability_v_list.close()
        of_stability_n_rel.close()
        of_stability_v_rel.close()
        subprocess.check_output("rm tmp1.txt", shell=True)
        subprocess.check_output("rm tmp2.txt", shell=True)
        subprocess.check_output("./plot_stability.sh", shell=True)

    if "polysemy" in mode:

        of_polysemy_n.close()
        of_polysemy_v.close()
        for x in range(3,29): of_polysemy_names["n_"+str(x).zfill(2)].close()
        for x in range(29,44): of_polysemy_names["v_"+str(x)].close()
        
        for x in range(3,29): subprocess.check_output("./plot_polysemy_sp.sh n "+str(x).zfill(2), shell=True)
        for x in range(29,44): subprocess.check_output("./plot_polysemy_sp.sh v "+str(x), shell=True)


    # polysemy General, Domains and SUMO, out for loop ####################################################################################################################################

    if "polysemy" in mode:

        ## General
        cmd = "tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $1,$4\"-\"$2}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | perl -ne 's/([0-9]{8}-)//g;print' | gawk -f nawk/descolapsar.nawk | uniq | gawk -f nawk/colapsar.nawk | gawk '{n=n+1;s=s+(NF-1)}END{print n,s,s/n}'"

        result = subprocess.check_output(cmd, shell=True).split()

        n_n,s_n,R_Nouns = [float(result[0]),float(result[1]),float(result[2].strip())]

        cmd = "tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $1,$4"-"$2}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | perl -ne 's/([0-9]{8}-)//g;print' | gawk -f nawk/descolapsar.nawk | uniq | gawk -f nawk/colapsar.nawk | gawk '{n=n+1;s=s+(NF-1)}END{print n,s,s/n}'"

        result = subprocess.check_output(cmd, shell=True).split()

        n_v,s_v,R_Verbs = [float(result[0]),float(result[1]),float(result[2].strip())]


        ## Domains

        cmd = "tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4\"-n\",$1}' | sort | uniq | join - ../dict/wn30/domains_n_des.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}'"

        R_Dom_n = float(subprocess.check_output(cmd, shell=True).strip())

        cmd = "gawk '{print $2}' ../dict/wn30/domains_n_des.rel | sort | uniq | wc | gawk '{print $1}'"
        Cls_Dom_n = float(subprocess.check_output(cmd, shell=True).strip())

        Res_Dom_n = Cls_Dom_n/R_Dom_n


        cmd = "tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $4\"-v\",$1}' | sort | uniq | join - ../dict/wn30/domains_v_des.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}'"

        R_Dom_v = float(subprocess.check_output(cmd, shell=True).strip())

        cmd = "gawk '{print $2}' ../dict/wn30/domains_v_des.rel | sort | uniq | wc | gawk '{print $1}'"
        Cls_Dom_v = float(subprocess.check_output(cmd, shell=True).strip())

        Res_Dom_v = Cls_Dom_v/R_Dom_v


        ## SUMO

        cmd = "tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4\"-n\",$1}' | sort | uniq | join - ../dict/wn30/sumo_n_des.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}'"

        R_Sumo_n = float(subprocess.check_output(cmd, shell=True).strip())

        cmd = "gawk '{print $2}' ../dict/wn30/sumo_n_des.rel | sort | uniq | wc | gawk '{print $1}'"

        Cls_Sumo_n = float(subprocess.check_output(cmd, shell=True).strip())


        Res_Sumo_n = Cls_Sumo_n/R_Sumo_n


        cmd = "tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $4\"-v\",$1}' | sort | uniq | join - ../dict/wn30/sumo_v_des.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}'"

        R_Sumo_v = float(subprocess.check_output(cmd, shell=True).strip())

        cmd = "gawk '{print $2}' ../dict/wn30/sumo_v_des.rel | sort | uniq | wc | gawk '{print $1}'"

        Cls_Sumo_v = float(subprocess.check_output(cmd, shell=True).strip())


        Res_Sumo_v = Cls_Sumo_v/R_Sumo_v

    if "count" in mode:

        #for k,v in list_occ.items():
         #   print k
          #  print len(v)
           # print list_cnt[k]

        list_occ_n_ord = {}
        list_occ_n_sf_ord = {}
        list_occ_n_sf_alt_ord = {}
        list_occ_v_ord = {}
        list_occ_v_sf_ord = {}
        list_occ_v_sf_alt_ord = {}

        list_occ_n_ord["general"] = OrderedDict(sorted(list_occ_n["general"].items(), key=lambda t: len(t[1]), reverse=True))
        list_occ_n_sf_ord["general"] = OrderedDict(sorted(list_occ_n_sf["general"].items(), key=lambda t: len(t[1]), reverse=True))
        list_occ_n_sf_alt_ord["general"] = OrderedDict(sorted(list_occ_n_sf_alt["general"].items(), key=lambda t: len(t[1]), reverse=True))
        list_occ_v_ord["general"] = OrderedDict(sorted(list_occ_v["general"].items(), key=lambda t: len(t[1]), reverse=True))
        list_occ_v_sf_ord["general"] = OrderedDict(sorted(list_occ_v_sf["general"].items(), key=lambda t: len(t[1]), reverse=True))
        list_occ_v_sf_alt_ord["general"] = OrderedDict(sorted(list_occ_v_sf_alt["general"].items(), key=lambda t: len(t[1]), reverse=True))

        of_count_n_cnt = {}
        of_count_v_cnt = {}
        of_count_n_sf_cnt = {}
        of_count_v_sf_cnt = {}
        of_count_n_sf_alt_cnt = {}
        of_count_v_sf_alt_cnt = {}

        of_count_n_cnt["general"] = open('out/counter_n.txt', "w")
        of_count_v_cnt["general"] = open('out/counter_v.txt', "w")
        of_count_n_sf_cnt["general"] = open('out/counter_n_sf.txt', "w")
        of_count_v_sf_cnt["general"] = open('out/counter_v_sf.txt', "w")
        of_count_n_sf_alt_cnt["general"] = open('out/counter_n_sf_alt.txt', "w")
        of_count_v_sf_alt_cnt["general"] = open('out/counter_v_sf_alt.txt', "w")

        of_count_n_gold = open('out/counter_n_gold.txt', "w")
        of_count_v_gold = open('out/counter_v_gold.txt', "w")

        #tmp_len = 0
        #tmp_lst = []

        for k,v in list_occ_n_ord["general"].items(): of_count_n_cnt["general"].write(k+" "+str(len(v))+"\n")
        for k,v in list_occ_v_ord["general"].items(): of_count_v_cnt["general"].write(k+" "+str(len(v))+"\n")

        for k,v in list_occ_n_sf_ord["general"].items(): of_count_n_sf_cnt["general"].write(k+" "+str(len(v))+"\n")
        for k,v in list_occ_v_sf_ord["general"].items(): of_count_v_sf_cnt["general"].write(k+" "+str(len(v))+"\n")

        for k,v in list_occ_n_sf_ord["general"].items(): of_count_n_sf_alt_cnt["general"].write(k+" "+str(len(v))+"\n")
        for k,v in list_occ_v_sf_ord["general"].items(): of_count_v_sf_alt_cnt["general"].write(k+" "+str(len(v))+"\n")

        for k,v in list_occ_n_ord.items(): 
            if len(v) > 100: 
                of_count_n_gold.write(k+"\n")
        for k,v in list_occ_v_ord.items(): 
            if len(v) > 100: 
                of_count_v_gold.write(k+"\n")

        for elem_1 in list_d:

            list_occ_n_ord[elem_1] = OrderedDict(sorted(list_occ_n[elem_1].items(), key=lambda t: len(t[1]), reverse=True))
            list_occ_n_sf_ord[elem_1] = OrderedDict(sorted(list_occ_n_sf[elem_1].items(), key=lambda t: len(t[1]), reverse=True))
            list_occ_n_sf_alt_ord[elem_1] = OrderedDict(sorted(list_occ_n_sf_alt[elem_1].items(), key=lambda t: len(t[1]), reverse=True))
            list_occ_v_ord[elem_1] = OrderedDict(sorted(list_occ_v[elem_1].items(), key=lambda t: len(t[1]), reverse=True))
            list_occ_v_sf_ord[elem_1] = OrderedDict(sorted(list_occ_v_sf[elem_1].items(), key=lambda t: len(t[1]), reverse=True))
            list_occ_v_sf_alt_ord[elem_1] = OrderedDict(sorted(list_occ_v_sf_alt[elem_1].items(), key=lambda t: len(t[1]), reverse=True))

            of_count_n_cnt[elem_1] = open('out/counter_n_'+elem_1+'.txt', "w")
            of_count_v_cnt[elem_1] = open('out/counter_v_'+elem_1+'.txt', "w")
            of_count_n_sf_cnt[elem_1] = open('out/counter_n_sf_'+elem_1+'.txt', "w")
            of_count_v_sf_cnt[elem_1] = open('out/counter_v_sf_'+elem_1+'.txt', "w")
            of_count_n_sf_alt_cnt[elem_1] = open('out/counter_n_sf_alt_'+elem_1+'.txt', "w")
            of_count_v_sf_alt_cnt[elem_1] = open('out/counter_v_sf_alt_'+elem_1+'.txt', "w")

            for k,v in list_occ_n_ord[elem_1].items(): of_count_n_cnt[elem_1].write(k+" "+str(len(v))+"\n")
            for k,v in list_occ_v_ord[elem_1].items(): of_count_v_cnt[elem_1].write(k+" "+str(len(v))+"\n")

            for k,v in list_occ_n_sf_ord[elem_1].items(): of_count_n_sf_cnt[elem_1].write(k+" "+str(len(v))+"\n")
            for k,v in list_occ_v_sf_ord[elem_1].items(): of_count_v_sf_cnt[elem_1].write(k+" "+str(len(v))+"\n")

            for k,v in list_occ_n_sf_alt_ord[elem_1].items(): of_count_n_sf_alt_cnt[elem_1].write(k+" "+str(len(v))+"\n")
            for k,v in list_occ_v_sf_alt_ord[elem_1].items(): of_count_v_sf_alt_cnt[elem_1].write(k+" "+str(len(v))+"\n")

        visit = []

        for append in ["","_sf","_sf_alt"]:

            for elem_1 in list_d:
                for elem_2 in list_d:
                    if elem_1 != elem_2 and elem_1 not in visit and elem_2 not in visit: 

                        # comm -12 <(gawk '$2/17>0.8' out/counter_n_sf.txt | sort | gawk '{print $1}') <(gawk '$2/17>0.8' out/counter_n_sf_all+gloss.txt | sort | gawk '{print $1}') | wc | gawk '{print $1}'

                        subprocess.check_output("gawk '$2/17>0.8' out/counter_n"+append+"_"+elem_1+".txt | sort | gawk '{print $1}' > tmp1.txt", shell=True)
                        subprocess.check_output("gawk '$2/17>0.8' out/counter_n"+append+"_"+elem_2+".txt | sort | gawk '{print $1}' > tmp2.txt", shell=True)
                        eq_n_list = subprocess.check_output("comm -12 tmp1.txt tmp2.txt | wc | gawk '{print $1}'", shell=True).strip()


                        wc_1_n = subprocess.check_output("wc tmp1.txt | gawk '{print $1}'", shell=True).strip()
                        wc_2_n = subprocess.check_output("wc tmp2.txt | gawk '{print $1}'", shell=True).strip()

                        print(" wc 1 n "+elem_1+append+" : "+str(int(wc_1_n)))
                        print(" wc 2 n "+elem_2+append+" : "+str(int(wc_2_n)))
                        print(elem_1+append+" vs "+elem_2+append+" : "+str(int(eq_n_list)))

                        subprocess.check_output("gawk '$2/17>0.8' out/counter_v"+append+"_"+elem_1+".txt | sort | gawk '{print $1}' > tmp3.txt", shell=True)
                        subprocess.check_output("gawk '$2/17>0.8' out/counter_v"+append+"_"+elem_2+".txt | sort | gawk '{print $1}' > tmp4.txt", shell=True)
                        eq_v_list = subprocess.check_output("comm -12 tmp3.txt tmp4.txt | wc | gawk '{print $1}'", shell=True).strip()

                        wc_1_v = subprocess.check_output("wc tmp3.txt | gawk '{print $1}'", shell=True).strip()
                        wc_2_v = subprocess.check_output("wc tmp4.txt | gawk '{print $1}'", shell=True).strip()

                        print(" wc 1 v "+elem_1+append+" : "+str(int(wc_1_v)))
                        print(" wc 2 v "+elem_2+append+" : "+str(int(wc_2_v)))
                        print(elem_1+append+" vs "+elem_2+append+" : "+str(int(eq_v_list))+"\n")

                subprocess.check_output("gawk '$2/119>0.8' out/counter_n"+append+".txt | sort | gawk '{print $1}' > tmp2.txt", shell=True)
                eq_n_list = subprocess.check_output("comm -12 tmp1.txt tmp2.txt | wc | gawk '{print $1}'", shell=True).strip()

                wc_2_n = subprocess.check_output("wc tmp2.txt | gawk '{print $1}'", shell=True).strip()

                print(" wc 1 n "+elem_1+append+" : "+str(int(wc_1_n)))
                print(" wc 2 n general"+append+" : "+str(int(wc_2_n)))

                print(elem_1+append+" vs general"+append+" : "+str(int(eq_n_list)))

                subprocess.check_output("gawk '$2/119>0.8' out/counter_v"+append+".txt | sort | gawk '{print $1}' > tmp4.txt", shell=True)
                eq_v_list = subprocess.check_output("comm -12 tmp3.txt tmp4.txt | wc | gawk '{print $1}'", shell=True).strip()

                wc_2_v = subprocess.check_output("wc tmp4.txt | gawk '{print $1}'", shell=True).strip()

                print(" wc 1 v "+elem_1+append+" : "+str(int(wc_1_v)))
                print(" wc 2 v general"+append+": "+str(int(wc_2_v)))

                print(elem_1+append+" vs general"+append+" : "+str(int(eq_v_list))+"\n\n")

                if elem_1 not in visit: visit.append(elem_1)

        subprocess.check_output("rm tmp1.txt", shell=True)
        subprocess.check_output("rm tmp2.txt", shell=True)
        subprocess.check_output("rm tmp3.txt", shell=True)
        subprocess.check_output("rm tmp4.txt", shell=True)



options = list_d
combs = []

for i in range(1, len(options)+1):
    els = [" vs ".join(list(x)) for x in itertools.combinations(options, i)]
    combs.extend(els)

print(combs)


            #if tmp_len != len(v):

            #    tmp_lst_ord = OrderedDict(sorted(tmp_lst))
             #   of_count_n_cnt_2.write(k)
              #  for a in tmp_lst_ord.items():
               #     of_count_n_cnt_2.write(a+tmp_len+"\n")                

             #   tmp_lst = [k,len(v)]
              #  tmp_len = len(v)
            #else:
               # tmp_lst.append([k,len(v)])

            #print tmp_lst

            #print list_occ_ord

