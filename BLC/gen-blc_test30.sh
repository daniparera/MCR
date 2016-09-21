#!/bin/bash

python calc_sons_wordnet.py --file dict/wn30/data.noun --outfile dict/wn30/sons_n.txt
python calc_sons_wordnet.py --file dict/wn30/data.verb --outfile dict/wn30/sons_v.txt


# Diferent minimum frequencies, WordNet 3.0, all-weights
python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin0/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 0 --weight all
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin0/all/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 0 --weight all

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin5/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 5 --weight all
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin5/all/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 5 --weight all

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin10/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 10 --weight all
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin10/all/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 10 --weight all

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin15/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 15 --weight all
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin15/all/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 15 --weight all

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin20/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 20 --weight all
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin20/all/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 20 --weight all

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin25/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 25 --weight all
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin25/all/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 25 --weight all

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin30/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 30 --weight all
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin30/all/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 30 --weight all

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin35/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 35 --weight all
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin35/all/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 35 --weight all

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin40/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 40 --weight all
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin40/all/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 40 --weight all

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin45/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 45 --weight all
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin45/all/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 45 --weight all

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin50/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 50 --weight all
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin50/all/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 50 --weight all

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin55/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 55 --weight all
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin55/all/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 55 --weight all

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin60/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 60 --weight all
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin60/all/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 60 --weight all

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin65/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 65 --weight all
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin65/all/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 65 --weight all

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin70/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 70 --weight all
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin70/all/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 70 --weight all

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin75/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 75 --weight all
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin75/all/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 75 --weight all

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin80/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 80 --weight all
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin80/all/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 80 --weight all

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin85/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 85 --weight all
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin85/all/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 85 --weight all

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin90/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 90 --weight all
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin90/all/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 90 --weight all

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin95/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 95 --weight all
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin95/all/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 95 --weight all

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin100/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 100 --weight all
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin100/all/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 100 --weight all


# Diferent minimum frequencies, WordNet 3.0, gloss-weights
python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin0/gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 0 --weight gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin0/gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 0 --weight gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin5/gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 5 --weight gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin5/gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 5 --weight gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin10/gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 10 --weight gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin10/gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 10 --weight gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin15/gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 15 --weight gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin15/gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 15 --weight gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin20/gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 20 --weight gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin20/gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 20 --weight gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin25/gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 25 --weight gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin25/gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 25 --weight gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin30/gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 30 --weight gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin30/gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 30 --weight gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin35/gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 35 --weight gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin35/gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 35 --weight gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin40/gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 40 --weight gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin40/gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 40 --weight gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin45/gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 45 --weight gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin45/gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 45 --weight gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin50/gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 50 --weight gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin50/gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 50 --weight gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin55/gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 55 --weight gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin55/gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 55 --weight gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin60/gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 60 --weight gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin60/gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 60 --weight gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin65/gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 65 --weight gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin65/gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 65 --weight gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin70/gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 70 --weight gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin70/gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 70 --weight gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin75/gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 75 --weight gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin75/gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 75 --weight gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin80/gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 80 --weight gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin80/gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 80 --weight gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin85/gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 85 --weight gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin85/gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 85 --weight gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin90/gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 90 --weight gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin90/gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 90 --weight gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin95/gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 95 --weight gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin95/gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 95 --weight gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin100/gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 100 --weight gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin100/gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 100 --weight gloss --glossfile dict/wn30/gloss.rel


# Diferent minimum frequencies, WordNet 3.0, all-weights+gloss
python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin0/all+gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 0 --weight all+gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin0/all+gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 0 --weight all+gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin5/all+gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 5 --weight all+gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin5/all+gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 5 --weight all+gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin10/all+gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 10 --weight all+gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin10/all+gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 10 --weight all+gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin15/all+gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 15 --weight all+gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin15/all+gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 15 --weight all+gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin20/all+gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 20 --weight all+gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin20/all+gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 20 --weight all+gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin25/all+gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 25 --weight all+gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin25/all+gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 25 --weight all+gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin30/all+gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 30 --weight all+gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin30/all+gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 30 --weight all+gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin35/all+gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 35 --weight all+gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin35/all+gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 35 --weight all+gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin40/all+gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 40 --weight all+gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin40/all+gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 40 --weight all+gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin45/all+gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 45 --weight all+gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin45/all+gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 45 --weight all+gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin50/all+gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 50 --weight all+gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin50/all+gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 50 --weight all+gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin55/all+gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 55 --weight all+gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin55/all+gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 55 --weight all+gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin60/all+gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 60 --weight all+gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin60/all+gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 60 --weight all+gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin65/all+gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 65 --weight all+gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin65/all+gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 65 --weight all+gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin70/all+gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 70 --weight all+gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin70/all+gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 70 --weight all+gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin75/all+gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 75 --weight all+gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin75/all+gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 75 --weight all+gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin80/all+gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 80 --weight all+gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin80/all+gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 80 --weight all+gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin85/all+gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 85 --weight all+gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin85/all+gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 85 --weight all+gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin90/all+gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 90 --weight all+gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin90/all+gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 90 --weight all+gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin95/all+gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 95 --weight all+gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin95/all+gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 95 --weight all+gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin100/all+gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 100 --weight all+gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin100/all+gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 100 --weight all+gloss --glossfile dict/wn30/gloss.rel


# Diferent minimum frequencies, WordNet 3.0, frequency
python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin0/freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 0 --weight freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin0/freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 0 --weight freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin5/freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 5 --weight freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin5/freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 5 --weight freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin10/freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 10 --weight freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin10/freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 10 --weight freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin15/freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 15 --weight freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin15/freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 15 --weight freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin20/freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 20 --weight freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin20/freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 20 --weight freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin25/freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 25 --weight freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin25/freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 25 --weight freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin30/freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 30 --weight freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin30/freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 30 --weight freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin35/freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 35 --weight freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin35/freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 35 --weight freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin40/freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 40 --weight freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin40/freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 40 --weight freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin45/freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 45 --weight freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin45/freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 45 --weight freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin50/freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 50 --weight freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin50/freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 50 --weight freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin55/freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 55 --weight freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin55/freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 55 --weight freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin60/freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 60 --weight freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin60/freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 60 --weight freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin65/freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 65 --weight freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin65/freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 65 --weight freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin70/freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 70 --weight freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin70/freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 70 --weight freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin75/freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 75 --weight freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin75/freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 75 --weight freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin80/freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 80 --weight freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin80/freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 80 --weight freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin85/freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 85 --weight freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin85/freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 85 --weight freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin90/freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 90 --weight freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin90/freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 90 --weight freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin95/freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 95 --weight freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin95/freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 95 --weight freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin100/freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 100 --weight freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin100/freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 100 --weight freq --sensefile dict/wn30/index.sense


# Diferent minimum frequencies, WordNet 3.0, all-weights+frequency
python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin0/all+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 0 --weight all+freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin0/all+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 0 --weight all+freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin5/all+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 5 --weight all+freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin5/all+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 5 --weight all+freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin10/all+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 10 --weight all+freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin10/all+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 10 --weight all+freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin15/all+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 15 --weight all+freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin15/all+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 15 --weight all+freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin20/all+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 20 --weight all+freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin20/all+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 20 --weight all+freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin25/all+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 25 --weight all+freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin25/all+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 25 --weight all+freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin30/all+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 30 --weight all+freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin30/all+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 30 --weight all+freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin35/all+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 35 --weight all+freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin35/all+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 35 --weight all+freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin40/all+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 40 --weight all+freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin40/all+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 40 --weight all+freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin45/all+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 45 --weight all+freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin45/all+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 45 --weight all+freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin50/all+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 50 --weight all+freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin50/all+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 50 --weight all+freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin55/all+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 55 --weight all+freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin55/all+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 55 --weight all+freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin60/all+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 60 --weight all+freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin60/all+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 60 --weight all+freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin65/all+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 65 --weight all+freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin65/all+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 65 --weight all+freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin70/all+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 70 --weight all+freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin70/all+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 70 --weight all+freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin75/all+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 75 --weight all+freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin75/all+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 75 --weight all+freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin80/all+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 80 --weight all+freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin80/all+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 80 --weight all+freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin85/all+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 85 --weight all+freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin85/all+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 85 --weight all+freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin90/all+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 90 --weight all+freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin90/all+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 90 --weight all+freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin95/all+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 95 --weight all+freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin95/all+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 95 --weight all+freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin100/all+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 100 --weight all+freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin100/all+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 100 --weight all+freq --sensefile dict/wn30/index.sense


# Diferent minimum frequencies, WordNet 3.0, gloss+frequency
python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin0/gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 0 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin0/gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 0 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin5/gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 5 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin5/gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 5 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin10/gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 10 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin10/gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 10 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin15/gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 15 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin15/gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 15 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin20/gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 20 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin20/gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 20 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin25/gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 25 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin25/gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 25 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin30/gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 30 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin30/gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 30 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin35/gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 35 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin35/gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 35 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin40/gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 40 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin40/gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 40 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin45/gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 45 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin45/gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 45 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin50/gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 50 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin50/gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 50 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin55/gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 55 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin55/gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 55 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin60/gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 60 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin60/gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 60 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin65/gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 65 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin65/gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 65 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin70/gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 70 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin70/gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 70 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin75/gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 75 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin75/gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 75 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin80/gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 80 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin80/gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 80 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin85/gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 85 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin85/gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 85 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin90/gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 90 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin90/gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 90 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin95/gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 95 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin95/gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 95 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin100/gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 100 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin100/gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 100 --weight gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel


# Diferent minimum frequencies, WordNet 3.0, all-weights+gloss+frequency
python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin0/all+gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 0 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin0/all+gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 0 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin5/all+gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 5 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin5/all+gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 5 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin10/all+gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 10 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin10/all+gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 10 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin15/all+gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 15 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin15/all+gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 15 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin20/all+gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 20 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin20/all+gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 20 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin25/all+gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 25 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin25/all+gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 25 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin30/all+gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 30 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin30/all+gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 30 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin35/all+gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 35 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin35/all+gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 35 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin40/all+gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 40 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin40/all+gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 40 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin45/all+gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 45 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin45/all+gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 45 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin50/all+gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 50 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin50/all+gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 50 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin55/all+gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 55 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin55/all+gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 55 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin60/all+gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 60 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin60/all+gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 60 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin65/all+gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 65 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin65/all+gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 65 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin70/all+gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 70 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin70/all+gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 70 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin75/all+gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 75 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin75/all+gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 75 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin80/all+gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 80 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin80/all+gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 80 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin85/all+gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 85 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin85/all+gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 85 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin90/all+gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 90 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin90/all+gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 90 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin95/all+gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 95 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin95/all+gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 95 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin100/all+gloss+freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 100 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin100/all+gloss+freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 100 --weight all+gloss+freq --sensefile dict/wn30/index.sense --glossfile dict/wn30/gloss.rel


