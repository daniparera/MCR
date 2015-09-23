#!/usr/bin/python

# deprecated version, with threshold variation loop no assigned domain synsets exists

import re
import textwrap, argparse

parserarg = argparse.ArgumentParser(
     prog='findNoDomain',
     formatter_class=argparse.RawDescriptionHelpFormatter,
     description=textwrap.dedent('''\
         find synsets without assigned domain in ponderated result file
         --------------------------------
             example of use $python3 %(prog)s --file res.txt [[--debug]]
         '''))

parserarg.add_argument('--debug', action='store_false', default='TRUE', help='to show aditional information')
parserarg.add_argument('--file', dest='input_file', required=True, default='', type=str , help='input synsets data file (required)')

args = parserarg.parse_args()

debug = not(bool(args.debug))

infile = open(args.input_file, 'r')

text = ''.join(infile.read().splitlines())

try:
    found = re.findall('(\#+)(.+?)(\#+)', text)
except AttributeError:
    # ###, ### not found in the original string
    found = '' # apply your error handling

total = 0
notin = 0
nouns = 0
adjectives = 0
verbs = 0
adverbs = 0

for f in found:
    #print f[1]
    if not "Domain" in f[1] and not "#" in f[1]:
        print f[1].split(" ")[1]
        if f[1].split(" ")[1].split("-")[1]=="a":
            adjectives = adjectives + 1
        if f[1].split(" ")[1].split("-")[1]=="v":
            verbs = verbs + 1
        if f[1].split(" ")[1].split("-")[1]=="r":
            adverbs = adverbs + 1
        if f[1].split(" ")[1].split("-")[1]=="n":
            nouns = nouns + 1
        notin = notin + 1
    total = total + 1

#print "TOT : "+str(total)
print "NOT_D : "+str(notin)
print "ADJ : "+str(adjectives)
print "VRB : "+str(verbs)
print "NON : "+str(nouns)
print "ADV : "+str(adverbs)
