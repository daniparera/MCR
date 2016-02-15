#!/bin/bash

# For each version: WN3.0, WN3.1, WN2.1, WN2.0, WN1.7.1, WN1.6, WN1.5 ... 
# BLC0, BLC5, BLC10, BLC20 and BLC50
# all-relations, all-relations+gloss-relations (WN3.0) and frequency (addition for each variant in index.sense file)

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

echo Calculate Diferent minimum frequencies all-relations
# Diferent minimum frequencies, WordNet 3.1, all-relations
python get-blc_lists.py --datafile dict/wn31/data.noun --outfile out/wn31/sinfreqmin/all/BLCnoun --sonsfile dict/wn31/sons_n.txt --minfreq 0 --relation all
python get-blc_lists.py --datafile dict/wn31/data.verb --outfile out/wn31/sinfreqmin/all/BLCverb --sonsfile dict/wn31/sons_v.txt --minfreq 0 --relation all

python get-blc_lists.py --datafile dict/wn31/data.noun --outfile out/wn31/freqmin5/all/BLCnoun --sonsfile dict/wn31/sons_n.txt --minfreq 5 --relation all
python get-blc_lists.py --datafile dict/wn31/data.verb --outfile out/wn31/freqmin5/all/BLCverb --sonsfile dict/wn31/sons_v.txt --minfreq 5 --relation all

python get-blc_lists.py --datafile dict/wn31/data.noun --outfile out/wn31/freqmin10/all/BLCnoun --sonsfile dict/wn31/sons_n.txt --minfreq 10 --relation all
python get-blc_lists.py --datafile dict/wn31/data.verb --outfile out/wn31/freqmin10/all/BLCverb --sonsfile dict/wn31/sons_v.txt --minfreq 10 --relation all

python get-blc_lists.py --datafile dict/wn31/data.noun --outfile out/wn31/freqmin20/all/BLCnoun --sonsfile dict/wn31/sons_n.txt --minfreq 20 --relation all
python get-blc_lists.py --datafile dict/wn31/data.verb --outfile out/wn31/freqmin20/all/BLCverb --sonsfile dict/wn31/sons_v.txt --minfreq 20 --relation all

python get-blc_lists.py --datafile dict/wn31/data.noun --outfile out/wn31/freqmin50/all/BLCnoun --sonsfile dict/wn31/sons_n.txt --minfreq 50 --relation all
python get-blc_lists.py --datafile dict/wn31/data.verb --outfile out/wn31/freqmin50/all/BLCverb --sonsfile dict/wn31/sons_v.txt --minfreq 50 --relation all

# Diferent minimum frequencies, WordNet 3.0, all-relations
python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/sinfreqmin/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --minfreq 0 --relation all
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/sinfreqmin/all/BLCverb --sonsfile dict/wn30/sons_v.txt --minfreq 0 --relation all

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/freqmin5/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --minfreq 5 --relation all
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/freqmin5/all/BLCverb --sonsfile dict/wn30/sons_v.txt --minfreq 5 --relation all

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/freqmin10/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --minfreq 10 --relation all
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/freqmin10/all/BLCverb --sonsfile dict/wn30/sons_v.txt --minfreq 10 --relation all

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/freqmin20/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --minfreq 20 --relation all
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/freqmin20/all/BLCverb --sonsfile dict/wn30/sons_v.txt --minfreq 20 --relation all

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/freqmin50/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --minfreq 50 --relation all
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/freqmin50/all/BLCverb --sonsfile dict/wn30/sons_v.txt --minfreq 50 --relation all

# Diferent minimum frequencies, WordNet 2.1, all-relations
python get-blc_lists.py --datafile dict/wn21/data.noun --outfile out/wn21/sinfreqmin/all/BLCnoun --sonsfile dict/wn21/sons_n.txt --minfreq 0 --relation all
python get-blc_lists.py --datafile dict/wn21/data.verb --outfile out/wn21/sinfreqmin/all/BLCverb --sonsfile dict/wn21/sons_v.txt --minfreq 0 --relation all

python get-blc_lists.py --datafile dict/wn21/data.noun --outfile out/wn21/freqmin5/all/BLCnoun --sonsfile dict/wn21/sons_n.txt --minfreq 5 --relation all
python get-blc_lists.py --datafile dict/wn21/data.verb --outfile out/wn21/freqmin5/all/BLCverb --sonsfile dict/wn21/sons_v.txt --minfreq 5 --relation all

python get-blc_lists.py --datafile dict/wn21/data.noun --outfile out/wn21/freqmin10/all/BLCnoun --sonsfile dict/wn21/sons_n.txt --minfreq 10 --relation all
python get-blc_lists.py --datafile dict/wn21/data.verb --outfile out/wn21/freqmin10/all/BLCverb --sonsfile dict/wn21/sons_v.txt --minfreq 10 --relation all

python get-blc_lists.py --datafile dict/wn21/data.noun --outfile out/wn21/freqmin20/all/BLCnoun --sonsfile dict/wn21/sons_n.txt --minfreq 20 --relation all
python get-blc_lists.py --datafile dict/wn21/data.verb --outfile out/wn21/freqmin20/all/BLCverb --sonsfile dict/wn21/sons_v.txt --minfreq 20 --relation all

python get-blc_lists.py --datafile dict/wn21/data.noun --outfile out/wn21/freqmin50/all/BLCnoun --sonsfile dict/wn21/sons_n.txt --minfreq 50 --relation all
python get-blc_lists.py --datafile dict/wn21/data.verb --outfile out/wn21/freqmin50/all/BLCverb --sonsfile dict/wn21/sons_v.txt --minfreq 50 --relation all

# Diferent minimum frequencies, WordNet 2.0, all-relations
python get-blc_lists.py --datafile dict/wn20/data.noun --outfile out/wn20/sinfreqmin/all/BLCnoun --sonsfile dict/wn20/sons_n.txt --minfreq 0 --relation all
python get-blc_lists.py --datafile dict/wn20/data.verb --outfile out/wn20/sinfreqmin/all/BLCverb --sonsfile dict/wn20/sons_v.txt --minfreq 0 --relation all

python get-blc_lists.py --datafile dict/wn20/data.noun --outfile out/wn20/freqmin5/all/BLCnoun --sonsfile dict/wn20/sons_n.txt --minfreq 5 --relation all
python get-blc_lists.py --datafile dict/wn20/data.verb --outfile out/wn20/freqmin5/all/BLCverb --sonsfile dict/wn20/sons_v.txt --minfreq 5 --relation all

python get-blc_lists.py --datafile dict/wn20/data.noun --outfile out/wn20/freqmin10/all/BLCnoun --sonsfile dict/wn20/sons_n.txt --minfreq 10 --relation all
python get-blc_lists.py --datafile dict/wn20/data.verb --outfile out/wn20/freqmin10/all/BLCverb --sonsfile dict/wn20/sons_v.txt --minfreq 10 --relation all

python get-blc_lists.py --datafile dict/wn20/data.noun --outfile out/wn20/freqmin20/all/BLCnoun --sonsfile dict/wn20/sons_n.txt --minfreq 20 --relation all
python get-blc_lists.py --datafile dict/wn20/data.verb --outfile out/wn20/freqmin20/all/BLCverb --sonsfile dict/wn20/sons_v.txt --minfreq 20 --relation all

python get-blc_lists.py --datafile dict/wn20/data.noun --outfile out/wn20/freqmin50/all/BLCnoun --sonsfile dict/wn20/sons_n.txt --minfreq 50 --relation all
python get-blc_lists.py --datafile dict/wn20/data.verb --outfile out/wn20/freqmin50/all/BLCverb --sonsfile dict/wn20/sons_v.txt --minfreq 50 --relation all

# Diferent minimum frequencies, WordNet 1.7.1, all-relations
python get-blc_lists.py --datafile dict/wn171/data.noun --outfile out/wn171/sinfreqmin/all/BLCnoun --sonsfile dict/wn171/sons_n.txt --minfreq 0 --relation all
python get-blc_lists.py --datafile dict/wn171/data.verb --outfile out/wn171/sinfreqmin/all/BLCverb --sonsfile dict/wn171/sons_v.txt --minfreq 0 --relation all

python get-blc_lists.py --datafile dict/wn171/data.noun --outfile out/wn171/freqmin5/all/BLCnoun --sonsfile dict/wn171/sons_n.txt --minfreq 5 --relation all
python get-blc_lists.py --datafile dict/wn171/data.verb --outfile out/wn171/freqmin5/all/BLCverb --sonsfile dict/wn171/sons_v.txt --minfreq 5 --relation all

python get-blc_lists.py --datafile dict/wn171/data.noun --outfile out/wn171/freqmin10/all/BLCnoun --sonsfile dict/wn171/sons_n.txt --minfreq 10 --relation all
python get-blc_lists.py --datafile dict/wn171/data.verb --outfile out/wn171/freqmin10/all/BLCverb --sonsfile dict/wn171/sons_v.txt --minfreq 10 --relation all

python get-blc_lists.py --datafile dict/wn171/data.noun --outfile out/wn171/freqmin20/all/BLCnoun --sonsfile dict/wn171/sons_n.txt --minfreq 20 --relation all
python get-blc_lists.py --datafile dict/wn171/data.verb --outfile out/wn171/freqmin20/all/BLCverb --sonsfile dict/wn171/sons_v.txt --minfreq 20 --relation all

python get-blc_lists.py --datafile dict/wn171/data.noun --outfile out/wn171/freqmin50/all/BLCnoun --sonsfile dict/wn171/sons_n.txt --minfreq 50 --relation all
python get-blc_lists.py --datafile dict/wn171/data.verb --outfile out/wn171/freqmin50/all/BLCverb --sonsfile dict/wn171/sons_v.txt --minfreq 50 --relation all

# Diferent minimum frequencies, WordNet 1.7, all-relations
python get-blc_lists.py --datafile dict/wn17/data.noun --outfile out/wn171/sinfreqmin/all/BLCnoun --sonsfile dict/wn17/sons_n.txt --minfreq 0 --relation all
python get-blc_lists.py --datafile dict/wn17/data.verb --outfile out/wn171/sinfreqmin/all/BLCverb --sonsfile dict/wn17/sons_v.txt --minfreq 0 --relation all

python get-blc_lists.py --datafile dict/wn17/data.noun --outfile out/wn171/freqmin5/all/BLCnoun --sonsfile dict/wn17/sons_n.txt --minfreq 5 --relation all
python get-blc_lists.py --datafile dict/wn17/data.verb --outfile out/wn171/freqmin5/all/BLCverb --sonsfile dict/wn17/sons_v.txt --minfreq 5 --relation all

python get-blc_lists.py --datafile dict/wn17/data.noun --outfile out/wn171/freqmin10/all/BLCnoun --sonsfile dict/wn17/sons_n.txt --minfreq 10 --relation all
python get-blc_lists.py --datafile dict/wn17/data.verb --outfile out/wn171/freqmin10/all/BLCverb --sonsfile dict/wn17/sons_v.txt --minfreq 10 --relation all

python get-blc_lists.py --datafile dict/wn17/data.noun --outfile out/wn171/freqmin20/all/BLCnoun --sonsfile dict/wn17/sons_n.txt --minfreq 20 --relation all
python get-blc_lists.py --datafile dict/wn17/data.verb --outfile out/wn171/freqmin20/all/BLCverb --sonsfile dict/wn17/sons_v.txt --minfreq 20 --relation all

python get-blc_lists.py --datafile dict/wn17/data.noun --outfile out/wn171/freqmin50/all/BLCnoun --sonsfile dict/wn17/sons_n.txt --minfreq 50 --relation all
python get-blc_lists.py --datafile dict/wn17/data.verb --outfile out/wn171/freqmin50/all/BLCverb --sonsfile dict/wn17/sons_v.txt --minfreq 50 --relation all

# Diferent minimum frequencies, WordNet 1.6, all-relations
python get-blc_lists.py --datafile dict/wn16/data.noun --outfile out/wn16/sinfreqmin/all/BLCnoun --sonsfile dict/wn16/sons_n.txt --minfreq 0 --relation all
python get-blc_lists.py --datafile dict/wn16/data.verb --outfile out/wn16/sinfreqmin/all/BLCverb --sonsfile dict/wn16/sons_v.txt --minfreq 0 --relation all

python get-blc_lists.py --datafile dict/wn16/data.noun --outfile out/wn16/freqmin5/all/BLCnoun --sonsfile dict/wn16/sons_n.txt --minfreq 5 --relation all
python get-blc_lists.py --datafile dict/wn16/data.verb --outfile out/wn16/freqmin5/all/BLCverb --sonsfile dict/wn16/sons_v.txt --minfreq 5 --relation all

python get-blc_lists.py --datafile dict/wn16/data.noun --outfile out/wn16/freqmin10/all/BLCnoun --sonsfile dict/wn16/sons_n.txt --minfreq 10 --relation all
python get-blc_lists.py --datafile dict/wn16/data.verb --outfile out/wn16/freqmin10/all/BLCverb --sonsfile dict/wn16/sons_v.txt --minfreq 10 --relation all

python get-blc_lists.py --datafile dict/wn16/data.noun --outfile out/wn16/freqmin20/all/BLCnoun --sonsfile dict/wn16/sons_n.txt --minfreq 20 --relation all
python get-blc_lists.py --datafile dict/wn16/data.verb --outfile out/wn16/freqmin20/all/BLCverb --sonsfile dict/wn16/sons_v.txt --minfreq 20 --relation all

python get-blc_lists.py --datafile dict/wn16/data.noun --outfile out/wn16/freqmin50/all/BLCnoun --sonsfile dict/wn16/sons_n.txt --minfreq 50 --relation all
python get-blc_lists.py --datafile dict/wn16/data.verb --outfile out/wn16/freqmin50/all/BLCverb --sonsfile dict/wn16/sons_v.txt --minfreq 50 --relation all

# Diferent minimum frequencies, WordNet 1.5, all-relations
python get-blc_lists.py --datafile dict/wn15/NOUN.DAT --outfile out/wn15/sinfreqmin/all/BLCnoun --sonsfile dict/wn15/sons_n.txt --minfreq 0 --relation all
python get-blc_lists.py --datafile dict/wn15/VERB.DAT --outfile out/wn15/sinfreqmin/all/BLCverb --sonsfile dict/wn15/sons_v.txt --minfreq 0 --relation all

python get-blc_lists.py --datafile dict/wn15/NOUN.DAT --outfile out/wn15/freqmin5/all/BLCnoun --sonsfile dict/wn15/sons_n.txt --minfreq 5 --relation all
python get-blc_lists.py --datafile dict/wn15/VERB.DAT --outfile out/wn15/freqmin5/all/BLCverb --sonsfile dict/wn15/sons_v.txt --minfreq 5 --relation all

python get-blc_lists.py --datafile dict/wn15/NOUN.DAT --outfile out/wn15/freqmin10/all/BLCnoun --sonsfile dict/wn15/sons_n.txt --minfreq 10 --relation all
python get-blc_lists.py --datafile dict/wn15/VERB.DAT --outfile out/wn15/freqmin10/all/BLCverb --sonsfile dict/wn15/sons_v.txt --minfreq 10 --relation all

python get-blc_lists.py --datafile dict/wn15/NOUN.DAT --outfile out/wn15/freqmin20/all/BLCnoun --sonsfile dict/wn15/sons_n.txt --minfreq 20 --relation all
python get-blc_lists.py --datafile dict/wn15/VERB.DAT --outfile out/wn15/freqmin20/all/BLCverb --sonsfile dict/wn15/sons_v.txt --minfreq 20 --relation all

python get-blc_lists.py --datafile dict/wn15/NOUN.DAT --outfile out/wn15/freqmin50/all/BLCnoun --sonsfile dict/wn15/sons_n.txt --minfreq 50 --relation all
python get-blc_lists.py --datafile dict/wn15/VERB.DAT --outfile out/wn15/freqmin50/all/BLCverb --sonsfile dict/wn15/sons_v.txt --minfreq 50 --relation all


Calculate Diferent minimum frequencies all-relations+gloss
# Diferent minimum frequencies, WordNet 3.0, all-relations+gloss
python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/sinfreqmin/all+gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --minfreq 0 --relation all+gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/sinfreqmin/all+gloss/BLCnoun --sonsfile dict/wn30/sons_v.txt --minfreq 0 --relation all+gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/freqmin5/all+gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --minfreq 5 --relation all+gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/freqmin5/all+gloss/BLCnoun --sonsfile dict/wn30/sons_v.txt --minfreq 5 --relation all+gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/freqmin10/all+gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --minfreq 10 --relation all+gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/freqmin10/all+gloss/BLCnoun --sonsfile dict/wn30/sons_v.txt --minfreq 10 --relation all+gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/freqmin20/all+gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --minfreq 20 --relation all+gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/freqmin20/all+gloss/BLCnoun --sonsfile dict/wn30/sons_v.txt --minfreq 20 --relation all+gloss --glossfile dict/wn30/gloss.rel

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/freqmin50/all+gloss/BLCnoun --sonsfile dict/wn30/sons_n.txt --minfreq 50 --relation all+gloss --glossfile dict/wn30/gloss.rel
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/freqmin50/all+gloss/BLCverb --sonsfile dict/wn30/sons_v.txt --minfreq 50 --relation all+gloss --glossfile dict/wn30/gloss.rel


Calculate Diferent minimum frequencies frequency
# Diferent minimum frequencies, WordNet 3.1, frequency
python get-blc_lists.py --datafile dict/wn31/data.noun --outfile out/wn31/sinfreqmin/freq/BLCnoun --sonsfile dict/wn31/sons_n.txt --minfreq 0 --relation freq --sensefile dict/wn31/index.sense
python get-blc_lists.py --datafile dict/wn31/data.verb --outfile out/wn31/sinfreqmin/freq/BLCverb --sonsfile dict/wn31/sons_v.txt --minfreq 0 --relation freq --sensefile dict/wn31/index.sense

python get-blc_lists.py --datafile dict/wn31/data.noun --outfile out/wn31/freqmin5/freq/BLCnoun --sonsfile dict/wn31/sons_n.txt --minfreq 5 --relation freq --sensefile dict/wn31/index.sense
python get-blc_lists.py --datafile dict/wn31/data.verb --outfile out/wn31/freqmin5/freq/BLCverb --sonsfile dict/wn31/sons_v.txt --minfreq 5 --relation freq --sensefile dict/wn31/index.sense

python get-blc_lists.py --datafile dict/wn31/data.noun --outfile out/wn31/freqmin10/freq/BLCnoun --sonsfile dict/wn31/sons_n.txt --minfreq 10 --relation freq --sensefile dict/wn31/index.sense
python get-blc_lists.py --datafile dict/wn31/data.verb --outfile out/wn31/freqmin10/freq/BLCverb --sonsfile dict/wn31/sons_v.txt --minfreq 10 --relation freq --sensefile dict/wn31/index.sense

python get-blc_lists.py --datafile dict/wn31/data.noun --outfile out/wn31/freqmin20/freq/BLCnoun --sonsfile dict/wn31/sons_n.txt --minfreq 20 --relation freq --sensefile dict/wn31/index.sense
python get-blc_lists.py --datafile dict/wn31/data.verb --outfile out/wn31/freqmin20/freq/BLCverb --sonsfile dict/wn31/sons_v.txt --minfreq 20 --relation freq --sensefile dict/wn31/index.sense

python get-blc_lists.py --datafile dict/wn31/data.noun --outfile out/wn31/freqmin50/freq/BLCnoun --sonsfile dict/wn31/sons_n.txt --minfreq 50 --relation freq --sensefile dict/wn31/index.sense
python get-blc_lists.py --datafile dict/wn31/data.verb --outfile out/wn31/freqmin50/freq/BLCverb --sonsfile dict/wn31/sons_v.txt --minfreq 50 --relation freq --sensefile dict/wn31/index.sense

# Diferent minimum frequencies, WordNet 3.0, frequency
python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/sinfreqmin/freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --minfreq 0 --relation freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/sinfreqmin/freq/BLCverb --sonsfile dict/wn30/sons_v.txt --minfreq 0 --relation freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/freqmin5/freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --minfreq 5 --relation freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/freqmin5/freq/BLCverb --sonsfile dict/wn30/sons_v.txt --minfreq 5 --relation freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/freqmin10/freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --minfreq 10 --relation freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/freqmin10/freq/BLCverb --sonsfile dict/wn30/sons_v.txt --minfreq 10 --relation freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/freqmin20/freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --minfreq 20 --relation freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/freqmin20/freq/BLCverb --sonsfile dict/wn30/sons_v.txt --minfreq 20 --relation freq --sensefile dict/wn30/index.sense

python get-blc_lists.py --datafile dict/wn30/data.noun --outfile out/wn30/freqmin50/freq/BLCnoun --sonsfile dict/wn30/sons_n.txt --minfreq 50 --relation freq --sensefile dict/wn30/index.sense
python get-blc_lists.py --datafile dict/wn30/data.verb --outfile out/wn30/freqmin50/freq/BLCverb --sonsfile dict/wn30/sons_v.txt --minfreq 50 --relation freq --sensefile dict/wn30/index.sense

# Diferent minimum frequencies, WordNet 2.1, frequency
python get-blc_lists.py --datafile dict/wn21/data.noun --outfile out/wn21/sinfreqmin/freq/BLCnoun --sonsfile dict/wn21/sons_n.txt --minfreq 0 --relation freq --sensefile dict/wn21/index.sense
python get-blc_lists.py --datafile dict/wn21/data.verb --outfile out/wn21/sinfreqmin/freq/BLCverb --sonsfile dict/wn21/sons_v.txt --minfreq 0 --relation freq --sensefile dict/wn21/index.sense

python get-blc_lists.py --datafile dict/wn21/data.noun --outfile out/wn21/freqmin5/freq/BLCnoun --sonsfile dict/wn21/sons_n.txt --minfreq 5 --relation freq --sensefile dict/wn21/index.sense
python get-blc_lists.py --datafile dict/wn21/data.verb --outfile out/wn21/freqmin5/freq/BLCverb --sonsfile dict/wn21/sons_v.txt --minfreq 5 --relation freq --sensefile dict/wn21/index.sense

python get-blc_lists.py --datafile dict/wn21/data.noun --outfile out/wn21/freqmin10/freq/BLCnoun --sonsfile dict/wn21/sons_n.txt --minfreq 10 --relation freq --sensefile dict/wn21/index.sense
python get-blc_lists.py --datafile dict/wn21/data.verb --outfile out/wn21/freqmin10/freq/BLCverb --sonsfile dict/wn21/sons_v.txt --minfreq 10 --relation freq --sensefile dict/wn21/index.sense

python get-blc_lists.py --datafile dict/wn21/data.noun --outfile out/wn21/freqmin20/freq/BLCnoun --sonsfile dict/wn21/sons_n.txt --minfreq 20 --relation freq --sensefile dict/wn21/index.sense
python get-blc_lists.py --datafile dict/wn21/data.verb --outfile out/wn21/freqmin20/freq/BLCverb --sonsfile dict/wn21/sons_v.txt --minfreq 20 --relation freq --sensefile dict/wn21/index.sense

python get-blc_lists.py --datafile dict/wn21/data.noun --outfile out/wn21/freqmin50/freq/BLCnoun --sonsfile dict/wn21/sons_n.txt --minfreq 50 --relation freq --sensefile dict/wn21/index.sense
python get-blc_lists.py --datafile dict/wn21/data.verb --outfile out/wn21/freqmin50/freq/BLCverb --sonsfile dict/wn21/sons_v.txt --minfreq 50 --relation freq --sensefile dict/wn21/index.sense

# Diferent minimum frequencies, WordNet 2.0, frequency
python get-blc_lists.py --datafile dict/wn20/data.noun --outfile out/wn20/sinfreqmin/freq/BLCnoun --sonsfile dict/wn20/sons_n.txt --minfreq 0 --relation freq --sensefile dict/wn20/index.sense
python get-blc_lists.py --datafile dict/wn20/data.verb --outfile out/wn20/sinfreqmin/freq/BLCverb --sonsfile dict/wn20/sons_v.txt --minfreq 0 --relation freq --sensefile dict/wn20/index.sense

python get-blc_lists.py --datafile dict/wn20/data.noun --outfile out/wn20/freqmin5/freq/BLCnoun --sonsfile dict/wn20/sons_n.txt --minfreq 5 --relation freq --sensefile dict/wn20/index.sense
python get-blc_lists.py --datafile dict/wn20/data.verb --outfile out/wn20/freqmin5/freq/BLCverb --sonsfile dict/wn20/sons_v.txt --minfreq 5 --relation freq --sensefile dict/wn20/index.sense

python get-blc_lists.py --datafile dict/wn20/data.noun --outfile out/wn20/freqmin10/freq/BLCnoun --sonsfile dict/wn20/sons_n.txt --minfreq 10 --relation freq --sensefile dict/wn20/index.sense
python get-blc_lists.py --datafile dict/wn20/data.verb --outfile out/wn20/freqmin10/freq/BLCverb --sonsfile dict/wn20/sons_v.txt --minfreq 10 --relation freq --sensefile dict/wn20/index.sense

python get-blc_lists.py --datafile dict/wn20/data.noun --outfile out/wn20/freqmin20/freq/BLCnoun --sonsfile dict/wn20/sons_n.txt --minfreq 20 --relation freq --sensefile dict/wn20/index.sense
python get-blc_lists.py --datafile dict/wn20/data.verb --outfile out/wn20/freqmin20/freq/BLCverb --sonsfile dict/wn20/sons_v.txt --minfreq 20 --relation freq --sensefile dict/wn20/index.sense

python get-blc_lists.py --datafile dict/wn20/data.noun --outfile out/wn20/freqmin50/freq/BLCnoun --sonsfile dict/wn20/sons_n.txt --minfreq 50 --relation freq --sensefile dict/wn20/index.sense
python get-blc_lists.py --datafile dict/wn20/data.verb --outfile out/wn20/freqmin50/freq/BLCverb --sonsfile dict/wn20/sons_v.txt --minfreq 50 --relation freq --sensefile dict/wn20/index.sense

# Diferent minimum frequencies, WordNet 1.7.1, frequency
python get-blc_lists.py --datafile dict/wn171/data.noun --outfile out/wn171/sinfreqmin/freq/BLCnoun --sonsfile dict/wn171/sons_n.txt --minfreq 0 --relation freq --sensefile dict/wn171/index.sense
python get-blc_lists.py --datafile dict/wn171/data.verb --outfile out/wn171/sinfreqmin/freq/BLCverb --sonsfile dict/wn171/sons_v.txt --minfreq 0 --relation freq --sensefile dict/wn171/index.sense

python get-blc_lists.py --datafile dict/wn171/data.noun --outfile out/wn171/freqmin5/freq/BLCnoun --sonsfile dict/wn171/sons_n.txt --minfreq 5 --relation freq --sensefile dict/wn171/index.sense
python get-blc_lists.py --datafile dict/wn171/data.verb --outfile out/wn171/freqmin5/freq/BLCverb --sonsfile dict/wn171/sons_v.txt --minfreq 5 --relation freq --sensefile dict/wn171/index.sense

python get-blc_lists.py --datafile dict/wn171/data.noun --outfile out/wn171/freqmin10/freq/BLCnoun --sonsfile dict/wn171/sons_n.txt --minfreq 10 --relation freq --sensefile dict/wn171/index.sense
python get-blc_lists.py --datafile dict/wn171/data.verb --outfile out/wn171/freqmin10/freq/BLCverb --sonsfile dict/wn171/sons_v.txt --minfreq 10 --relation freq --sensefile dict/wn171/index.sense

python get-blc_lists.py --datafile dict/wn171/data.noun --outfile out/wn171/freqmin20/freq/BLCnoun --sonsfile dict/wn171/sons_n.txt --minfreq 20 --relation freq --sensefile dict/wn171/index.sense
python get-blc_lists.py --datafile dict/wn171/data.verb --outfile out/wn171/freqmin20/freq/BLCverb --sonsfile dict/wn171/sons_v.txt --minfreq 20 --relation freq --sensefile dict/wn171/index.sense

python get-blc_lists.py --datafile dict/wn171/data.noun --outfile out/wn171/freqmin50/freq/BLCnoun --sonsfile dict/wn171/sons_n.txt --minfreq 50 --relation freq --sensefile dict/wn171/index.sense
python get-blc_lists.py --datafile dict/wn171/data.verb --outfile out/wn171/freqmin50/freq/BLCverb --sonsfile dict/wn171/sons_v.txt --minfreq 50 --relation freq --sensefile dict/wn171/index.sense

# Diferent minimum frequencies, WordNet 1.7, frequency
python get-blc_lists.py --datafile dict/wn17/data.noun --outfile out/wn171/sinfreqmin/freq/BLCnoun --sonsfile dict/wn17/sons_n.txt --minfreq 0 --relation freq --sensefile dict/wn171/index.sense
python get-blc_lists.py --datafile dict/wn17/data.verb --outfile out/wn171/sinfreqmin/freq/BLCverb --sonsfile dict/wn17/sons_v.txt --minfreq 0 --relation freq --sensefile dict/wn171/index.sense

python get-blc_lists.py --datafile dict/wn17/data.noun --outfile out/wn171/freqmin5/freq/BLCnoun --sonsfile dict/wn17/sons_n.txt --minfreq 5 --relation freq --sensefile dict/wn171/index.sense
python get-blc_lists.py --datafile dict/wn17/data.verb --outfile out/wn171/freqmin5/freq/BLCverb --sonsfile dict/wn17/sons_v.txt --minfreq 5 --relation freq --sensefile dict/wn171/index.sense

python get-blc_lists.py --datafile dict/wn17/data.noun --outfile out/wn171/freqmin10/freq/BLCnoun --sonsfile dict/wn17/sons_n.txt --minfreq 10 --relation freq --sensefile dict/wn171/index.sense
python get-blc_lists.py --datafile dict/wn17/data.verb --outfile out/wn171/freqmin10/freq/BLCverb --sonsfile dict/wn17/sons_v.txt --minfreq 10 --relation freq --sensefile dict/wn171/index.sense

python get-blc_lists.py --datafile dict/wn17/data.noun --outfile out/wn171/freqmin20/freq/BLCnoun --sonsfile dict/wn17/sons_n.txt --minfreq 20 --relation freq --sensefile dict/wn171/index.sense
python get-blc_lists.py --datafile dict/wn17/data.verb --outfile out/wn171/freqmin20/freq/BLCverb --sonsfile dict/wn17/sons_v.txt --minfreq 20 --relation freq --sensefile dict/wn171/index.sense

python get-blc_lists.py --datafile dict/wn17/data.noun --outfile out/wn171/freqmin50/freq/BLCnoun --sonsfile dict/wn17/sons_n.txt --minfreq 50 --relation freq --sensefile dict/wn171/index.sense
python get-blc_lists.py --datafile dict/wn17/data.verb --outfile out/wn171/freqmin50/freq/BLCverb --sonsfile dict/wn17/sons_v.txt --minfreq 50 --relation freq --sensefile dict/wn171/index.sense

# Diferent minimum frequencies, WordNet 1.6, frequency
python get-blc_lists.py --datafile dict/wn16/data.noun --outfile out/wn16/sinfreqmin/freq/BLCnoun --sonsfile dict/wn16/sons_n.txt --minfreq 0 --relation freq --sensefile dict/wn16/index.sense
python get-blc_lists.py --datafile dict/wn16/data.verb --outfile out/wn16/sinfreqmin/freq/BLCverb --sonsfile dict/wn16/sons_v.txt --minfreq 0 --relation freq --sensefile dict/wn16/index.sense

python get-blc_lists.py --datafile dict/wn16/data.noun --outfile out/wn16/freqmin5/freq/BLCnoun --sonsfile dict/wn16/sons_n.txt --minfreq 5 --relation freq --sensefile dict/wn16/index.sense
python get-blc_lists.py --datafile dict/wn16/data.verb --outfile out/wn16/freqmin5/freq/BLCverb --sonsfile dict/wn16/sons_v.txt --minfreq 5 --relation freq --sensefile dict/wn16/index.sense

python get-blc_lists.py --datafile dict/wn16/data.noun --outfile out/wn16/freqmin10/freq/BLCnoun --sonsfile dict/wn16/sons_n.txt --minfreq 10 --relation freq --sensefile dict/wn16/index.sense
python get-blc_lists.py --datafile dict/wn16/data.verb --outfile out/wn16/freqmin10/freq/BLCverb --sonsfile dict/wn16/sons_v.txt --minfreq 10 --relation freq --sensefile dict/wn16/index.sense

python get-blc_lists.py --datafile dict/wn16/data.noun --outfile out/wn16/freqmin20/freq/BLCnoun --sonsfile dict/wn16/sons_n.txt --minfreq 20 --relation freq --sensefile dict/wn16/index.sense
python get-blc_lists.py --datafile dict/wn16/data.verb --outfile out/wn16/freqmin20/freq/BLCverb --sonsfile dict/wn16/sons_v.txt --minfreq 20 --relation freq --sensefile dict/wn16/index.sense

python get-blc_lists.py --datafile dict/wn16/data.noun --outfile out/wn16/freqmin50/freq/BLCnoun --sonsfile dict/wn16/sons_n.txt --minfreq 50 --relation freq --sensefile dict/wn16/index.sense
python get-blc_lists.py --datafile dict/wn16/data.verb --outfile out/wn16/freqmin50/freq/BLCverb --sonsfile dict/wn16/sons_v.txt --minfreq 50 --relation freq --sensefile dict/wn16/index.sense


