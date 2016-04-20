Scripts to check MCR with diferents datasets
=======

This scripts are used to add synset-variant datasets in MCR.

* createMatrix.py: Extract synset-variant-CSCO tuple from MCR and put it in matrix format.
* updateMatrix.py: Update matrix information, for each dataset add a column with confidence level.
* extractMatrixtoMCR.py : Construct SQL sentences to update MCR from matrix information.

Additional scripts for another tasks.

* statsSynsetsVariants.py : extract information from MCR about Synsets and Glosses and some useful stats.

Download
-------

Download code executing...
```
svn export https://github.com/daniparera/MCR/trunk/Mappings
```

Requirements and Formats
-------

Recommended Python version 3. Codification issues... 

Datasets are from
```
http://compling.hss.ntu.edu.sg/omw/wn-wikt.tgz
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

Extract information from lexicon and put in new column in the synset-word matrix. For each synset-word tuple present in original matrix search in lexicon: 

* if not find it, create a new row with CSCO equal to -1. 
* if find it, store in the new column the confidence score, if CSCO for this case is a negative value (case not find in other lexicon and created new row) decrease value in -1. 

extractMatrixtoMCR.py <br />

In the next part present a posible behaviour to export data from previously created matrix, depending on the requeriments can change this behaviour to adapt at your own system. The result of this final step is construct a sql file to update CSCO in MCR. The cases presents in app are this:

* Assigned synset-variant to MCR with CSCO=99 => nothing to do.
* Assigned synset-variant to MCR with CSCO<99 and CSCO>49 and also in some dataset or language => modify in MCR with CSCO=99. Else, nothing to do.
* Assigned synset-variant to MCR with CSCO<49 and CSCO>0 and also in some dataset or language => modify in MCR CSCO=99. Otherwise, nothing to do.
* Not present in MCR, new assigned synset-variant in more than one dataset => add new variant-synset with CSCO=99 and put correct sense (sense greater (+1) than last sense)
* Not present in MCR, new assigned synset-variant in only one dataset => add new variant-synset with CSCO=XX (a posible codification, the correspondence between dataset and CSCO is explained in table below) and put correct sense (sense greater (+1) than last sense). This assignation of CSCO can be optional and we can't introduce this synset-variant tuple in MCR.

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
