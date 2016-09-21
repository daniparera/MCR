#!/bin/bash

# mcr9.0/AdimenSUMO

python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_ili_to_sumo --outfile mcr9.0/AdimenSUMO/wei_ili_to_sumo.tsv
python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_sumo_relations --outfile mcr9.0/AdimenSUMO/wei_sumo_relations.tsv

# mcr9.0/BLC

python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_ili_to_blc --outfile mcr9.0/BLC/wei_ili_to_blc.tsv

# mcr9.0/data

python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_ili_record --outfile mcr9.0/data/wei_ili_record.tsv --f iliOffset --f iliPos --f iliWnId --f semf --f instance
python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_lexnames --outfile mcr9.0/data/wei_lexnames.tsv
python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_relations --outfile mcr9.0/data/wei_relations.tsv
python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_relations_group --outfile mcr9.0/data/wei_relations_group.tsv

# mcr9.0/Domains

python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_domains --outfile mcr9.0/Domains/wei_domains.tsv
python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_ili_to_domains --outfile mcr9.0/Domains/wei_ili_to_domains.tsv

# mcr9.0/Marks

python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb mark_values_synset --outfile mcr9.0/Marks/mark_values_synset.tsv
python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb mark_values_variant --outfile mcr9.0/Marks/mark_values_variant.tsv

# mcr9.0/TopOntology

python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_ili_to_to --outfile mcr9.0/TopOntology/wei_ili_to_to.tsv
python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_to_record --outfile mcr9.0/TopOntology/wei_to_record.tsv
python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_to_relations --outfile mcr9.0/TopOntology/wei_to_relations.tsv

# mcr9.0/catWN

python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_cat-30_examples --outfile mcr9.0/catWN/wei_cat-30_examples.tsv
python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_cat-30_relation --outfile mcr9.0/catWN/wei_cat-30_relation.tsv
python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_cat-30_synset --outfile mcr9.0/catWN/wei_cat-30_synset.tsv --f offset --f pos --f sons --f status --f lexical --f instance --f gloss --f level --f levelFromTop --f mark
python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_cat-30_to_ili --outfile mcr9.0/catWN/wei_cat-30_to_ili.tsv
python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_cat-30_variant --outfile mcr9.0/catWN/wei_cat-30_variant.tsv --f word --f sense --f offset --f pos --f csco --f experiment --f mark --where_k csco --where_v 49 --where_c ">"

# mcr9.0/spaWN

python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_spa-30_examples --outfile mcr9.0/spaWN/wei_spa-30_examples.tsv
python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_spa-30_relation --outfile mcr9.0/spaWN/wei_spa-30_relation.tsv
python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_spa-30_synset --outfile mcr9.0/spaWN/wei_spa-30_synset.tsv --f offset --f pos --f sons --f status --f lexical --f instance --f gloss --f level --f levelFromTop --f mark
python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_spa-30_to_ili --outfile mcr9.0/spaWN/wei_spa-30_to_ili.tsv
python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_spa-30_variant --outfile mcr9.0/spaWN/wei_spa-30_variant.tsv --f word --f sense --f offset --f pos --f csco --f experiment --f mark --where_k csco --where_v 49 --where_c ">"

# mcr9.0/eusWN

python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_eus-30_examples --outfile mcr9.0/eusWN/wei_eus-30_examples.tsv
python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_eus-30_relation --outfile mcr9.0/eusWN/wei_eus-30_relation.tsv
python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_eus-30_synset --outfile mcr9.0/eusWN/wei_eus-30_synset.tsv --f offset --f pos --f sons --f status --f lexical --f instance --f gloss --f level --f levelFromTop --f mark
python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_eus-30_to_ili --outfile mcr9.0/eusWN/wei_eus-30_to_ili.tsv
python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_eus-30_variant --outfile mcr9.0/eusWN/wei_eus-30_variant.tsv --f word --f sense --f offset --f pos --f csco --f experiment --f mark --where_k csco --where_v 49 --where_c ">"

# mcr9.0/engWN

python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_eng-30_examples --outfile mcr9.0/engWN/wei_eng-30_examples.tsv
python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_eng-30_relation --outfile mcr9.0/engWN/wei_eng-30_relation.tsv
python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_eng-30_synset --outfile mcr9.0/engWN/wei_eng-30_synset.tsv --f offset --f pos --f sons --f status --f lexical --f instance --f gloss --f level --f levelFromTop --f mark
python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_eng-30_to_ili --outfile mcr9.0/engWN/wei_eng-30_to_ili.tsv
python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_eng-30_variant --outfile mcr9.0/engWN/wei_eng-30_variant.tsv --f word --f sense --f offset --f pos --f csco --f experiment --f mark --where_k csco --where_v 49 --where_c ">"

# mcr9.0/glgWN

python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_glg-30_examples --outfile mcr9.0/glgWN/wei_glg-30_examples.tsv
python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_glg-30_relation --outfile mcr9.0/glgWN/wei_glg-30_relation.tsv
python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_glg-30_synset --outfile mcr9.0/glgWN/wei_glg-30_synset.tsv --f offset --f pos --f sons --f status --f lexical --f instance --f gloss --f level --f levelFromTop --f mark
python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_glg-30_to_ili --outfile mcr9.0/glgWN/wei_glg-30_to_ili.tsv
python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_glg-30_variant --outfile mcr9.0/glgWN/wei_glg-30_variant.tsv --f word --f sense --f offset --f pos --f csco --f experiment --f mark --where_k csco --where_v 49 --where_c ">"

# mcr9.0/porWN

python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_por-30_examples --outfile mcr9.0/porWN/wei_por-30_examples.tsv
python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_por-30_relation --outfile mcr9.0/porWN/wei_por-30_relation.tsv
python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_por-30_synset --outfile mcr9.0/porWN/wei_por-30_synset.tsv --f offset --f pos --f sons --f status --f lexical --f instance --f gloss --f level --f levelFromTop --f mark
python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_por-30_to_ili --outfile mcr9.0/porWN/wei_por-30_to_ili.tsv
python3 extractMCR.py --host HOST --user USER --pwd GUEST --db DATABASE --tb wei_por-30_variant --outfile mcr9.0/porWN/wei_por-30_variant.tsv --f word --f sense --f offset --f pos --f csco --f experiment --f mark --where_k csco --where_v 49 --where_c ">"


