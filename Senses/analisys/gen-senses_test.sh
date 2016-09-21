#!/bin/bash

python3 ../calculateSenses.py --log_files simple --weight all --datafile ../data/data --glossfile ../data/gloss.rel --sensefile ../data/index.sense --host adimen.si.ehu.es --user guest --pwd guest --db mcr9  --language eus-30 --language eng-30 --language cat-30 --language glg-30  --language por-30 --language spa-30 --outdir ../out/senses

python3 ../calculateSenses.py --log_files simple --weight gloss --datafile ../data/data --glossfile ../data/gloss.rel --sensefile ../data/index.sense --host adimen.si.ehu.es --user guest --pwd guest --db mcr9  --language eus-30 --language eng-30 --language cat-30 --language glg-30  --language por-30 --language spa-30 --outdir ../out/senses

python3 ../calculateSenses.py --log_files simple --weight freq --datafile ../data/data --glossfile ../data/gloss.rel --sensefile ../data/index.sense --host adimen.si.ehu.es --user guest --pwd guest --db mcr9  --language eus-30 --language eng-30 --language cat-30 --language glg-30  --language por-30 --language spa-30 --outdir ../out/senses

python3 ../calculateSenses.py --log_files simple --weight all+gloss --datafile ../data/data --glossfile ../data/gloss.rel --sensefile ../data/index.sense --host adimen.si.ehu.es --user guest --pwd guest --db mcr9  --language eus-30 --language eng-30 --language cat-30 --language glg-30  --language por-30 --language spa-30 --outdir ../out/senses

python3 ../calculateSenses.py --log_files simple --weight all+freq --datafile ../data/data --glossfile ../data/gloss.rel --sensefile ../data/index.sense --host adimen.si.ehu.es --user guest --pwd guest --db mcr9  --language eus-30 --language eng-30 --language cat-30 --language glg-30  --language por-30 --language spa-30 --outdir ../out/senses

python3 ../calculateSenses.py --log_files simple --weight gloss+freq --datafile ../data/data --glossfile ../data/gloss.rel --sensefile ../data/index.sense --host adimen.si.ehu.es --user guest --pwd guest --db mcr9  --language eus-30 --language eng-30 --language cat-30 --language glg-30  --language por-30 --language spa-30 --outdir ../out/senses

python3 ../calculateSenses.py --log_files simple --weight all+gloss+freq --datafile ../data/data --glossfile ../data/gloss.rel --sensefile ../data/index.sense --host adimen.si.ehu.es --user guest --pwd guest --db mcr9  --language eus-30 --language eng-30 --language cat-30 --language glg-30  --language por-30 --language spa-30 --outdir ../out/senses

python3 stability.py --inputdir ../out/senses

./plot.sh
