
Ponderate Synset Relations
=======

This script (synsetRelationsDB.py) work as folows. From a synset given recovery the categories that relationated synset's has in mcr and from ponderated categorization formula.

Download
-------

To download the code execute this command
```
svn export https://github.com/daniparera/MCR/trunk/ponderate
```

Requirements
-------

to execute ponderateSynsetRelationsDB.py required files:

* ponderateSynset.py (in repositories)
* infoVariantSynset.py (in repositories)
* xwndg.txt (in repositories)
* wei_eng-30_variant.tsv (in repositories)
* xwnd-30g/*.ppv (in http://adimen.si.ehu.es/web/files/XWND/xwnd-30g.tgz)

Issues (Requirements)
-------

To solve error 
```
ImportError: No module named pymysql
```
need to execute 
```
pip install --user pymysql
```
or
```
aptitude install python-pymysql
```

Description
-------

* synsetRelationsDB: calculate ponderated vectors of relations for specific synset, relations are extracted from MCR database
* ponderateSynset: calculate ponderated vectors, from a synset. Called from synsetRelationsDB.py and other files. CORE FILE
* ponderateListSynsets: calculate ponderated vectors, from a list of synsets (synsets.txt), maybe deprecated/older.

Encapsulated version
* synsetsWraped: calculate ponderated vectors for specific synset, calculate ponderated vectors for specific synset, relation information paremeter. MAIN FILE
* ponderateSynsetWraped.py: calculate ponderated vectors for specific synset
* synsetRelationsDBWraped: calculate ponderated vectors of relations for a list of synsets, relations are extracted from MCR database

Other files
* infoVariantSynsetTSV.py: get variant info for specific synset from TSV files.
* infoVariantSynsetDB.py: get variant info for specific synset from MCR database.
* findNoDomain: find synsets without assigned domain in ponderated result file (deprecated version, with threshold variation loop no assigned domain synsets exists)

Uses
-------

posible execution

```
python synsetsWraped.py --host adimen.si.ehu.es --db mcr9 --user guest --pwd guest --file synsets.txt [[--debug]] [[--variant]] [[--weka]] [[--relinfo]]
```

```
python synsetRelationsDB.py --host adimen.si.ehu.es --user guest --pwd guest --db mcr9 --synset 08559508-n [[--variant]] [[--relinfo]]
```

```
python synsetRelationsDBWraped.py --host adimen.si.ehu.es --db mcr9 --user guest --pwd guest --file synsets.txt [[--debug]] [[--variant]] [[--weka]]
```

to show helpful information
```
python ponderateSynsetRelationsDB.py --help
```

output format
-------

* factotum$atomic_physic (mcr category $ ponderate category)
* 00674270-a$61$s (synset $ relation $ position:source or target)
* Variants: homemade_1 (variant information of relation)
