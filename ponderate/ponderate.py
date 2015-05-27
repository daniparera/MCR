#!/usr/bin/python

# to create file xwndg.txt
# nawk 'BEGIN{FS="|"}{print $1 ".ppv"}' wei_ili_to_domains.csv | sort | uniq -c | nawk '{print $2,$1}' > xwndg.txt

# This creates the synsets list
# nawk 'BEGIN{FS=" "}{print $1}' xwnd-30g/biology.ppv | sort > synsets.txt

import os, subprocess
import textwrap, argparse

parserarg = argparse.ArgumentParser(
     prog='dbRepRel',
     formatter_class=argparse.RawDescriptionHelpFormatter,
     description=textwrap.dedent('''\
         calculate ponderated vectors
         --------------------------------
             example of use $python3 %(prog)s --file synsets.txt [[--debug]]
         '''))

parserarg.add_argument('--debug', action='store_false', default='TRUE', help='to show aditional information')
parserarg.add_argument('--file', dest='input_file', required=True, default='', type=str , help='input synsets data file (required)')

args = parserarg.parse_args()

debug = not(bool(args.debug))

infile = open(args.input_file, 'r')

for lin in infile.read().splitlines():

	########### Get information about Synset ############################################

	cmd = "fgrep "+lin+" wei_eng-30_variant.tsv | nawk '{print $1$2}'"
	if debug: sys.stderr.write("\tCMD: "+cmd+"\n")

	tmp = subprocess.check_output(cmd, shell=True)
	var = ''

	for aux in tmp.splitlines():
		var = var + aux + "/"

	print "Synset: "+lin+" -> "+var
		
	########### Get accumulated weight ############################################

	cmd = "fgrep "+lin+" xwnd-30g/*.ppv | nawk '{s=s+$2}END{print s}'"
	if debug: sys.stderr.write("\tCMD: "+cmd+"\n")

	aw = subprocess.check_output(cmd, shell=True)
	aw = aw.strip()
	print "\tAW: "+aw+"\n"

	########### Calculate Entropy ############################################

	cmd = "fgrep "+lin+" xwnd-30g/*.ppv | nawk '{s=s+$2/"+str(aw)+"*log($2/"+str(aw)+")}END{print -s}'"
	if debug: sys.stderr.write("\tCMD: "+cmd+"\n")

	entropy = subprocess.check_output(cmd, shell=True)
	entropy = entropy.strip()

	print "\tEntropy: "+str(entropy)+"\n"

	########### Calculate Entropy ############################################

	cmd = "fgrep "+lin+" xwnd-30g/*.ppv | nawk '{n=$2*1/"+str(entropy)+"; print $1,$2,n}' | nawk '{s2=s2+$2;s3=s3+$3}END{print s2,s3}'"
	if debug: sys.stderr.write("\tCMD: "+cmd+"\n")

	result = subprocess.check_output(cmd, shell=True)

	w, wn = result.split(" ")
	wn = wn.strip()

	if debug: sys.stderr.write("\tAcumulated Weight: "+str(w))
	if debug: sys.stderr.write("\tNormalized Acumulated weight: "+str(wn)+"\n")

	threshold = 0.1

	cmd = "fgrep "+lin+" xwnd-30g/*.ppv | nawk '{n=$2*1/"+str(entropy)+"; print $1,$2,n}' | sed 's/.*\///' | tr ':' ' ' | sort | join - xwndg.txt | sort -k 4gr | nawk '($4/"+str(wn)+")>"+str(threshold)+"{print $1, $2, $3, $4, $5, $4*log($5)}' | sort -k 6gr"
	if debug: sys.stderr.write("\tCMD: "+cmd+"\n")

	result = subprocess.check_output(cmd, shell=True)

	while result == "":
		threshold = threshold / 2

		cmd = "fgrep "+lin+" xwnd-30g/*.ppv | nawk '{n=$2*1/"+str(entropy)+"; print $1,$2,n}' | sed 's/.*\///' | tr ':' ' ' | sort | join - xwndg.txt | sort -k 4gr | nawk '($4/"+str(wn)+")>"+str(threshold)+"{print $1, $2, $3, $4, $5, $4*log($5)}' | sort -k 6gr"

		result = subprocess.check_output(cmd, shell=True)

	print "\tThreshold: "+str(threshold)

	for res_lin in result.splitlines():

		dom, syn, aw, dw, sup, val = res_lin.split(" ")

		print "\tDomain: "+dom
		print "\tSynset: "+syn
		print "\tAcumulated Weight: "+str(aw)
		print "\tDomain Weight: "+str(dw)
		print "\tSupport: "+str(sup)
		print "\tValue: "+str(val)+"\n"

	print "#############################"

infile.close()
