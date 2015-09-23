#!/usr/bin/python

# to create file xwndg.txt
# nawk 'BEGIN{FS="|"}{print $1 ".ppv"}' data/wei_ili_to_domains.csv | sort | uniq -c | nawk '{print $2,$1}' > data/xwndg.txt

import os, sys, subprocess
import textwrap, argparse

parserarg = argparse.ArgumentParser(
     prog='ponderateSynset',
     formatter_class=argparse.RawDescriptionHelpFormatter,
     description=textwrap.dedent('''\
         calculate ponderated vectors for specific synset
         --------------------------------
             example of use $python3 %(prog)s --synset synset [[--debug]]
         '''))

parserarg.add_argument('--debug', action='store_false', default='TRUE', help='to show aditional information')
parserarg.add_argument('--synset', dest='synset', required=True, default='', type=str , help='input synsets (required)')

args = parserarg.parse_args()

debug = not(bool(args.debug))

syn = args.synset

if not os.path.exists('data/xwnd-30g'):
	print "Download and descompres xwnd-30g file in data directory" 
	exit()

########### Get information about Synset ############################################

cmd = "fgrep "+syn+" data/wei_eng-30_variant.tsv | nawk '{print $1,$2}'"
if debug: sys.stderr.write("\tCMD: "+cmd+"\n")

tmp = subprocess.check_output(cmd, shell=True)
variants = ''

for variant in tmp.splitlines()[:-1]:

	aux = variant.split()
	variants = variants + aux[0] + "_" + aux[1] + "/"

variant = tmp.splitlines()[-1]
aux = variant.split()

variants = variants + aux[0] + "_" + aux[1]

if debug: sys.stderr.write("Synset: "+syn+" -> "+variants)
	
########### Get accumulated weight ############################################

cmd = "fgrep "+syn+" data/xwnd-30g/*.ppv | nawk '{s=s+$2}END{print s}'"
if debug: sys.stderr.write("\tCMD: "+cmd+"\n")

aw = subprocess.check_output(cmd, shell=True)
aw = aw.strip()
if debug: sys.stderr.write("\tAW: "+aw+"\n")

########### Calculate Entropy ############################################

cmd = "fgrep "+syn+" data/xwnd-30g/*.ppv | nawk '{s=s+$2/"+str(aw)+"*log($2/"+str(aw)+")}END{print -s}'"
if debug: sys.stderr.write("\tCMD: "+cmd+"\n")

entropy = subprocess.check_output(cmd, shell=True)
entropy = entropy.strip()

if debug: sys.stderr.write("\tEntropy: "+str(entropy)+"\n")

########### Calculate Entropy ############################################

cmd = "fgrep "+syn+" data/xwnd-30g/*.ppv | nawk '{n=$2*1/"+str(entropy)+"; print $1,$2,n}' | nawk '{s2=s2+$2;s3=s3+$3}END{print s2,s3}'"
if debug: sys.stderr.write("\tCMD: "+cmd+"\n")

result = subprocess.check_output(cmd, shell=True)

w, wn = result.split(" ")
wn = wn.strip()

if debug: sys.stderr.write("\tAcumulated Weight: "+str(w)+"\n\tNormalized Acumulated weight: "+str(wn)+"\n")

threshold = 0.1

cmd = "fgrep "+syn+" data/xwnd-30g/*.ppv | nawk '{n=$2*1/"+str(entropy)+"; print $1,$2,n}' | sed 's/.*\///' | tr ':' ' ' | sort | join - data/xwndg.txt | sort -k 4gr | nawk '($4/"+str(wn)+")>"+str(threshold)+"{print $1, $2, $3, $4, $5, $4*log($5)}' | sort -k 6gr"
if debug: sys.stderr.write("\tCMD: "+cmd+"\n")

result = subprocess.check_output(cmd, shell=True)

while result == "":
	threshold = threshold / 2

	cmd = "fgrep "+syn+" data/xwnd-30g/*.ppv | nawk '{n=$2*1/"+str(entropy)+"; print $1,$2,n}' | sed 's/.*\///' | tr ':' ' ' | sort | join - data/xwndg.txt | sort -k 4gr | nawk '($4/"+str(wn)+")>"+str(threshold)+"{print $1, $2, $3, $4, $5, $4*log($5)}' | sort -k 6gr"

	result = subprocess.check_output(cmd, shell=True)

if debug: sys.stderr.write("\tThreshold: "+str(threshold)+"\n\n")

acc_dom = ''

for res_lin in result.splitlines()[:-1]:

	dom, synset, aw, dw, sup, val = res_lin.split(" ")

	if debug: sys.stderr.write("\tDomain: "+dom+"\n")
	if debug: sys.stderr.write("\tSynset: "+synset+"\n")
	if debug: sys.stderr.write("\tAcumulated Weight: "+str(aw)+"\n")
	if debug: sys.stderr.write("\tDomain Weight: "+str(dw)+"\n")
	if debug: sys.stderr.write("\tSupport: "+str(sup)+"\n")
	if debug: sys.stderr.write("\tValue: "+str(val)+"\n\n")
	acc_dom = acc_dom + dom.split('.')[0]+"#"

dom, synset, aw, dw, sup, val = result.splitlines()[-1].split(" ")

if debug: sys.stderr.write("\tDomain: "+dom+"\n")
if debug: sys.stderr.write("\tSynset: "+synset+"\n")
if debug: sys.stderr.write("\tAcumulated Weight: "+str(aw)+"\n")
if debug: sys.stderr.write("\tDomain Weight: "+str(dw)+"\n")
if debug: sys.stderr.write("\tSupport: "+str(sup)+"\n")
if debug: sys.stderr.write("\tValue: "+str(val)+"\n\n")

acc_dom = acc_dom + dom.split('.')[0]

print(acc_dom)
