Scripts to create BLC information from MCR db
=======

Tools to generate SQL sentence with BLC datasets and MCR database.

Download
-------

Download code executing...
```
svn export https://github.com/daniparera/MCR/trunk/BLC/generateSQL/
```

Requirements
-------

Datasets in data folder are from 'out/wn30/freqmin20/all/', freq 20 all.


Run buildBLC.py
-------

This script (buildBLC.py) work as folows. Get all information related with BLC from MCR and construct a file with the same structure than files presents in BLC zip file.

To get nouns BLC list execute script...
```
python buildBLC.py --host adimen.si.ehu.es --db mcr9 --user guest --pwd guest --pos n > data/BLCnounSript.list
```

To get verb BLC list execute script...
```
python buildBLC.py --host adimen.si.ehu.es --db mcr9 --user guest --pwd guest --pos v > data/BLCverbSript.list
```

To compare list execute command...
```
comm data/BLCnounSript.list data/BLCnoun.list -3
```
for verbs...
```
comm data/BLCverbSript.list data/BLCverb.list -3
```

```
  comm -12 FILE1 FILE2    show lines present in both files.
  comm -3  FILE1 FILE2    show lines from FILE1 that are not present in FILE2 (and vice versa).
```

or with diff
```
diff data/BLCverbSript.list data/BLCverb.list
```

Run sqlBLC.py
-------

To generate sql data from BLC datasets that would be stored in sql folder...
```
python sqlBLC.py
```

Get information from files 'data/BLCnoun.rel' and 'data/BLCverb.rel' and stored output information in 'sql/data.tsv'. in file 'sql/structure.sql' are the structure of new table ili_to_blc. Recomended to use mysql terminal to load data.
