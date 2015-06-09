
ponderateSynsetRelationsDB.py

# Requirements

to execute ponderateSynsetRelationsDB.py required files:

ponderateSynset.py (in repositories)
infoVariantSynset.py (in repositories)
xwndg.txt (in repositories)
wei_eng-30_variant.tsv (in repositories)
xwnd-30g/*.ppv (in http://adimen.si.ehu.es/web/files/XWND/xwnd-30g.tgz)

# Issues 

To solve error "ImportError: No module named pymysql" 
need to execute "pip install --user pymysql"

posible execution
$ python ponderateSynsetRelationsDB.py --host adimen.si.ehu.es --user guest --pwd guest --db mcr9 --synset 08559508-n [[--variant]] [[--relinfo]]

to show helpful information
$ python ponderateSynsetRelationsDB.py --help

# output format

ponderate category $ mcr category

factotum$atomic_physic

synset $ relation $ position:source or target

00674270-a$61$s 

variant information of relation

Variants: homemade_1
