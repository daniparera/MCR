Scripts to generate BLCs
=======

Tools to work with BLC datasets and MCR database.

Download
-------

Download code executing...
```
svn export https://github.com/daniparera/MCR/trunk/BLC
```

Requirements
-------

Dict datasets from Princeton WordNet web.
```
https://wordnet.princeton.edu/wordnet/download/
```

...or to easy and quickly use download already generated...

```
http://adimen.si.ehu.es/web/files/BLC-2016/dict.tar.gz
```


Script's execution
-------

Script gen-blcs.sh work as folows:

To get nouns and verbs BLC lists execute script...
```
./get-blcs.sh
```

To generate blcs from Princeton WorNet 3.0 you must execute:
```
python get-blc.py --datafile dict/wn30/data.noun --outfile data/BLCnoun --sonsfile dict/wn30/sons_n.txt --minfreq 20 --relation all
```

To get sons from a Princeton WordNet 3.0 you must execute:
```
python calc_sons_wordnet.py --file dict/wn30/data.noun --outfile dict/wn30/sons_n.txt
```

To verify that one synset has correct blcs assigned, we can use show_synset_tree-blc.py to see if all is correct:
```
python tree-blc.py --blcsfile out/wn30/freqmin20/all/BLCnoun --sonsfile dict/wn30/sons_n.txt --infile dict/wn30/data.noun --select 00001740-n
```

To generate SQL for MCR:
```
python sqlBLC.py --inputfiles wn30/freqmin20/all/BLCnoun --inputfiles wn30/freqmin20/all/BLCverb
```

