#!/bin/bash

python3 extractMCR.py --host adimen.si.ehu.es --user user --pwd pwd --db mcr9 --tb wei_ili_record --f iliOffset --outfile ilis.txt

python3 extractMCR.py --host adimen.si.ehu.es --user user --pwd pwd --db mcr9 --tb wei_cat-30_to_ili --f iliOffset --outfile ilis.cat
comm -3 ilis.txt ilis.cat

python3 extractMCR.py --host adimen.si.ehu.es --user user --pwd pwd --db mcr9 --tb wei_cat-30_to_ili --f offset --outfile syn.cat
python3 extractMCR.py --host adimen.si.ehu.es --user user --pwd pwd --db mcr9 --tb wei_cat-30_synset --f offset --outfile syn_synset.cat
comm -3 syn_synset.cat syn.cat

python3 extractMCR.py --host adimen.si.ehu.es --user user --pwd pwd --db mcr9 --tb wei_eng-30_to_ili --f iliOffset --outfile ilis.eng
comm -3 ilis.txt ilis.eng

python3 extractMCR.py --host adimen.si.ehu.es --user user --pwd pwd --db mcr9 --tb wei_eng-30_to_ili --f offset --outfile syn.eng
python3 extractMCR.py --host adimen.si.ehu.es --user user --pwd pwd --db mcr9 --tb wei_eng-30_synset --f offset --outfile syn_synset.eng
comm -3 syn_synset.eng syn.eng

python3 extractMCR.py --host adimen.si.ehu.es --user user --pwd pwd --db mcr9 --tb wei_eus-30_to_ili --f iliOffset --outfile ilis.eus
comm -3 ilis.txt ilis.eus

python3 extractMCR.py --host adimen.si.ehu.es --user user --pwd pwd --db mcr9 --tb wei_eus-30_to_ili --f offset --outfile syn.eus
python3 extractMCR.py --host adimen.si.ehu.es --user user --pwd pwd --db mcr9 --tb wei_eus-30_synset --f offset --outfile syn_synset.eus
comm -3 syn_synset.eus syn.eus

python3 extractMCR.py --host adimen.si.ehu.es --user user --pwd pwd --db mcr9 --tb wei_glg-30_to_ili --f iliOffset --outfile ilis.glg
comm -3 ilis.txt ilis.glg

python3 extractMCR.py --host adimen.si.ehu.es --user user --pwd pwd --db mcr9 --tb wei_glg-30_to_ili --f offset --outfile syn.glg
python3 extractMCR.py --host adimen.si.ehu.es --user user --pwd pwd --db mcr9 --tb wei_glg-30_synset --f offset --outfile syn_synset.glg
comm -3 syn_synset.glg syn.glg

python3 extractMCR.py --host adimen.si.ehu.es --user user --pwd pwd --db mcr9 --tb wei_por-30_to_ili --f iliOffset --outfile ilis.por
comm -3 ilis.txt ilis.por

python3 extractMCR.py --host adimen.si.ehu.es --user user --pwd pwd --db mcr9 --tb wei_por-30_to_ili --f offset --outfile syn.por
python3 extractMCR.py --host adimen.si.ehu.es --user user --pwd pwd --db mcr9 --tb wei_por-30_synset --f offset --outfile syn_synset.por
comm -3 syn_synset.por syn.por

python3 extractMCR.py --host adimen.si.ehu.es --user user --pwd pwd --db mcr9 --tb wei_spa-30_to_ili --f iliOffset --outfile ilis.spa
comm -3 ilis.txt ilis.spa

python3 extractMCR.py --host adimen.si.ehu.es --user user --pwd pwd --db mcr9 --tb wei_spa-30_to_ili --f offset --outfile syn.spa
python3 extractMCR.py --host adimen.si.ehu.es --user user --pwd pwd --db mcr9 --tb wei_spa-30_synset --f offset --outfile syn_synset.spa
comm -3 syn_synset.spa syn.spa
