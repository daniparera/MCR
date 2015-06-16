Scripts to check MCR with OMW datasets
=======

This script (checkOMW.py) work as folows. Get all information in OMW file related with synsets and word from MCR.
This script (buildUpdateOMW.py) work as folows. Construct a sql file to update CS in MCR.

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
