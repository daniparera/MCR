Scripts to check MCR with OMW datasets
=======

Scripts to work with OMW datasets

Download
-------

Download code executing...
```
svn export https://github.com/daniparera/MCR/trunk/OMW
```

Requirements
-------

Datasets are from
```
http://compling.hss.ntu.edu.sg/omw/wn-wikt.tgz
```

Execution
-------

buildUpdateOMW.py construct a sql file to update CS in MCR. The cases presents in app are:

1) Assigned synset-variant to MCR with csco=99 and also in XOMW => nothing to do in MCR
2) Assigned synset-variant to MCR with csco=49 and also in XOMW => modify in MCR csco=99
3) Assigned synset-variant to MCR with csco<99 and csco>49 and also in XOMW => modify in MCR csco=94 (csco in XOMW)
4) Not present in MCR, new assigned synset-variant in XOMW => add new variant-synset with csco=94 (el csco del XOMW) and put correct sense (sense greater (+1) than last sense)

Others scripts...

checkOMW.py get all information in OMW file related with synsets and word from MCR.
buildUpdateOMW.py construct a sql file to update CS in MCR.

To run checkOMW.py, a posible command can be:

```
python checkOMW.py --host adimen.si.ehu.es --db mcr9 --user guest --pwd guest --t cldr
```

To run buildUpdateOMW.py, a posible command can be:

```
python buildUpdateOMW.py --host adimen.si.ehu.es --db mcr9 --user guest --pwd guest
```

Both scripts have posibility to show some help...

```
python buildUpdateOMW.py --help
```

```
python checkOMW.py -h
```

More Information
-------

Additional information can be found in...

```
http://compling.hss.ntu.edu.sg/omw/summx.html
```
