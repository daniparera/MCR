#!/bin/bash

#Res=$(awk "BEGIN {printf \"%.4f\",$Cls/$R}")
#Res=$(echo "$Cls/$R" | bc -l)
#Res=$(bc -l <<< "$Cls/$R")

./analisys.sh > analisys_global.txt

./analisys_sp_nouns.sh 05 > analisys_sp05_animals.txt
./analisys_sp_nouns.sh 13 > analisys_sp13_food.txt
./analisys_sp_nouns.sh 20 > analisys_sp20_animals.txt


./analisys_sp_verbs.sh 41 > analisys_sp41_social.txt
./analisys_sp_verbs.sh 43 > analisys_sp43_weather.txt

#echo sons,A vs G "/" A,A vs F "/" A,A vs A+G "/" A,A vs A+F "/" A,A vs G+F "/" A,A vs A+G+F "/" A,A vs G "/" G,G vs F "/" G,G vs A+G "/" G,G vs A+F "/" G,G vs G+F "/" G,G vs A+G+F "/" G,A vs F "/" F,G vs F "/" F,F vs A+G "/" F,F vs A+F "/" F,F vs G+F "/" F,F vs A+G+F "/" F,A vs A+G "/" A+G,G vs A+G "/" A+G,F vs A+G "/" A+G,A+G vs A+F "/" A+G,A+G vs G+F "/" A+G,A+G vs A+G+F "/" A+G,A vs A+F "/" A+F,G vs A+F "/" A+F,F vs A+F "/" A+F,A+G vs A+F "/" A+F,A+F vs G+F "/" A+F,A+F vs A+G+F "/" A+F,A vs G+F "/" G+F,G vs G+F "/" G+F,F vs G+F "/" G+F,A+G vs G+F "/" G+F,A+F vs G+F "/" G+F,G+F vs A+G+F "/" G+F,A vs A+G+F "/" A+G+F,G vs A+G+F "/" A+G+F,F vs A+G+F "/" A+G+F,A+F vs A+G+F "/" A+G+F,A+G vs A+G+F "/" A+G+F,G+F vs A+G+F "/" A+G+F > stability_noun_rel.csv
#
#./stability_rel.sh 0 noun >> stability_noun_rel.csv
#./stability_rel.sh 5 noun >> stability_noun_rel.csv
#./stability_rel.sh 10 noun >> stability_noun_rel.csv
#./stability_rel.sh 15 noun >> stability_noun_rel.csv
#./stability_rel.sh 20 noun >> stability_noun_rel.csv
#./stability_rel.sh 25 noun >> stability_noun_rel.csv
#./stability_rel.sh 30 noun >> stability_noun_rel.csv
#./stability_rel.sh 35 noun >> stability_noun_rel.csv
#./stability_rel.sh 40 noun >> stability_noun_rel.csv
#./stability_rel.sh 45 noun >> stability_noun_rel.csv
#./stability_rel.sh 50 noun >> stability_noun_rel.csv
#./stability_rel.sh 55 noun >> stability_noun_rel.csv
#./stability_rel.sh 60 noun >> stability_noun_rel.csv
#./stability_rel.sh 65 noun >> stability_noun_rel.csv
#./stability_rel.sh 70 noun >> stability_noun_rel.csv
#./stability_rel.sh 75 noun >> stability_noun_rel.csv
#./stability_rel.sh 80 noun >> stability_noun_rel.csv
#./stability_rel.sh 85 noun >> stability_noun_rel.csv
#./stability_rel.sh 90 noun >> stability_noun_rel.csv
#./stability_rel.sh 95 noun >> stability_noun_rel.csv
#./stability_rel.sh 100 noun >> stability_noun_rel.csv
#
#echo sons,A vs G "/" A,A vs F "/" A,A vs A+G "/" A,A vs A+F "/" A,A vs G+F "/" A,A vs A+G+F "/" A,A vs G "/" G,G vs F "/" G,G vs A+G "/" G,G vs A+F "/" G,G vs G+F "/" G,G vs A+G+F "/" G,A vs F "/" F,G vs F "/" F,F vs A+G "/" F,F vs A+F "/" F,F vs G+F "/" F,F vs A+G+F "/" F,A vs A+G "/" A+G,G vs A+G "/" A+G,F vs A+G "/" A+G,A+G vs A+F "/" A+G,A+G vs G+F "/" A+G,A+G vs A+G+F "/" A+G,A vs A+F "/" A+F,G vs A+F "/" A+F,F vs A+F "/" A+F,A+G vs A+F "/" A+F,A+F vs G+F "/" A+F,A+F vs A+G+F "/" A+F,A vs G+F "/" G+F,G vs G+F "/" G+F,F vs G+F "/" G+F,A+G vs G+F "/" G+F,A+F vs G+F "/" G+F,G+F vs A+G+F "/" G+F,A vs A+G+F "/" A+G+F,G vs A+G+F "/" A+G+F,F vs A+G+F "/" A+G+F,A+F vs A+G+F "/" A+G+F,A+G vs A+G+F "/" A+G+F,G+F vs A+G+F "/" A+G+F > stability_verb_rel.csv
#
#./stability_rel.sh 0 verb >> stability_verb_rel.csv
#./stability_rel.sh 5 verb >> stability_verb_rel.csv
#./stability_rel.sh 10 verb >> stability_verb_rel.csv
#./stability_rel.sh 15 verb >> stability_verb_rel.csv
#./stability_rel.sh 20 verb >> stability_verb_rel.csv
#./stability_rel.sh 25 verb >> stability_verb_rel.csv
#./stability_rel.sh 30 verb >> stability_verb_rel.csv
#./stability_rel.sh 35 verb >> stability_verb_rel.csv
#./stability_rel.sh 40 verb >> stability_verb_rel.csv
#./stability_rel.sh 45 verb >> stability_verb_rel.csv
#./stability_rel.sh 50 verb >> stability_verb_rel.csv
#./stability_rel.sh 55 verb >> stability_verb_rel.csv
#./stability_rel.sh 60 verb >> stability_verb_rel.csv
#./stability_rel.sh 65 verb >> stability_verb_rel.csv
#./stability_rel.sh 70 verb >> stability_verb_rel.csv
#./stability_rel.sh 75 verb >> stability_verb_rel.csv
#./stability_rel.sh 80 verb >> stability_verb_rel.csv
#./stability_rel.sh 85 verb >> stability_verb_rel.csv
#./stability_rel.sh 90 verb >> stability_verb_rel.csv
#./stability_rel.sh 95 verb >> stability_verb_rel.csv
#./stability_rel.sh 100 verb >> stability_verb_rel.csv
#
#
#echo sons,A vs G "/" A,A vs F "/" A,A vs A+G "/" A,A vs A+F "/" A,A vs G+F "/" A,A vs A+G+F "/" A,A vs G "/" G,G vs F "/" G,G vs A+G "/" G,G vs A+F "/" G,G vs G+F "/" G,G vs A+G+F "/" G,A vs F "/" F,G vs F "/" F,F vs A+G "/" F,F vs A+F "/" F,F vs G+F "/" F,F vs A+G+F "/" F,A vs A+G "/" A+G,G vs A+G "/" A+G,F vs A+G "/" A+G,A+G vs A+F "/" A+G,A+G vs G+F "/" A+G,A+G vs A+G+F "/" A+G,A vs A+F "/" A+F,G vs A+F "/" A+F,F vs A+F "/" A+F,A+G vs A+F "/" A+F,A+F vs G+F "/" A+F,A+F vs A+G+F "/" A+F,A vs G+F "/" G+F,G vs G+F "/" G+F,F vs G+F "/" G+F,A+G vs G+F "/" G+F,A+F vs G+F "/" G+F,G+F vs A+G+F "/" G+F,A vs A+G+F "/" A+G+F,G vs A+G+F "/" A+G+F,F vs A+G+F "/" A+G+F,A+F vs A+G+F "/" A+G+F,A+G vs A+G+F "/" A+G+F,G+F vs A+G+F "/" A+G+F > stability_noun_list.csv
#
#./stability_list.sh 0 noun >> stability_noun_list.csv
#./stability_list.sh 5 noun >> stability_noun_list.csv
#./stability_list.sh 10 noun >> stability_noun_list.csv
#./stability_list.sh 15 noun >> stability_noun_list.csv
#./stability_list.sh 20 noun >> stability_noun_list.csv
#./stability_list.sh 25 noun >> stability_noun_list.csv
#./stability_list.sh 30 noun >> stability_noun_list.csv
#./stability_list.sh 35 noun >> stability_noun_list.csv
#./stability_list.sh 40 noun >> stability_noun_list.csv
#./stability_list.sh 45 noun >> stability_noun_list.csv
#./stability_list.sh 50 noun >> stability_noun_list.csv
#./stability_list.sh 55 noun >> stability_noun_list.csv
#./stability_list.sh 60 noun >> stability_noun_list.csv
#./stability_list.sh 65 noun >> stability_noun_list.csv
#./stability_list.sh 70 noun >> stability_noun_list.csv
#./stability_list.sh 75 noun >> stability_noun_list.csv
#./stability_list.sh 80 noun >> stability_noun_list.csv
#./stability_list.sh 85 noun >> stability_noun_list.csv
#./stability_list.sh 90 noun >> stability_noun_list.csv
#./stability_list.sh 95 noun >> stability_noun_list.csv
#./stability_list.sh 100 noun >> stability_noun_list.csv
#
#echo sons,A vs G "/" A,A vs F "/" A,A vs A+G "/" A,A vs A+F "/" A,A vs G+F "/" A,A vs A+G+F "/" A,A vs G "/" G,G vs F "/" G,G vs A+G "/" G,G vs A+F "/" G,G vs G+F "/" G,G vs A+G+F "/" G,A vs F "/" F,G vs F "/" F,F vs A+G "/" F,F vs A+F "/" F,F vs G+F "/" F,F vs A+G+F "/" F,A vs A+G "/" A+G,G vs A+G "/" A+G,F vs A+G "/" A+G,A+G vs A+F "/" A+G,A+G vs G+F "/" A+G,A+G vs A+G+F "/" A+G,A vs A+F "/" A+F,G vs A+F "/" A+F,F vs A+F "/" A+F,A+G vs A+F "/" A+F,A+F vs G+F "/" A+F,A+F vs A+G+F "/" A+F,A vs G+F "/" G+F,G vs G+F "/" G+F,F vs G+F "/" G+F,A+G vs G+F "/" G+F,A+F vs G+F "/" G+F,G+F vs A+G+F "/" G+F,A vs A+G+F "/" A+G+F,G vs A+G+F "/" A+G+F,F vs A+G+F "/" A+G+F,A+F vs A+G+F "/" A+G+F,A+G vs A+G+F "/" A+G+F,G+F vs A+G+F "/" A+G+F > stability_verb_list.csv
#
#./stability_list.sh 0 verb >> stability_verb_list.csv
#./stability_list.sh 5 verb >> stability_verb_list.csv
#./stability_list.sh 10 verb >> stability_verb_list.csv
#./stability_list.sh 15 verb >> stability_verb_list.csv
#./stability_list.sh 20 verb >> stability_verb_list.csv
#./stability_list.sh 25 verb >> stability_verb_list.csv
#./stability_list.sh 30 verb >> stability_verb_list.csv
#./stability_list.sh 35 verb >> stability_verb_list.csv
#./stability_list.sh 40 verb >> stability_verb_list.csv
#./stability_list.sh 45 verb >> stability_verb_list.csv
#./stability_list.sh 50 verb >> stability_verb_list.csv
#./stability_list.sh 55 verb >> stability_verb_list.csv
#./stability_list.sh 60 verb >> stability_verb_list.csv
#./stability_list.sh 65 verb >> stability_verb_list.csv
#./stability_list.sh 70 verb >> stability_verb_list.csv
#./stability_list.sh 75 verb >> stability_verb_list.csv
#./stability_list.sh 80 verb >> stability_verb_list.csv
#./stability_list.sh 85 verb >> stability_verb_list.csv
#./stability_list.sh 90 verb >> stability_verb_list.csv
#./stability_list.sh 95 verb >> stability_verb_list.csv
#./stability_list.sh 100 verb >> stability_verb_list.csv
#
#./plot.sh stability_noun_list.csv noun compare_total_blcs
#./plot.sh stability_noun_rel.csv noun compare_relations
#./plot.sh stability_verb_list.csv verb compare_total_blcs
#./plot.sh stability_verb_rel.csv verb compare_relations
