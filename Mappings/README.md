Scripts to check MCR with diferents datasets
=======

This scripts are used to add synset-variant datasets in MCR.

createMatrix.py: Extract synset-variant-csco from MCR and put it in matrix format. <br />
updateMatrix.py: Update matrix information, for each dataset add a column with confidence level. <br />
exportMCR.py     Construct SQL sentences to update MCR.

Download
-------

Download code executing...
```
svn export https://github.com/daniparera/MCR/trunk/Mappings
```

Requirements and Formats
-------

Datasets are from
```
http://compling.hss.ntu.edu.sg/omw/wn-wikt.tgzç
http://resources.mpi-inf.mpg.de/yago-naga/uwn/uwn_tsv.zip

```

To execute properly the updateMatrix.py script is necessary that datasets contain data structuret in certain format.

The format is synset in the first column, word in second column and in the third and last column the confidence score. The word format is without blank space between elements. 

Behaviour
-------

exportMCR.py construct a sql file to update CS in MCR. The cases presents in app are:

* Assigned synset-variant to MCR with csco=99 and also in some dataset => nothing to do in MCR
* Assigned synset-variant to MCR with csco<99 and csco>49 and also in some dataset => modify in MCR with csco equal to most relevant dataset, confidence level greater
* Assigned synset-variant to MCR with csco=49 and also in some dataset => modify in MCR csco=99
* Not present in MCR, new assigned synset-variant in more than one dataset => add new variant-synset with csco=94 (csco in XOMW) and put correct sense (sense greater (+1) than last sense)
* Not present in MCR, new assigned synset-variant in only one dataset => add new variant-synset with csco=XX (the correspondence between dataset and csco is explained in table below) and put correct sense (sense greater (+1) than last sense)

41 : EOWN-cldr
42 : EOWN-wikt
43 : UWN
44 : PM
45 : torevise


Execution
-------

Some posible execution are....

```
python createMatrix.py --host adimen.si.ehu.es --user guest --pwd guest --db mcr9

python updateMatrix.py --file_matrix out/matrix-eus-30_0.tab --file_lexicon data/wn-cldr-eus.tab --new_field_name cldr
python updateMatrix.py --file_matrix out/matrix-eus-30_1.tab --file_lexicon data/wn-wikt-eus.tab --new_field_name wikt
python updateMatrix.py --file_matrix out/matrix-eus-30_2.tab --file_lexicon data/uwn-eus.txt --new_field_name UWN
python updateMatrix.py --file_matrix out/matrix-eus-30_2.tab --file_lexicon data/VariantsFromPM_eus.txt --new_field_name PM

python updateMatrix.py --file_matrix out/matrix-eng-30_0.tab --file_lexicon data/wn-cldr-eng.tab --new_field_name cldr
python updateMatrix.py --file_matrix out/matrix-eng-30_1.tab --file_lexicon data/wn-wikt-eng.tab --new_field_name wikt
python updateMatrix.py --file_matrix out/matrix-eng-30_2.tab --file_lexicon data/uwn-eng.txt --new_field_name UWN
python updateMatrix.py --file_matrix out/matrix-eng-30_2.tab --file_lexicon data/VariantsFromPM_eng.txt --new_field_name PM


python updateMatrix.py --file_matrix out/matrix-spa-30_0.tab --file_lexicon data/wn-cldr-spa.tab --new_field_name cldr
python updateMatrix.py --file_matrix out/matrix-spa-30_1.tab --file_lexicon data/wn-wikt-spa.tab --new_field_name wikt
python updateMatrix.py --file_matrix out/matrix-spa-30_2.tab --file_lexicon data/uwn-spa.txt --new_field_name UWN
python updateMatrix.py --file_matrix out/matrix-spa-30_2.tab --file_lexicon data/VariantsFromPM_spa.txt --new_field_name PM

python updateMatrix.py --file_matrix out/matrix-cat-30_0.tab --file_lexicon data/wn-cldr-cat.tab --new_field_name cldr
python updateMatrix.py --file_matrix out/matrix-cat-30_1.tab --file_lexicon data/wn-wikt-cat.tab --new_field_name wikt
python updateMatrix.py --file_matrix out/matrix-cat-30_2.tab --file_lexicon data/uwn-cat.txt --new_field_name UWN
python updateMatrix.py --file_matrix out/matrix-cat-30_2.tab --file_lexicon data/VariantsFromPM_cat.txt --new_field_name PM

python updateMatrix.py --file_matrix out/matrix-glg-30_0.tab --file_lexicon data/wn-cldr-glg.tab --new_field_name cldr
python updateMatrix.py --file_matrix out/matrix-glg-30_1.tab --file_lexicon data/wn-wikt-glg.tab --new_field_name wikt
python updateMatrix.py --file_matrix out/matrix-glg-30_2.tab --file_lexicon data/uwn-glg.txt --new_field_name UWN
python updateMatrix.py --file_matrix out/matrix-glg-30_2.tab --file_lexicon data/VariantsFromPM_glg.txt --new_field_name PM

python updateMatrix.py --file_matrix out/matrix-por-30_0.tab --file_lexicon data/wn-cldr-por.tab --new_field_name cldr
python updateMatrix.py --file_matrix out/matrix-por-30_1.tab --file_lexicon data/wn-wikt-por.tab --new_field_name wikt
python updateMatrix.py --file_matrix out/matrix-por-30_2.tab --file_lexicon data/uwn-por.txt --new_field_name UWN

```

Load in MCR
-------

To load the sql datasets... Where "database" is the target database
```
mysql database -u root -p < updateCS.sql
```

More Information
-------

Additional information can be found in...

```
http://compling.hss.ntu.edu.sg/omw/summx.html
https://www.mpi-inf.mpg.de/departments/databases-and-information-systems/research/yago-naga/uwn/
```
