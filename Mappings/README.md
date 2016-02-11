Scripts to check MCR with diferents datasets
=======

This scripts are used to add synset-variant datasets in MCR.

* createMatrix.py: Extract synset-variant-csco tuple from MCR and put it in matrix format.
* updateMatrix.py: Update matrix information, for each dataset add a column with confidence level.
* exportMCR.py   : Construct SQL sentences to update MCR from matrix information.

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

The format is a space separated file with tree values: 
* Synset in the first column
* Word in second column. The word format is without space, underscore replace blanck spaces.
* Confidence score in the third and last column. 

Behaviour
-------

updateMatrix.py <br />

extract information from lexicon and put in new column in the synset-word matrix. For each synset-word tuple present in original matrix search in lexicon: 

* if not find it, create a new row with csco equal to -1. 
* if find it, store in the new column the confidence score, if csco for this case is a negative value (case not find in other lexicon and created new row) decrease value in -1. 

exportMCR.py <br />
construct a sql file to update CS in MCR. The cases presents in app are:

* Assigned synset-variant to MCR with csco=99 and also in some dataset => nothing to do in MCR
* Assigned synset-variant to MCR with csco<99 and csco>49 and also in some dataset => modify in MCR with csco equal to most relevant dataset, confidence level greater
* Assigned synset-variant to MCR with csco=49 and also in some dataset => modify in MCR csco=99
* Not present in MCR, new assigned synset-variant in more than one dataset => add new variant-synset with csco=94 (csco in XOMW) and put correct sense (sense greater (+1) than last sense)
* Not present in MCR, new assigned synset-variant in only one dataset => add new variant-synset with csco=XX (the correspondence between dataset and csco is explained in table below) and put correct sense (sense greater (+1) than last sense)

41 : EOWN-cldr<br />
42 : EOWN-wikt<br />
43 : UWN<br />
44 : PM<br />
45 : torevise<br />
46 : babelnet


Execution
-------

Posible execution are store in calculateMatrix_DB.sh and calculateMatrix_noDB.sh files.

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
