#!/bin/bash

# For each version: WN3.0, WN3.1, WN2.1, WN2.0, WN1.7.1, WN1.6, WN1.5 ... 
# BLC0, BLC5, BLC10, BLC20 and BLC50
# all-weights, all-weights+gloss-weights (WN3.0) and frequency (addition for each variant in index.sense file)


echo Calculate Sons
python calc_sons_wordnet.py --file dict/wn31/data.noun --outfile dict/wn31/sons_n.txt
python calc_sons_wordnet.py --file dict/wn31/data.verb --outfile dict/wn31/sons_v.txt
python calc_sons_wordnet.py --file dict/wn30/data.noun --outfile dict/wn30/sons_n.txt
python calc_sons_wordnet.py --file dict/wn30/data.verb --outfile dict/wn30/sons_v.txt
python calc_sons_wordnet.py --file dict/wn21/data.noun --outfile dict/wn21/sons_n.txt
python calc_sons_wordnet.py --file dict/wn21/data.verb --outfile dict/wn21/sons_v.txt
python calc_sons_wordnet.py --file dict/wn20/data.noun --outfile dict/wn20/sons_n.txt
python calc_sons_wordnet.py --file dict/wn20/data.verb --outfile dict/wn20/sons_v.txt
python calc_sons_wordnet.py --file dict/wn171/data.noun --outfile dict/wn171/sons_n.txt
python calc_sons_wordnet.py --file dict/wn171/data.verb --outfile dict/wn171/sons_v.txt
python calc_sons_wordnet.py --file dict/wn17/data.noun --outfile dict/wn17/sons_n.txt
python calc_sons_wordnet.py --file dict/wn17/data.verb --outfile dict/wn17/sons_v.txt
python calc_sons_wordnet.py --file dict/wn16/data.noun --outfile dict/wn16/sons_n.txt
python calc_sons_wordnet.py --file dict/wn16/data.verb --outfile dict/wn16/sons_v.txt
python calc_sons_wordnet.py --file dict/wn15/NOUN.DAT --outfile dict/wn15/sons_n.txt
python calc_sons_wordnet.py --file dict/wn15/VERB.DAT --outfile dict/wn15/sons_v.txt

echo Calculate Diferent minimum frequencies, all-weights
# Diferent minimum frequencies, WordNet 3.1, all-weights
python get-blc_lists.py --datafile dict/wn31/data.noun --outfile out/wn31/sindescmin/all/BLCnoun --sonsfile dict/wn31/sons_n.txt --descmin 0 --weight all
python get-blc_lists.py --datafile dict/wn31/data.verb --outfile out/wn31/sindescmin/all/BLCverb --sonsfile dict/wn31/sons_v.txt --descmin 0 --weight all

python get-blc_lists.py --datafile dict/wn31/data.noun --outfile out/wn31/descmin5/all/BLCnoun --sonsfile dict/wn31/sons_n.txt --descmin 5 --weight all
python get-blc_lists.py --datafile dict/wn31/data.verb --outfile out/wn31/descmin5/all/BLCverb --sonsfile dict/wn31/sons_v.txt --descmin 5 --weight all

python get-blc_lists.py --datafile dict/wn31/data.noun --outfile out/wn31/descmin10/all/BLCnoun --sonsfile dict/wn31/sons_n.txt --descmin 10 --weight all
python get-blc_lists.py --datafile dict/wn31/data.verb --outfile out/wn31/descmin10/all/BLCverb --sonsfile dict/wn31/sons_v.txt --descmin 10 --weight all

python get-blc_lists.py --datafile dict/wn31/data.noun --outfile out/wn31/descmin20/all/BLCnoun --sonsfile dict/wn31/sons_n.txt --descmin 20 --weight all
python get-blc_lists.py --datafile dict/wn31/data.verb --outfile out/wn31/descmin20/all/BLCverb --sonsfile dict/wn31/sons_v.txt --descmin 20 --weight all

python get-blc_lists.py --datafile dict/wn31/data.noun --outfile out/wn31/descmin50/all/BLCnoun --sonsfile dict/wn31/sons_n.txt --descmin 50 --weight all
python get-blc_lists.py --datafile dict/wn31/data.verb --outfile out/wn31/descmin50/all/BLCverb --sonsfile dict/wn31/sons_v.txt --descmin 50 --weight all

# Diferent minimum frequencies, WordNet 3.0, all-weights
python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/sindescmin/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 0 --weight all
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/sindescmin/all/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 0 --weight all

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin5/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 5 --weight all
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin5/all/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 5 --weight all

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin10/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 10 --weight all
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin10/all/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 10 --weight all

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin20/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 20 --weight all
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin20/all/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 20 --weight all

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin30/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 30 --weight all
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin30/all/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 30 --weight all

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin40/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 40 --weight all
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin40/all/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 40 --weight all

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin50/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 50 --weight all
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin50/all/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 50 --weight all

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin60/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 60 --weight all
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin60/all/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 60 --weight all

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin70/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 70 --weight all
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin70/all/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 70 --weight all

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin80/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 80 --weight all
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin80/all/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 80 --weight all

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin100/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 100 --weight all
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin100/all/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 100 --weight all

# Diferent minimum frequencies, WordNet 2.1, all-weights
python get-blc_lists.py --datafile dict/wn21/data.noun --outfile out/wn21/sindescmin/all/BLCnoun --sonsfile dict/wn21/sons_n.txt --descmin 0 --weight all
python get-blc_lists.py --datafile dict/wn21/data.verb --outfile out/wn21/sindescmin/all/BLCverb --sonsfile dict/wn21/sons_v.txt --descmin 0 --weight all

python get-blc_lists.py --datafile dict/wn21/data.noun --outfile out/wn21/descmin5/all/BLCnoun --sonsfile dict/wn21/sons_n.txt --descmin 5 --weight all
python get-blc_lists.py --datafile dict/wn21/data.verb --outfile out/wn21/descmin5/all/BLCverb --sonsfile dict/wn21/sons_v.txt --descmin 5 --weight all

python get-blc_lists.py --datafile dict/wn21/data.noun --outfile out/wn21/descmin10/all/BLCnoun --sonsfile dict/wn21/sons_n.txt --descmin 10 --weight all
python get-blc_lists.py --datafile dict/wn21/data.verb --outfile out/wn21/descmin10/all/BLCverb --sonsfile dict/wn21/sons_v.txt --descmin 10 --weight all

python get-blc_lists.py --datafile dict/wn21/data.noun --outfile out/wn21/descmin20/all/BLCnoun --sonsfile dict/wn21/sons_n.txt --descmin 20 --weight all
python get-blc_lists.py --datafile dict/wn21/data.verb --outfile out/wn21/descmin20/all/BLCverb --sonsfile dict/wn21/sons_v.txt --descmin 20 --weight all

python get-blc_lists.py --datafile dict/wn21/data.noun --outfile out/wn21/descmin50/all/BLCnoun --sonsfile dict/wn21/sons_n.txt --descmin 50 --weight all
python get-blc_lists.py --datafile dict/wn21/data.verb --outfile out/wn21/descmin50/all/BLCverb --sonsfile dict/wn21/sons_v.txt --descmin 50 --weight all

# Diferent minimum frequencies, WordNet 2.0, all-weights
python get-blc_lists.py --datafile dict/wn20/data.noun --outfile out/wn20/sindescmin/all/BLCnoun --sonsfile dict/wn20/sons_n.txt --descmin 0 --weight all
python get-blc_lists.py --datafile dict/wn20/data.verb --outfile out/wn20/sindescmin/all/BLCverb --sonsfile dict/wn20/sons_v.txt --descmin 0 --weight all

python get-blc_lists.py --datafile dict/wn20/data.noun --outfile out/wn20/descmin5/all/BLCnoun --sonsfile dict/wn20/sons_n.txt --descmin 5 --weight all
python get-blc_lists.py --datafile dict/wn20/data.verb --outfile out/wn20/descmin5/all/BLCverb --sonsfile dict/wn20/sons_v.txt --descmin 5 --weight all

python get-blc_lists.py --datafile dict/wn20/data.noun --outfile out/wn20/descmin10/all/BLCnoun --sonsfile dict/wn20/sons_n.txt --descmin 10 --weight all
python get-blc_lists.py --datafile dict/wn20/data.verb --outfile out/wn20/descmin10/all/BLCverb --sonsfile dict/wn20/sons_v.txt --descmin 10 --weight all

python get-blc_lists.py --datafile dict/wn20/data.noun --outfile out/wn20/descmin20/all/BLCnoun --sonsfile dict/wn20/sons_n.txt --descmin 20 --weight all
python get-blc_lists.py --datafile dict/wn20/data.verb --outfile out/wn20/descmin20/all/BLCverb --sonsfile dict/wn20/sons_v.txt --descmin 20 --weight all

python get-blc_lists.py --datafile dict/wn20/data.noun --outfile out/wn20/descmin50/all/BLCnoun --sonsfile dict/wn20/sons_n.txt --descmin 50 --weight all
python get-blc_lists.py --datafile dict/wn20/data.verb --outfile out/wn20/descmin50/all/BLCverb --sonsfile dict/wn20/sons_v.txt --descmin 50 --weight all

# Diferent minimum frequencies, WordNet 1.7.1, all-weights
python get-blc_lists.py --datafile dict/wn171/data.noun --outfile out/wn171/sindescmin/all/BLCnoun --sonsfile dict/wn171/sons_n.txt --descmin 0 --weight all
python get-blc_lists.py --datafile dict/wn171/data.verb --outfile out/wn171/sindescmin/all/BLCverb --sonsfile dict/wn171/sons_v.txt --descmin 0 --weight all

python get-blc_lists.py --datafile dict/wn171/data.noun --outfile out/wn171/descmin5/all/BLCnoun --sonsfile dict/wn171/sons_n.txt --descmin 5 --weight all
python get-blc_lists.py --datafile dict/wn171/data.verb --outfile out/wn171/descmin5/all/BLCverb --sonsfile dict/wn171/sons_v.txt --descmin 5 --weight all

python get-blc_lists.py --datafile dict/wn171/data.noun --outfile out/wn171/descmin10/all/BLCnoun --sonsfile dict/wn171/sons_n.txt --descmin 10 --weight all
python get-blc_lists.py --datafile dict/wn171/data.verb --outfile out/wn171/descmin10/all/BLCverb --sonsfile dict/wn171/sons_v.txt --descmin 10 --weight all

python get-blc_lists.py --datafile dict/wn171/data.noun --outfile out/wn171/descmin20/all/BLCnoun --sonsfile dict/wn171/sons_n.txt --descmin 20 --weight all
python get-blc_lists.py --datafile dict/wn171/data.verb --outfile out/wn171/descmin20/all/BLCverb --sonsfile dict/wn171/sons_v.txt --descmin 20 --weight all

python get-blc_lists.py --datafile dict/wn171/data.noun --outfile out/wn171/descmin50/all/BLCnoun --sonsfile dict/wn171/sons_n.txt --descmin 50 --weight all
python get-blc_lists.py --datafile dict/wn171/data.verb --outfile out/wn171/descmin50/all/BLCverb --sonsfile dict/wn171/sons_v.txt --descmin 50 --weight all

# Diferent minimum frequencies, WordNet 1.7, all-weights
python get-blc_lists.py --datafile dict/wn17/data.noun --outfile out/wn17/sindescmin/all/BLCnoun --sonsfile dict/wn17/sons_n.txt --descmin 0 --weight all
python get-blc_lists.py --datafile dict/wn17/data.verb --outfile out/wn17/sindescmin/all/BLCverb --sonsfile dict/wn17/sons_v.txt --descmin 0 --weight all

python get-blc_lists.py --datafile dict/wn17/data.noun --outfile out/wn17/descmin5/all/BLCnoun --sonsfile dict/wn17/sons_n.txt --descmin 5 --weight all
python get-blc_lists.py --datafile dict/wn17/data.verb --outfile out/wn17/descmin5/all/BLCverb --sonsfile dict/wn17/sons_v.txt --descmin 5 --weight all

python get-blc_lists.py --datafile dict/wn17/data.noun --outfile out/wn17/descmin10/all/BLCnoun --sonsfile dict/wn17/sons_n.txt --descmin 10 --weight all
python get-blc_lists.py --datafile dict/wn17/data.verb --outfile out/wn17/descmin10/all/BLCverb --sonsfile dict/wn17/sons_v.txt --descmin 10 --weight all

python get-blc_lists.py --datafile dict/wn17/data.noun --outfile out/wn17/descmin20/all/BLCnoun --sonsfile dict/wn17/sons_n.txt --descmin 20 --weight all
python get-blc_lists.py --datafile dict/wn17/data.verb --outfile out/wn17/descmin20/all/BLCverb --sonsfile dict/wn17/sons_v.txt --descmin 20 --weight all

python get-blc_lists.py --datafile dict/wn17/data.noun --outfile out/wn17/descmin50/all/BLCnoun --sonsfile dict/wn17/sons_n.txt --descmin 50 --weight all
python get-blc_lists.py --datafile dict/wn17/data.verb --outfile out/wn17/descmin50/all/BLCverb --sonsfile dict/wn17/sons_v.txt --descmin 50 --weight all

# Diferent minimum frequencies, WordNet 1.6, all-weights
python get-blc_lists.py --datafile dict/wn16/data.noun --outfile out/wn16/sindescmin/all/BLCnoun --sonsfile dict/wn16/sons_n.txt --descmin 0 --weight all
python get-blc_lists.py --datafile dict/wn16/data.verb --outfile out/wn16/sindescmin/all/BLCverb --sonsfile dict/wn16/sons_v.txt --descmin 0 --weight all

python get-blc_lists.py --datafile dict/wn16/data.noun --outfile out/wn16/descmin5/all/BLCnoun --sonsfile dict/wn16/sons_n.txt --descmin 5 --weight all
python get-blc_lists.py --datafile dict/wn16/data.verb --outfile out/wn16/descmin5/all/BLCverb --sonsfile dict/wn16/sons_v.txt --descmin 5 --weight all

python get-blc_lists.py --datafile dict/wn16/data.noun --outfile out/wn16/descmin10/all/BLCnoun --sonsfile dict/wn16/sons_n.txt --descmin 10 --weight all
python get-blc_lists.py --datafile dict/wn16/data.verb --outfile out/wn16/descmin10/all/BLCverb --sonsfile dict/wn16/sons_v.txt --descmin 10 --weight all

python get-blc_lists.py --datafile dict/wn16/data.noun --outfile out/wn16/descmin20/all/BLCnoun --sonsfile dict/wn16/sons_n.txt --descmin 20 --weight all
python get-blc_lists.py --datafile dict/wn16/data.verb --outfile out/wn16/descmin20/all/BLCverb --sonsfile dict/wn16/sons_v.txt --descmin 20 --weight all

python get-blc_lists.py --datafile dict/wn16/data.noun --outfile out/wn16/descmin50/all/BLCnoun --sonsfile dict/wn16/sons_n.txt --descmin 50 --weight all
python get-blc_lists.py --datafile dict/wn16/data.verb --outfile out/wn16/descmin50/all/BLCverb --sonsfile dict/wn16/sons_v.txt --descmin 50 --weight all

# Diferent minimum frequencies, WordNet 1.5, all-weights
python get-blc_lists.py --datafile dict/wn15/NOUN.DAT --outfile out/wn15/sindescmin/all/BLCnoun --sonsfile dict/wn15/sons_n.txt --descmin 0 --weight all
python get-blc_lists.py --datafile dict/wn15/VERB.DAT --outfile out/wn15/sindescmin/all/BLCverb --sonsfile dict/wn15/sons_v.txt --descmin 0 --weight all

python get-blc_lists.py --datafile dict/wn15/NOUN.DAT --outfile out/wn15/descmin5/all/BLCnoun --sonsfile dict/wn15/sons_n.txt --descmin 5 --weight all
python get-blc_lists.py --datafile dict/wn15/VERB.DAT --outfile out/wn15/descmin5/all/BLCverb --sonsfile dict/wn15/sons_v.txt --descmin 5 --weight all

python get-blc_lists.py --datafile dict/wn15/NOUN.DAT --outfile out/wn15/descmin10/all/BLCnoun --sonsfile dict/wn15/sons_n.txt --descmin 10 --weight all
python get-blc_lists.py --datafile dict/wn15/VERB.DAT --outfile out/wn15/descmin10/all/BLCverb --sonsfile dict/wn15/sons_v.txt --descmin 10 --weight all

python get-blc_lists.py --datafile dict/wn15/NOUN.DAT --outfile out/wn15/descmin20/all/BLCnoun --sonsfile dict/wn15/sons_n.txt --descmin 20 --weight all
python get-blc_lists.py --datafile dict/wn15/VERB.DAT --outfile out/wn15/descmin20/all/BLCverb --sonsfile dict/wn15/sons_v.txt --descmin 20 --weight all

python get-blc_lists.py --datafile dict/wn15/NOUN.DAT --outfile out/wn15/descmin50/all/BLCnoun --sonsfile dict/wn15/sons_n.txt --descmin 50 --weight all
python get-blc_lists.py --datafile dict/wn15/VERB.DAT --outfile out/wn15/descmin50/all/BLCverb --sonsfile dict/wn15/sons_v.txt --descmin 50 --weight all


echo Calculate Diferent minimum frequencies, all-weights+gloss
# Diferent minimum frequencies, WordNet 3.0, all-weights+gloss
python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/sindescmin/all+gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 0 --weight all+gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/sindescmin/all+gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 0 --weight all+gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin5/all+gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 5 --weight all+gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin5/all+gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 5 --weight all+gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin10/all+gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 10 --weight all+gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin10/all+gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 10 --weight all+gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin20/all+gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 20 --weight all+gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin20/all+gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 20 --weight all+gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin30/all+gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 30 --weight all+gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin30/all+gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 30 --weight all+gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin40/all+gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 40 --weight all+gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin40/all+gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 40 --weight all+gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin50/all+gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 50 --weight all+gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin50/all+gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 50 --weight all+gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin60/all+gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 60 --weight all+gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin60/all+gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 60 --weight all+gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin70/all+gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 70 --weight all+gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin70/all+gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 70 --weight all+gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin80/all+gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 80 --weight all+gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin80/all+gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 80 --weight all+gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin100/all+gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 100 --weight all+gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin100/all+gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 100 --weight all+gloss --glossfile dict/wn30/gloss.rel


echo Calculate Diferent minimum frequencies, frequency
# Diferent minimum frequencies, WordNet 3.1, frequency
python get-blc_lists.py --datafile dict/wn31/data.noun --outfile out/wn31/sindescmin/freq/BLCnoun --sonsfile dict/wn31/sons_n.txt --descmin 0 --weight freq --sensefile dict/wn31/index.sense
python get-blc_lists.py --datafile dict/wn31/data.verb --outfile out/wn31/sindescmin/freq/BLCverb --sonsfile dict/wn31/sons_v.txt --descmin 0 --weight freq --sensefile dict/wn31/index.sense

python get-blc_lists.py --datafile dict/wn31/data.noun --outfile out/wn31/descmin5/freq/BLCnoun --sonsfile dict/wn31/sons_n.txt --descmin 5 --weight freq --sensefile dict/wn31/index.sense
python get-blc_lists.py --datafile dict/wn31/data.verb --outfile out/wn31/descmin5/freq/BLCverb --sonsfile dict/wn31/sons_v.txt --descmin 5 --weight freq --sensefile dict/wn31/index.sense

python get-blc_lists.py --datafile dict/wn31/data.noun --outfile out/wn31/descmin10/freq/BLCnoun --sonsfile dict/wn31/sons_n.txt --descmin 10 --weight freq --sensefile dict/wn31/index.sense
python get-blc_lists.py --datafile dict/wn31/data.verb --outfile out/wn31/descmin10/freq/BLCverb --sonsfile dict/wn31/sons_v.txt --descmin 10 --weight freq --sensefile dict/wn31/index.sense

python get-blc_lists.py --datafile dict/wn31/data.noun --outfile out/wn31/descmin20/freq/BLCnoun --sonsfile dict/wn31/sons_n.txt --descmin 20 --weight freq --sensefile dict/wn31/index.sense
python get-blc_lists.py --datafile dict/wn31/data.verb --outfile out/wn31/descmin20/freq/BLCverb --sonsfile dict/wn31/sons_v.txt --descmin 20 --weight freq --sensefile dict/wn31/index.sense

python get-blc_lists.py --datafile dict/wn31/data.noun --outfile out/wn31/descmin50/freq/BLCnoun --sonsfile dict/wn31/sons_n.txt --descmin 50 --weight freq --sensefile dict/wn31/index.sense
python get-blc_lists.py --datafile dict/wn31/data.verb --outfile out/wn31/descmin50/freq/BLCverb --sonsfile dict/wn31/sons_v.txt --descmin 50 --weight freq --sensefile dict/wn31/index.sense

# Diferent minimum frequencies, WordNet 3.0, frequency
python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/sindescmin/freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 0 --weight freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/sindescmin/freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 0 --weight freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin5/freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 5 --weight freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin5/freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 5 --weight freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin10/freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 10 --weight freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin10/freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 10 --weight freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin20/freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 20 --weight freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin20/freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 20 --weight freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin30/freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 30 --weight freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin30/freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 30 --weight freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin40/freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 40 --weight freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin40/freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 40 --weight freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin50/freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 50 --weight freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin50/freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 50 --weight freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin60/freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 60 --weight freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin60/freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 60 --weight freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin70/freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 70 --weight freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin70/freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 70 --weight freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin80/freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 80 --weight freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin80/freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 80 --weight freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/descmin100/freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --descmin 100 --weight freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/descmin100/freq/BLCverb --sonsfile dict/wn30/sons_v.txt --descmin 100 --weight freq --sensefile dict/wn30/index.sense

# Diferent minimum frequencies, WordNet 2.1, frequency
python get-blc_lists.py --datafile dict/wn21/data.noun --outfile out/wn21/sindescmin/freq/BLCnoun --sonsfile dict/wn21/sons_n.txt --descmin 0 --weight freq --sensefile dict/wn21/index.sense
python get-blc_lists.py --datafile dict/wn21/data.verb --outfile out/wn21/sindescmin/freq/BLCverb --sonsfile dict/wn21/sons_v.txt --descmin 0 --weight freq --sensefile dict/wn21/index.sense

python get-blc_lists.py --datafile dict/wn21/data.noun --outfile out/wn21/descmin5/freq/BLCnoun --sonsfile dict/wn21/sons_n.txt --descmin 5 --weight freq --sensefile dict/wn21/index.sense
python get-blc_lists.py --datafile dict/wn21/data.verb --outfile out/wn21/descmin5/freq/BLCverb --sonsfile dict/wn21/sons_v.txt --descmin 5 --weight freq --sensefile dict/wn21/index.sense

python get-blc_lists.py --datafile dict/wn21/data.noun --outfile out/wn21/descmin10/freq/BLCnoun --sonsfile dict/wn21/sons_n.txt --descmin 10 --weight freq --sensefile dict/wn21/index.sense
python get-blc_lists.py --datafile dict/wn21/data.verb --outfile out/wn21/descmin10/freq/BLCverb --sonsfile dict/wn21/sons_v.txt --descmin 10 --weight freq --sensefile dict/wn21/index.sense

python get-blc_lists.py --datafile dict/wn21/data.noun --outfile out/wn21/descmin20/freq/BLCnoun --sonsfile dict/wn21/sons_n.txt --descmin 20 --weight freq --sensefile dict/wn21/index.sense
python get-blc_lists.py --datafile dict/wn21/data.verb --outfile out/wn21/descmin20/freq/BLCverb --sonsfile dict/wn21/sons_v.txt --descmin 20 --weight freq --sensefile dict/wn21/index.sense

python get-blc_lists.py --datafile dict/wn21/data.noun --outfile out/wn21/descmin50/freq/BLCnoun --sonsfile dict/wn21/sons_n.txt --descmin 50 --weight freq --sensefile dict/wn21/index.sense
python get-blc_lists.py --datafile dict/wn21/data.verb --outfile out/wn21/descmin50/freq/BLCverb --sonsfile dict/wn21/sons_v.txt --descmin 50 --weight freq --sensefile dict/wn21/index.sense

# Diferent minimum frequencies, WordNet 2.0, frequency
python get-blc_lists.py --datafile dict/wn20/data.noun --outfile out/wn20/sindescmin/freq/BLCnoun --sonsfile dict/wn20/sons_n.txt --descmin 0 --weight freq --sensefile dict/wn20/index.sense
python get-blc_lists.py --datafile dict/wn20/data.verb --outfile out/wn20/sindescmin/freq/BLCverb --sonsfile dict/wn20/sons_v.txt --descmin 0 --weight freq --sensefile dict/wn20/index.sense

python get-blc_lists.py --datafile dict/wn20/data.noun --outfile out/wn20/descmin5/freq/BLCnoun --sonsfile dict/wn20/sons_n.txt --descmin 5 --weight freq --sensefile dict/wn20/index.sense
python get-blc_lists.py --datafile dict/wn20/data.verb --outfile out/wn20/descmin5/freq/BLCverb --sonsfile dict/wn20/sons_v.txt --descmin 5 --weight freq --sensefile dict/wn20/index.sense

python get-blc_lists.py --datafile dict/wn20/data.noun --outfile out/wn20/descmin10/freq/BLCnoun --sonsfile dict/wn20/sons_n.txt --descmin 10 --weight freq --sensefile dict/wn20/index.sense
python get-blc_lists.py --datafile dict/wn20/data.verb --outfile out/wn20/descmin10/freq/BLCverb --sonsfile dict/wn20/sons_v.txt --descmin 10 --weight freq --sensefile dict/wn20/index.sense

python get-blc_lists.py --datafile dict/wn20/data.noun --outfile out/wn20/descmin20/freq/BLCnoun --sonsfile dict/wn20/sons_n.txt --descmin 20 --weight freq --sensefile dict/wn20/index.sense
python get-blc_lists.py --datafile dict/wn20/data.verb --outfile out/wn20/descmin20/freq/BLCverb --sonsfile dict/wn20/sons_v.txt --descmin 20 --weight freq --sensefile dict/wn20/index.sense

python get-blc_lists.py --datafile dict/wn20/data.noun --outfile out/wn20/descmin50/freq/BLCnoun --sonsfile dict/wn20/sons_n.txt --descmin 50 --weight freq --sensefile dict/wn20/index.sense
python get-blc_lists.py --datafile dict/wn20/data.verb --outfile out/wn20/descmin50/freq/BLCverb --sonsfile dict/wn20/sons_v.txt --descmin 50 --weight freq --sensefile dict/wn20/index.sense

# Diferent minimum frequencies, WordNet 1.7.1, frequency
python get-blc_lists.py --datafile dict/wn171/data.noun --outfile out/wn171/sindescmin/freq/BLCnoun --sonsfile dict/wn171/sons_n.txt --descmin 0 --weight freq --sensefile dict/wn171/index.sense
python get-blc_lists.py --datafile dict/wn171/data.verb --outfile out/wn171/sindescmin/freq/BLCverb --sonsfile dict/wn171/sons_v.txt --descmin 0 --weight freq --sensefile dict/wn171/index.sense

python get-blc_lists.py --datafile dict/wn171/data.noun --outfile out/wn171/descmin5/freq/BLCnoun --sonsfile dict/wn171/sons_n.txt --descmin 5 --weight freq --sensefile dict/wn171/index.sense
python get-blc_lists.py --datafile dict/wn171/data.verb --outfile out/wn171/descmin5/freq/BLCverb --sonsfile dict/wn171/sons_v.txt --descmin 5 --weight freq --sensefile dict/wn171/index.sense

python get-blc_lists.py --datafile dict/wn171/data.noun --outfile out/wn171/descmin10/freq/BLCnoun --sonsfile dict/wn171/sons_n.txt --descmin 10 --weight freq --sensefile dict/wn171/index.sense
python get-blc_lists.py --datafile dict/wn171/data.verb --outfile out/wn171/descmin10/freq/BLCverb --sonsfile dict/wn171/sons_v.txt --descmin 10 --weight freq --sensefile dict/wn171/index.sense

python get-blc_lists.py --datafile dict/wn171/data.noun --outfile out/wn171/descmin20/freq/BLCnoun --sonsfile dict/wn171/sons_n.txt --descmin 20 --weight freq --sensefile dict/wn171/index.sense
python get-blc_lists.py --datafile dict/wn171/data.verb --outfile out/wn171/descmin20/freq/BLCverb --sonsfile dict/wn171/sons_v.txt --descmin 20 --weight freq --sensefile dict/wn171/index.sense

python get-blc_lists.py --datafile dict/wn171/data.noun --outfile out/wn171/descmin50/freq/BLCnoun --sonsfile dict/wn171/sons_n.txt --descmin 50 --weight freq --sensefile dict/wn171/index.sense
python get-blc_lists.py --datafile dict/wn171/data.verb --outfile out/wn171/descmin50/freq/BLCverb --sonsfile dict/wn171/sons_v.txt --descmin 50 --weight freq --sensefile dict/wn171/index.sense

# Diferent minimum frequencies, WordNet 1.7, frequency
python get-blc_lists.py --datafile dict/wn17/data.noun --outfile out/wn17/sindescmin/freq/BLCnoun --sonsfile dict/wn17/sons_n.txt --descmin 0 --weight freq --sensefile dict/wn171/index.sense
python get-blc_lists.py --datafile dict/wn17/data.verb --outfile out/wn17/sindescmin/freq/BLCverb --sonsfile dict/wn17/sons_v.txt --descmin 0 --weight freq --sensefile dict/wn171/index.sense

python get-blc_lists.py --datafile dict/wn17/data.noun --outfile out/wn17/descmin5/freq/BLCnoun --sonsfile dict/wn17/sons_n.txt --descmin 5 --weight freq --sensefile dict/wn171/index.sense
python get-blc_lists.py --datafile dict/wn17/data.verb --outfile out/wn17/descmin5/freq/BLCverb --sonsfile dict/wn17/sons_v.txt --descmin 5 --weight freq --sensefile dict/wn171/index.sense

python get-blc_lists.py --datafile dict/wn17/data.noun --outfile out/wn17/descmin10/freq/BLCnoun --sonsfile dict/wn17/sons_n.txt --descmin 10 --weight freq --sensefile dict/wn171/index.sense
python get-blc_lists.py --datafile dict/wn17/data.verb --outfile out/wn17/descmin10/freq/BLCverb --sonsfile dict/wn17/sons_v.txt --descmin 10 --weight freq --sensefile dict/wn171/index.sense

python get-blc_lists.py --datafile dict/wn17/data.noun --outfile out/wn17/descmin20/freq/BLCnoun --sonsfile dict/wn17/sons_n.txt --descmin 20 --weight freq --sensefile dict/wn171/index.sense
python get-blc_lists.py --datafile dict/wn17/data.verb --outfile out/wn17/descmin20/freq/BLCverb --sonsfile dict/wn17/sons_v.txt --descmin 20 --weight freq --sensefile dict/wn171/index.sense

python get-blc_lists.py --datafile dict/wn17/data.noun --outfile out/wn17/descmin50/freq/BLCnoun --sonsfile dict/wn17/sons_n.txt --descmin 50 --weight freq --sensefile dict/wn171/index.sense
python get-blc_lists.py --datafile dict/wn17/data.verb --outfile out/wn17/descmin50/freq/BLCverb --sonsfile dict/wn17/sons_v.txt --descmin 50 --weight freq --sensefile dict/wn171/index.sense

# Diferent minimum frequencies, WordNet 1.6, frequency
python get-blc_lists.py --datafile dict/wn16/data.noun --outfile out/wn16/sindescmin/freq/BLCnoun --sonsfile dict/wn16/sons_n.txt --descmin 0 --weight freq --sensefile dict/wn16/index.sense
python get-blc_lists.py --datafile dict/wn16/data.verb --outfile out/wn16/sindescmin/freq/BLCverb --sonsfile dict/wn16/sons_v.txt --descmin 0 --weight freq --sensefile dict/wn16/index.sense

python get-blc_lists.py --datafile dict/wn16/data.noun --outfile out/wn16/descmin5/freq/BLCnoun --sonsfile dict/wn16/sons_n.txt --descmin 5 --weight freq --sensefile dict/wn16/index.sense
python get-blc_lists.py --datafile dict/wn16/data.verb --outfile out/wn16/descmin5/freq/BLCverb --sonsfile dict/wn16/sons_v.txt --descmin 5 --weight freq --sensefile dict/wn16/index.sense

python get-blc_lists.py --datafile dict/wn16/data.noun --outfile out/wn16/descmin10/freq/BLCnoun --sonsfile dict/wn16/sons_n.txt --descmin 10 --weight freq --sensefile dict/wn16/index.sense
python get-blc_lists.py --datafile dict/wn16/data.verb --outfile out/wn16/descmin10/freq/BLCverb --sonsfile dict/wn16/sons_v.txt --descmin 10 --weight freq --sensefile dict/wn16/index.sense

python get-blc_lists.py --datafile dict/wn16/data.noun --outfile out/wn16/descmin20/freq/BLCnoun --sonsfile dict/wn16/sons_n.txt --descmin 20 --weight freq --sensefile dict/wn16/index.sense
python get-blc_lists.py --datafile dict/wn16/data.verb --outfile out/wn16/descmin20/freq/BLCverb --sonsfile dict/wn16/sons_v.txt --descmin 20 --weight freq --sensefile dict/wn16/index.sense

python get-blc_lists.py --datafile dict/wn16/data.noun --outfile out/wn16/descmin50/freq/BLCnoun --sonsfile dict/wn16/sons_n.txt --descmin 50 --weight freq --sensefile dict/wn16/index.sense
python get-blc_lists.py --datafile dict/wn16/data.verb --outfile out/wn16/descmin50/freq/BLCverb --sonsfile dict/wn16/sons_v.txt --descmin 50 --weight freq --sensefile dict/wn16/index.sense


#Zip
echo Zipping....

cd out
for dir in */
do
  base=$(basename "$dir")
  tar -czf "${base}.tar.gz" "$dir"
done

