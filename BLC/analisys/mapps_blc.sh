#!/bin/bash

echo Create and Check Matrix Nouns

python3 matrix_mapps_blc.py --in_file others_blcs/balkanetBC1_171_mapping_v.TXT --in_file others_blcs/balkanetBC2_171_mapping_v.TXT --in_file others_blcs/balkanetBC3_171_mapping_v.TXT --in_file others_blcs/meaning_16_mapping_v.txt --in_file others_blcs/EWBC1oe_mappings_v.txt --in_file others_blcs/EWBC2oe_mappings_v.txt --in_file others_blcs/EWBC3oe_mappings_v.txt --in_file others_blcs/WN21BCs_mapping_v.v4 --in_file others_blcs/EWN_30_v.txt --in_file others_blcs/wn30-core-synsets_v.tab --out_file out_v.txt

echo s1 wc
awk '$2==1' 0_out_v.txt | wc
echo s2 wc
awk '$3==1' 0_out_v.txt | wc
echo s3 wc
awk '$4==1' 0_out_v.txt | wc
echo s4 wc
awk '$5==1' 0_out_v.txt | wc
echo s5 wc
awk '$6==1' 0_out_v.txt | wc
echo s6 wc
awk '$7==1' 0_out_v.txt | wc
echo s7 wc
awk '$8==1' 0_out_v.txt | wc
echo s8 wc
awk '$9==1' 0_out_v.txt | wc
echo s9 wc
awk '$10==1' 0_out_v.txt | wc
echo s10 wc
awk '$11==1' 0_out_v.txt | wc


echo 1 vs 2 equals
awk '$2==1&&$3==1' 0_out_v.txt | wc

echo 1 vs 3 equals
awk '$2==1&&$4==1' 0_out_v.txt | wc

echo 1 vs 4 equals
awk '$2==1&&$5==1' 0_out_v.txt | wc

echo 1 vs 5 equals
awk '$2==1&&$6==1' 0_out_v.txt | wc

echo 1 vs 6 equals
awk '$2==1&&$7==1' 0_out_v.txt | wc

echo 1 vs 7 equals
awk '$2==1&&$8==1' 0_out_v.txt | wc

echo 1 vs 8 equals
awk '$2==1&&$9==1' 0_out_v.txt | wc

echo 1 vs 9 equals
awk '$2==1&&$10==1' 0_out_v.txt | wc

echo 1 vs 10 equals
awk '$2==1&&$11==1' 0_out_v.txt | wc

echo #######



echo 2 vs 3 equals
awk '$3==1&&$4==1' 0_out_v.txt | wc

echo 2 vs 4 equals
awk '$3==1&&$5==1' 0_out_v.txt | wc

echo 2 vs 5 equals
awk '$3==1&&$6==1' 0_out_v.txt | wc

echo 2 vs 6 equals
awk '$3==1&&$7==1' 0_out_v.txt | wc

echo 2 vs 7 equals
awk '$3==1&&$8==1' 0_out_v.txt | wc

echo 2 vs 8 equals
awk '$3==1&&$9==1' 0_out_v.txt | wc

echo 2 vs 9 equals
awk '$3==1&&$10==1' 0_out_v.txt | wc

echo 2 vs 10 equals
awk '$3==1&&$11==1' 0_out_v.txt | wc

echo #######



echo 3 vs 4 equals
awk '$4==1&&$5==1' 0_out_v.txt | wc

echo 3 vs 5 equals
awk '$4==1&&$6==1' 0_out_v.txt | wc

echo 3 vs 6 equals
awk '$4==1&&$7==1' 0_out_v.txt | wc

echo 3 vs 7 equals
awk '$4==1&&$8==1' 0_out_v.txt | wc

echo 3 vs 8 equals
awk '$4==1&&$9==1' 0_out_v.txt | wc

echo 3 vs 9 equals
awk '$4==1&&$10==1' 0_out_v.txt | wc

echo 3 vs 10 equals
awk '$4==1&&$11==1' 0_out_v.txt | wc

echo #######


echo 4 vs 5 equals
awk '$5==1&&$6==1' 0_out_v.txt | wc

echo 4 vs 6 equals
awk '$5==1&&$7==1' 0_out_v.txt | wc

echo 4 vs 7 equals
awk '$5==1&&$8==1' 0_out_v.txt | wc

echo 4 vs 8 equals
awk '$5==1&&$9==1' 0_out_v.txt | wc

echo 4 vs 9 equals
awk '$5==1&&$10==1' 0_out_v.txt | wc

echo 4 vs 10 equals
awk '$5==1&&$11==1' 0_out_v.txt | wc

echo #######



echo 5 vs 6 equals
awk '$6==1&&$7==1' 0_out_v.txt | wc

echo 5 vs 7 equals
awk '$6==1&&$8==1' 0_out_v.txt | wc

echo 5 vs 8 equals
awk '$6==1&&$9==1' 0_out_v.txt | wc

echo 5 vs 9 equals
awk '$6==1&&$10==1' 0_out_v.txt | wc

echo 5 vs 10 equals
awk '$6==1&&$11==1' 0_out_v.txt | wc

echo #######



echo 6 vs 7 equals
awk '$7==1&&$8==1' 0_out_v.txt | wc

echo 6 vs 8 equals
awk '$7==1&&$9==1' 0_out_v.txt | wc

echo 6 vs 9 equals
awk '$7==1&&$10==1' 0_out_v.txt | wc

echo 6 vs 10 equals
awk '$7==1&&$11==1' 0_out_v.txt | wc

echo #######


echo 7 vs 8 equals
awk '$8==1&&$9==1' 0_out_v.txt | wc

echo 7 vs 9 equals
awk '$8==1&&$10==1' 0_out_v.txt | wc

echo 7 vs 10 equals
awk '$8==1&&$11==1' 0_out_v.txt | wc

echo #######



echo 8 vs 9 equals
awk '$9==1&&$10==1' 0_out_v.txt | wc

echo 8 vs 10 equals
awk '$9==1&&$11==1' 0_out_v.txt | wc

echo #######



echo 9 vs 10 equals
awk '$10==1&&$11==1' 0_out_v.txt | wc



echo 1 vs 2 differents
awk '$2==0&&$3==1' 0_out_v.txt | wc
awk '$2==1&&$3==0' 0_out_v.txt | wc

echo 1 vs 3 differents
awk '$2==0&&$4==1' 0_out_v.txt | wc
awk '$2==1&&$4==0' 0_out_v.txt | wc

echo 1 vs 4 differents
awk '$2==0&&$5==1' 0_out_v.txt | wc
awk '$2==1&&$5==0' 0_out_v.txt | wc

echo 1 vs 5 differents
awk '$2==0&&$6==1' 0_out_v.txt | wc
awk '$2==1&&$6==0' 0_out_v.txt | wc

echo 1 vs 6 differents
awk '$2==0&&$7==1' 0_out_v.txt | wc
awk '$2==1&&$7==0' 0_out_v.txt | wc

echo 1 vs 7 differents
awk '$2==0&&$8==1' 0_out_v.txt | wc
awk '$2==1&&$8==0' 0_out_v.txt | wc

echo 1 vs 8 differents
awk '$2==0&&$9==1' 0_out_v.txt | wc
awk '$2==1&&$9==0' 0_out_v.txt | wc

echo 1 vs 9 differents
awk '$2==0&&$10==1' 0_out_v.txt | wc
awk '$2==1&&$10==0' 0_out_v.txt | wc

echo 1 vs 10 differents
awk '$2==0&&$11==1' 0_out_v.txt | wc
awk '$2==1&&$11==0' 0_out_v.txt | wc

#echo Create and Check Matrix Occurences 2

#python3 matrix_mapps_blc.py --out_file out.txt --occ 2 --in_file others_blcs/wn30-core-synsets.tab --in_file others_blcs/EWN_30.txt

#wc 2_out.txt

#echo Create and Check Matrix Occurences 1

#python3 matrix_mapps_blc.py --out_file out.txt --occ 1 --in_file others_blcs/wn30-core-synsets.tab --in_file others_blcs/EWN_30.txt

#wc 1_out.txt

