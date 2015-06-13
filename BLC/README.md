Scripts to create BLC from MCR db
=======

This script (buildBLC.py) work as folows. From a synset given recovery the categories that relationated synset's has in mcr and from ponderated categorization formula.

Download
-------

Download code executing...
```
svn export https://github.com/daniparera/MCR/trunk/BLC
```

Requirements
-------

Datasets are from
```
http://adimen.si.ehu.es/web/files/BLC/Wordnet-3.0.tar.gz
```

Run
-------

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

