#!/usr/bin/python

import os, subprocess
import textwrap, argparse
import itertools
from collections import OrderedDict

if __name__ == '__main__':

    argument_parser = argparse.ArgumentParser(
         prog='mapps_blcs.py',
         formatter_class=argparse.RawDescriptionHelpFormatter,
         description=textwrap.dedent('''\
         blcs mapping.... map some synsets from one version of WN to another... maps are from http://nlp.lsi.upc.edu/tools/download-map.php
         --------------------------------
             example of use $python3 %(prog)s
         '''))

    argument_parser.add_argument('--selected', dest='selected', action='append', required=True, choices=['15','16','17','171','20','21','30'], type=str , help='selected mapp (required, without extension), it can be more than one')
    argument_parser.add_argument('--blcsfile', dest='blcsfile', required=True, type=str , help='blcs file (required)')

    argument_parser.add_argument('--filter_pos', dest='filter_pos', required=False, type=str, action='append', choices=['n','v','r','a'], help='filter pos (optional)')

    argument_parser.add_argument('--show_correspondences', dest='show_correspondences', action='store_true', help='Show complet correspondence. Format: "old_synset":"new_synset" or "no_correspondence"')
    argument_parser.add_argument('--no_matches', dest='no_matches', action='store_true', help='Show also no matches in correspondence mode.')

    args = argument_parser.parse_args()

    if args.filter_pos is None:
        args.filter_pos=['n','v','r','a']

    # create output dir if not exists
    if not os.path.exists('out'):
        os.makedirs('out')

    # STARTS create mapping dir if not exists ################################################
    if not os.path.exists('mappings-upc-2007'):
        os.makedirs('mappings-upc-2007')

        import urllib2
        import StringIO
        import tarfile
        import gzip

        outFilePath = "/tmp/mapps.tmp.tar"

        response = urllib2.urlopen("http://nlp.lsi.upc.edu/tools/download-map.php")
        compressedFile = StringIO.StringIO(response.read())
        decompressedFile = gzip.GzipFile(fileobj=compressedFile)

        with open(outFilePath, 'w') as outfile:
            outfile.write(decompressedFile.read())

        tar = tarfile.open(outFilePath, "r:")
        tar.extractall()
        tar.close()

    # END create mapping dir if not exists ###################################################

    if len(args.selected) != 2:
        print("The program need select TWO mapps.\n")
        exit()
    if args.selected[0] == args.selected[1]:
        print("The program need DIFFERENT mapps.\n")
        exit()

    # read files ####################################################################################################################################################

    mapps = {}
    mapps[args.selected[0]] = {}
    mapps[args.selected[1]] = {}

    for pos in [['noun','n'],['verb','v'],['adv','r'],['adj','a']]:

        sfile = open("mappings-upc-2007/mapping-"+args.selected[0]+"-"+args.selected[1]+"/wn"+args.selected[0]+"-"+args.selected[1]+"."+pos[0],'r')
        content_file = sfile.readlines()

        for line in content_file:

            fields = line.split()

            mapps[args.selected[0]][fields[0]+"-"+pos[1]] = []

            i = 1
            while i < len(fields[1:]):
                mapps[args.selected[0]][fields[0]+"-"+pos[1]].append([fields[i]+"-"+pos[1],fields[i+1]])
                i += 2

    for pos in [['noun','n'],['verb','v'],['adv','r'],['adj','a']]:

        sfile = open("mappings-upc-2007/mapping-"+args.selected[1]+"-"+args.selected[0]+"/wn"+args.selected[1]+"-"+args.selected[0]+"."+pos[0],'r')
        content_file = sfile.readlines()

        for line in content_file:

            fields = line.split()

            mapps[args.selected[1]][fields[0]+"-"+pos[1]] = []

            i = 1
            while i < len(fields[1:]):
                mapps[args.selected[1]][fields[0]+"-"+pos[1]].append([fields[i]+"-"+pos[1],fields[i+1]])
                i += 2

    # check coincidences between mappings ###########################################################################################################################

    coincidences = {}

    for key_map_0,list_map_0 in mapps[args.selected[0]].items():

        for elem_map_0 in list_map_0:

            for elem_map_1 in mapps[args.selected[1]][elem_map_0[0]]:

                if key_map_0 == elem_map_1[0]:

                    coincidences[key_map_0] = elem_map_0[0]

    # output to file ################################################################################################################################################

    sfile = open(args.blcsfile,'r')
    content_file = sfile.readlines()

    for line in content_file:

        if line.strip().split("-")[1] in args.filter_pos:

            if args.show_correspondences:
                try:
                    print(line.strip()+":"+coincidences[line.strip()])
                except KeyError:
                    if args.no_matches:
                        print(line.strip()+":NO_CORRESPONDENCE")
            else:
                try:
                    print(coincidences[line.strip()])
                except KeyError:
                    no_var = 0

    if args.no_matches and args.show_correspondences:
        print("length coincidences: "+str(len(coincidences)))
