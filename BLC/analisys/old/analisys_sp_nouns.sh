#!/bin/bash

echo Noun analisys
echo " "

## General

R=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $1,$4"-"$2}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | perl -ne 's/([0-9]{8}-)//g;print' | gawk -f nawk/descolapsar.nawk | uniq | gawk -f nawk/colapsar.nawk | gawk '{n=n+1;s=s+(NF-1)}END{print n,s,s/n}')

echo "	" R_Nouns n s s/n = $R


## Domains

R=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../dict/wn30/domains_n_des.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')

echo "	" R_Dom_n = $R

Cls01=$(gawk '{print $2}' ../dict/wn30/domains_n_des.rel | sort | uniq | wc | gawk '{print $1}')
echo "	" Cls = $Cls01

Res01=$(awk "BEGIN {printf \"%.4f\",$Cls01/$R}")
echo "	" Result=$Cls01/$R
echo "	" Result=$Res01
echo " "


## SUMO

R=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../dict/wn30/sumo_n_des.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')

echo "	" R_Sumo_n = $R

Cls01=$(gawk '{print $2}' ../dict/wn30/sumo_n_des.rel | sort | uniq | wc | gawk '{print $1}')
echo "	" Cls = $Cls01

Res01=$(awk "BEGIN {printf \"%.4f\",$Cls01/$R}")
echo "	" Result=$Cls01/$R
echo "	" Result=$Res01
echo " "


## 0 Descendent, All
echo BLC0all:
R01=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin000/all/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R01

Cls01=$(cat ../out/wn30/descmin000/all/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls01

Res01=$(awk "BEGIN {printf \"%.4f\",$Cls01/$R01}")
echo "	" Result=$Cls01/$R01
echo "	" Result=$Res01
echo " "

## 0 Descendent, All+Gloss
echo BLC0all+gloss:
R02=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin000/all+gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R02

Cls02=$(cat ../out/wn30/descmin000/all+gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls02

Res02=$(awk "BEGIN {printf \"%.4f\",$Cls02/$R02}")
echo "	" Result=$Cls02/$R02
echo "	" Result=$Res02
echo " "

## 0 Descendent, Frequency
echo BLC0freq:
R03=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin000/freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R03

Cls03=$(cat ../out/wn30/descmin000/freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls03

Res03=$(awk "BEGIN {printf \"%.4f\",$Cls03/$R03}")
echo "	" Result=$Cls03/$R03
echo "	" Result=$Res03
echo " "
echo " "


## 5 Descendent, All
echo BLC5all:
R51=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin005/all/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R51

Cls51=$(cat ../out/wn30/descmin005/all/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls51

Res51=$(awk "BEGIN {printf \"%.4f\",$Cls51/$R51}")
echo "	" Result=$Cls51/$R51
echo "	" Result=$Res51
echo " "

## 5 Descendent, All+Gloss
echo BLC5all+gloss:
R52=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin005/all+gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R52

Cls52=$(cat ../out/wn30/descmin005/all+gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls52

Res52=$(awk "BEGIN {printf \"%.4f\",$Cls52/$R52}")
echo "	" Result=$Cls52/$R52
echo "	" Result=$Res52
echo " "

## 5 Descendent, Frequency
echo BLC5freq:
R53=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin005/freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R53

Cls53=$(cat ../out/wn30/descmin005/freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls53

Res53=$(awk "BEGIN {printf \"%.4f\",$Cls53/$R53}")
echo "	" Result=$Cls53/$R53
echo "	" Result=$Res53
echo " "
echo " "


## 10 Descendent, All
echo BLC10all:
R101=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin010/all/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R101

Cls101=$(cat ../out/wn30/descmin010/all/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls101

Res101=$(awk "BEGIN {printf \"%.4f\",$Cls101/$R101}")
echo "	" Result=$Cls101/$R101
echo "	" Result=$Res101
echo " "

## 10 Descendent, All+Gloss
echo BLC10all+gloss:
R102=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin010/all+gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R102

Cls102=$(cat ../out/wn30/descmin010/all+gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls102

Res102=$(awk "BEGIN {printf \"%.4f\",$Cls102/$R102}")
echo "	" Result=$Cls102/$R102
echo "	" Result=$Res102
echo " "

## 10 Descendent, Frequency
echo BLC10freq:
R103=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin010/freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R103

Cls103=$(cat ../out/wn30/descmin010/freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls103

Res103=$(awk "BEGIN {printf \"%.4f\",$Cls103/$R103}")
echo "	" Result=$Cls103/$R103
echo "	" Result=$Res103
echo " "
echo " "


## 20 Descendent, All
echo BLC20all:
R201=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin020/all/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R201

Cls201=$(cat ../out/wn30/descmin020/all/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls201

Res201=$(awk "BEGIN {printf \"%.4f\",$Cls201/$R201}")
echo "	" Result=$Cls201/$R201
echo "	" Result=$Res201
echo " "

## 20 Descendent, All+Gloss
echo BLC20all+gloss:
R202=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin020/all+gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R202

Cls202=$(cat ../out/wn30/descmin020/all+gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls202

Res202=$(awk "BEGIN {printf \"%.4f\",$Cls202/$R202}")
echo "	" Result=$Cls202/$R202
echo "	" Result=$Res202
echo " "

## 20 Descendent, Frequency 
echo BLC20freq:
R203=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin020/freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R203

Cls203=$(cat ../out/wn30/descmin020/freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls203

Res203=$(awk "BEGIN {printf \"%.4f\",$Cls203/$R203}")
echo "	" Result=$Cls203/$R203
echo "	" Result=$Res203
echo " "
echo " "


## 30 Descendent, All
echo BLC30all:
R301=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin030/all/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R301

Cls301=$(cat ../out/wn30/descmin030/all/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls301

Res301=$(awk "BEGIN {printf \"%.4f\",$Cls301/$R301}")
echo "	" Result=$Cls301/$R301
echo "	" Result=$Res301
echo " "

## 30 Descendent, All+Gloss
echo BLC30all+gloss:
R302=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin030/all+gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R302

Cls302=$(cat ../out/wn30/descmin030/all+gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls302

Res302=$(awk "BEGIN {printf \"%.4f\",$Cls302/$R302}")
echo "	" Result=$Cls302/$R302
echo "	" Result=$Res302
echo " "

## 30 Descendent, Frequency 
echo BLC30freq:
R303=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin030/freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R303

Cls303=$(cat ../out/wn30/descmin030/freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls303

Res303=$(awk "BEGIN {printf \"%.4f\",$Cls303/$R303}")
echo "	" Result=$Cls303/$R303
echo "	" Result=$Res303
echo " "
echo " "


## 40 Descendent, All
echo BLC40all:
R401=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin040/all/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R401

Cls401=$(cat ../out/wn30/descmin040/all/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls401

Res401=$(awk "BEGIN {printf \"%.4f\",$Cls401/$R401}")
echo "	" Result=$Cls401/$R401
echo "	" Result=$Res401
echo " "

## 40 Descendent, All+Gloss
echo BLC40all+gloss:
R402=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin040/all+gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R402

Cls402=$(cat ../out/wn30/descmin040/all+gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls402

Res402=$(awk "BEGIN {printf \"%.4f\",$Cls402/$R402}")
echo "	" Result=$Cls402/$R402
echo "	" Result=$Res402
echo " "

## 40 Descendent, Frequency 
echo BLC40freq:
R403=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin040/freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R403

Cls403=$(cat ../out/wn30/descmin040/freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls403

Res403=$(awk "BEGIN {printf \"%.4f\",$Cls403/$R403}")
echo "	" Result=$Cls403/$R403
echo "	" Result=$Res403
echo " "
echo " "

## 50 Descendent, All
echo BLC50all:
R501=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin050/all/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R501

Cls501=$(cat ../out/wn30/descmin050/all/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls501

Res501=$(awk "BEGIN {printf \"%.4f\",$Cls501/$R501}")
echo "	" Result=$Cls501/$R501
echo "	" Result=$Res501
echo " "

## 50 Descendent, All+Gloss
echo BLC50all+gloss:
R502=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin050/all+gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R502

Cls502=$(cat ../out/wn30/descmin050/all+gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls502

Res502=$(awk "BEGIN {printf \"%.4f\",$Cls502/$R502}")
echo "	" Result=$Cls502/$R502
echo "	" Result=$Res502
echo " "

## 50 Descendent, Frequency 
echo BLC50freq:
R503=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin050/freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R503

Cls503=$(cat ../out/wn30/descmin050/freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls503

Res503=$(awk "BEGIN {printf \"%.4f\",$Cls503/$R503}")
echo "	" Result=$Cls503/$R503
echo "	" Result=$Res503
echo " "


## 60 Descendent, All
echo BLC60all:
R601=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin060/all/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R601

Cls601=$(cat ../out/wn30/descmin060/all/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls601

Res601=$(awk "BEGIN {printf \"%.4f\",$Cls601/$R601}")
echo "	" Result=$Cls601/$R601
echo "	" Result=$Res601
echo " "

## 60 Descendent, All+Gloss
echo BLC60all+gloss:
R602=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin060/all+gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R602

Cls602=$(cat ../out/wn30/descmin060/all+gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls602

Res602=$(awk "BEGIN {printf \"%.4f\",$Cls602/$R602}")
echo "	" Result=$Cls602/$R602
echo "	" Result=$Res602
echo " "

## 60 Descendent, Frequency 
echo BLC60freq:
R603=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin060/freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R603

Cls603=$(cat ../out/wn30/descmin060/freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls603

Res603=$(awk "BEGIN {printf \"%.4f\",$Cls603/$R603}")
echo "	" Result=$Cls603/$R603
echo "	" Result=$Res603
echo " "
echo " "

## 70 Descendent, All
echo BLC70all:
R701=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin070/all/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R701

Cls701=$(cat ../out/wn30/descmin070/all/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls701

Res701=$(awk "BEGIN {printf \"%.4f\",$Cls701/$R701}")
echo "	" Result=$Cls701/$R701
echo "	" Result=$Res701
echo " "

## 70 Descendent, All+Gloss
echo BLC70all+gloss:
R702=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin070/all+gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R702

Cls702=$(cat ../out/wn30/descmin070/all+gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls702

Res702=$(awk "BEGIN {printf \"%.4f\",$Cls702/$R702}")
echo "	" Result=$Cls702/$R702
echo "	" Result=$Res702
echo " "

## 70 Descendent, Frequency 
echo BLC70freq:
R703=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin070/freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R703

Cls703=$(cat ../out/wn30/descmin070/freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls703

Res703=$(awk "BEGIN {printf \"%.4f\",$Cls703/$R703}")
echo "	" Result=$Cls703/$R703
echo "	" Result=$Res703
echo " "
echo " "


## 80 Descendent, All
echo BLC80all:
R801=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin080/all/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R801

Cls801=$(cat ../out/wn30/descmin080/all/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls801

Res801=$(awk "BEGIN {printf \"%.4f\",$Cls801/$R801}")
echo "	" Result=$Cls801/$R801
echo "	" Result=$Res801
echo " "

## 80 Descendent, All+Gloss
echo BLC80all+gloss:
R802=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin080/all+gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R802

Cls802=$(cat ../out/wn30/descmin080/all+gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls802

Res802=$(awk "BEGIN {printf \"%.4f\",$Cls802/$R802}")
echo "	" Result=$Cls802/$R802
echo "	" Result=$Res802
echo " "

## 80 Descendent, Frequency 
echo BLC80freq:
R803=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin080/freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R803

Cls803=$(cat ../out/wn30/descmin080/freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls803

Res803=$(awk "BEGIN {printf \"%.4f\",$Cls803/$R803}")
echo "	" Result=$Cls803/$R803
echo "	" Result=$Res803
echo " "
echo " "


## 90 Descendent, All
echo BLC90all:
R901=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin090/all/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R901

Cls901=$(cat ../out/wn30/descmin090/all/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls901

Res901=$(awk "BEGIN {printf \"%.4f\",$Cls901/$R901}")
echo "	" Result=$Cls901/$R901
echo "	" Result=$Res901
echo " "

## 90 Descendent, All+Gloss
echo BLC90all+gloss:
R902=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin090/all+gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R902

Cls902=$(cat ../out/wn30/descmin090/all+gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls902

Res902=$(awk "BEGIN {printf \"%.4f\",$Cls902/$R902}")
echo "	" Result=$Cls902/$R902
echo "	" Result=$Res902
echo " "

## 90 Descendent, Frequency 
echo BLC90freq:
R903=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin090/freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R903

Cls903=$(cat ../out/wn30/descmin090/freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls903

Res903=$(awk "BEGIN {printf \"%.4f\",$Cls903/$R903}")
echo "	" Result=$Cls903/$R903
echo "	" Result=$Res903
echo " "
echo " "


## 100 Descendent, All
echo BLC100all:
R1001=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin100/all/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R1001

Cls1001=$(cat ../out/wn30/descmin100/all/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls1001

Res1001=$(awk "BEGIN {printf \"%.4f\",$Cls1001/$R1001}")
echo "	" Result=$Cls1001/$R1001
echo "	" Result=$Res1001
echo " "

## 100 Descendent, All+Gloss
echo BLC100all+gloss:
R1002=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin100/all+gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R1002

Cls1002=$(cat ../out/wn30/descmin100/all+gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls1002

Res1002=$(awk "BEGIN {printf \"%.4f\",$Cls1002/$R1002}")
echo "	" Result=$Cls1002/$R1002
echo "	" Result=$Res1002
echo " "

## 100 Descendent, Frequency 
echo BLC100freq:
R1003=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin100/freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R1003

Cls1003=$(cat ../out/wn30/descmin100/freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls1003

Res1003=$(awk "BEGIN {printf \"%.4f\",$Cls1003/$R1003}")
echo "	" Result=$Cls1003/$R1003
echo "	" Result=$Res1003
echo " "
echo " "


## 15 Descendent, All
echo BLC15all:
R151=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin015/all/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R151

Cls151=$(cat ../out/wn30/descmin015/all/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls151

Res151=$(awk "BEGIN {printf \"%.4f\",$Cls151/$R151}")
echo "	" Result=$Cls151/$R151
echo "	" Result=$Res151
echo " "

## 15 Descendent, All+Gloss
echo BLC15all+gloss:
R152=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin015/all+gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R152

Cls152=$(cat ../out/wn30/descmin015/all+gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls152

Res152=$(awk "BEGIN {printf \"%.4f\",$Cls152/$R152}")
echo "	" Result=$Cls152/$R152
echo "	" Result=$Res152
echo " "

## 15 Descendent, Frequency
echo BLC15freq:
R153=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin015/freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R153

Cls153=$(cat ../out/wn30/descmin015/freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls153

Res153=$(awk "BEGIN {printf \"%.4f\",$Cls153/$R153}")
echo "	" Result=$Cls153/$R153
echo "	" Result=$Res153
echo " "
echo " "


## 25 Descendent, All
echo BLC25all:
R251=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin025/all/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R251

Cls251=$(cat ../out/wn30/descmin025/all/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls251

Res251=$(awk "BEGIN {printf \"%.4f\",$Cls251/$R251}")
echo "	" Result=$Cls251/$R251
echo "	" Result=$Res251
echo " "

## 25 Descendent, All+Gloss
echo BLC25all+gloss:
R252=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin025/all+gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R252

Cls252=$(cat ../out/wn30/descmin025/all+gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls252

Res252=$(awk "BEGIN {printf \"%.4f\",$Cls252/$R252}")
echo "	" Result=$Cls252/$R252
echo "	" Result=$Res252
echo " "

## 25 Descendent, Frequency 
echo BLC25freq:
R253=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin025/freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R253

Cls253=$(cat ../out/wn30/descmin025/freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls253

Res253=$(awk "BEGIN {printf \"%.4f\",$Cls253/$R253}")
echo "	" Result=$Cls253/$R253
echo "	" Result=$Res253
echo " "
echo " "


## 35 Descendent, All
echo BLC35all:
R351=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin035/all/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R351

Cls351=$(cat ../out/wn30/descmin035/all/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls351

Res351=$(awk "BEGIN {printf \"%.4f\",$Cls351/$R351}")
echo "	" Result=$Cls351/$R351
echo "	" Result=$Res351
echo " "

## 35 Descendent, All+Gloss
echo BLC35all+gloss:
R352=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin035/all+gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R352

Cls352=$(cat ../out/wn30/descmin035/all+gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls352

Res352=$(awk "BEGIN {printf \"%.4f\",$Cls352/$R352}")
echo "	" Result=$Cls352/$R352
echo "	" Result=$Res352
echo " "

## 35 Descendent, Frequency 
echo BLC35freq:
R353=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin035/freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R353

Cls353=$(cat ../out/wn30/descmin035/freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls353

Res353=$(awk "BEGIN {printf \"%.4f\",$Cls353/$R353}")
echo "	" Result=$Cls353/$R353
echo "	" Result=$Res353
echo " "
echo " "


## 45 Descendent, All
echo BLC45all:
R451=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin045/all/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R451

Cls451=$(cat ../out/wn30/descmin045/all/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls451

Res451=$(awk "BEGIN {printf \"%.4f\",$Cls451/$R451}")
echo "	" Result=$Cls451/$R451
echo "	" Result=$Res451
echo " "

## 45 Descendent, All+Gloss
echo BLC45all+gloss:
R452=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin045/all+gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R452

Cls452=$(cat ../out/wn30/descmin045/all+gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls452

Res452=$(awk "BEGIN {printf \"%.4f\",$Cls452/$R452}")
echo "	" Result=$Cls452/$R452
echo "	" Result=$Res452
echo " "

## 45 Descendent, Frequency 
echo BLC45freq:
R453=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin045/freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R453

Cls453=$(cat ../out/wn30/descmin045/freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls453

Res453=$(awk "BEGIN {printf \"%.4f\",$Cls453/$R453}")
echo "	" Result=$Cls453/$R453
echo "	" Result=$Res453
echo " "
echo " "

## 55 Descendent, All
echo BLC55all:
R551=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin055/all/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R551

Cls551=$(cat ../out/wn30/descmin055/all/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls551

Res551=$(awk "BEGIN {printf \"%.4f\",$Cls551/$R551}")
echo "	" Result=$Cls551/$R551
echo "	" Result=$Res551
echo " "

## 55 Descendent, All+Gloss
echo BLC55all+gloss:
R552=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin055/all+gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R552

Cls552=$(cat ../out/wn30/descmin055/all+gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls552

Res552=$(awk "BEGIN {printf \"%.4f\",$Cls552/$R552}")
echo "	" Result=$Cls552/$R552
echo "	" Result=$Res552
echo " "

## 55 Descendent, Frequency 
echo BLC55freq:
R553=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin055/freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R553

Cls553=$(cat ../out/wn30/descmin055/freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls553

Res553=$(awk "BEGIN {printf \"%.4f\",$Cls553/$R553}")
echo "	" Result=$Cls553/$R553
echo "	" Result=$Res553
echo " "


## 65 Descendent, All
echo BLC65all:
R651=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin065/all/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R651

Cls651=$(cat ../out/wn30/descmin065/all/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls651

Res651=$(awk "BEGIN {printf \"%.4f\",$Cls651/$R651}")
echo "	" Result=$Cls651/$R651
echo "	" Result=$Res651
echo " "

## 65 Descendent, All+Gloss
echo BLC65all+gloss:
R652=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin065/all+gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R652

Cls652=$(cat ../out/wn30/descmin065/all+gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls652

Res652=$(awk "BEGIN {printf \"%.4f\",$Cls652/$R652}")
echo "	" Result=$Cls652/$R652
echo "	" Result=$Res652
echo " "

## 65 Descendent, Frequency 
echo BLC65freq:
R653=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin065/freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R653

Cls653=$(cat ../out/wn30/descmin065/freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls653

Res653=$(awk "BEGIN {printf \"%.4f\",$Cls653/$R653}")
echo "	" Result=$Cls653/$R653
echo "	" Result=$Res653
echo " "
echo " "


## 75 Descendent, All
echo BLC75all:
R751=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin075/all/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R751

Cls751=$(cat ../out/wn30/descmin075/all/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls751

Res751=$(awk "BEGIN {printf \"%.4f\",$Cls751/$R751}")
echo "	" Result=$Cls751/$R751
echo "	" Result=$Res751
echo " "

## 75 Descendent, All+Gloss
echo BLC75all+gloss:
R752=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin075/all+gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R752

Cls752=$(cat ../out/wn30/descmin075/all+gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls752

Res752=$(awk "BEGIN {printf \"%.4f\",$Cls752/$R752}")
echo "	" Result=$Cls752/$R752
echo "	" Result=$Res752
echo " "

## 75 Descendent, Frequency 
echo BLC75freq:
R753=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin075/freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R753

Cls753=$(cat ../out/wn30/descmin075/freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls753

Res753=$(awk "BEGIN {printf \"%.4f\",$Cls753/$R753}")
echo "	" Result=$Cls753/$R753
echo "	" Result=$Res753
echo " "
echo " "


## 85 Descendent, All
echo BLC85all:
R851=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin085/all/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R851

Cls851=$(cat ../out/wn30/descmin085/all/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls851

Res851=$(awk "BEGIN {printf \"%.4f\",$Cls851/$R851}")
echo "	" Result=$Cls851/$R851
echo "	" Result=$Res851
echo " "

## 85 Descendent, All+Gloss
echo BLC85all+gloss:
R852=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin085/all+gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R852

Cls852=$(cat ../out/wn30/descmin085/all+gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls852

Res852=$(awk "BEGIN {printf \"%.4f\",$Cls852/$R852}")
echo "	" Result=$Cls852/$R852
echo "	" Result=$Res852
echo " "

## 85 Descendent, Frequency 
echo BLC85freq:
R853=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin085/freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R853

Cls853=$(cat ../out/wn30/descmin085/freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls853

Res853=$(awk "BEGIN {printf \"%.4f\",$Cls853/$R853}")
echo "	" Result=$Cls853/$R853
echo "	" Result=$Res853
echo " "
echo " "


## 95 Descendent, All
echo BLC95all:
R951=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin095/all/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R951

Cls951=$(cat ../out/wn30/descmin095/all/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls951

Res951=$(awk "BEGIN {printf \"%.4f\",$Cls951/$R951}")
echo "	" Result=$Cls951/$R951
echo "	" Result=$Res951
echo " "

## 95 Descendent, All+Gloss
echo BLC95all+gloss:
R952=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin095/all+gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R952

Cls952=$(cat ../out/wn30/descmin095/all+gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls952

Res952=$(awk "BEGIN {printf \"%.4f\",$Cls952/$R952}")
echo "	" Result=$Cls952/$R952
echo "	" Result=$Res952
echo " "

## 95 Descendent, Frequency 
echo BLC95freq:
R953=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin095/freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R953

Cls953=$(cat ../out/wn30/descmin095/freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls953

Res953=$(awk "BEGIN {printf \"%.4f\",$Cls953/$R953}")
echo "	" Result=$Cls953/$R953
echo "	" Result=$Res953
echo " "
echo " "





## 0 Descendent, All
echo BLC0gloss:
R04=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin000/gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R04

Cls04=$(cat ../out/wn30/descmin000/gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls04

Res04=$(awk "BEGIN {printf \"%.4f\",$Cls04/$R04}")
echo "	" Result=$Cls04/$R04
echo "	" Result=$Res04
echo " "

## 0 Descendent, All+Gloss
echo BLC0gloss+freq:
R05=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin000/gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R05

Cls05=$(cat ../out/wn30/descmin000/gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls05

Res05=$(awk "BEGIN {printf \"%.4f\",$Cls05/$R05}")
echo "	" Result=$Cls05/$R05
echo "	" Result=$Res05
echo " "

## 0 Descendent, Frequency
echo BLC0all+freq:
R06=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin000/all+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R06

Cls06=$(cat ../out/wn30/descmin000/all+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls06

Res06=$(awk "BEGIN {printf \"%.4f\",$Cls06/$R06}")
echo "	" Result=$Cls06/$R06
echo "	" Result=$Res06
echo " "
echo " "


## 5 Descendent, All
echo BLC5gloss:
R54=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin005/gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$4)/$1}')
echo "	" R = $R54

Cls54=$(cat ../out/wn30/descmin005/gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls54

Res54=$(awk "BEGIN {printf \"%.4f\",$Cls54/$R54}")
echo "	" Result=$Cls54/$R54
echo "	" Result=$Res54
echo " "

## 5 Descendent, All+Gloss
echo BLC5gloss+freq:
R55=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin005/gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R55

Cls55=$(cat ../out/wn30/descmin005/gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls55

Res55=$(awk "BEGIN {printf \"%.4f\",$Cls55/$R55}")
echo "	" Result=$Cls55/$R55
echo "	" Result=$Res55
echo " "

## 5 Descendent, Frequency
echo BLC5all+freq:
R56=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin005/all+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R56

Cls56=$(cat ../out/wn30/descmin005/all+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls56

Res56=$(awk "BEGIN {printf \"%.4f\",$Cls56/$R56}")
echo "	" Result=$Cls56/$R56
echo "	" Result=$Res56
echo " "
echo " "


## 10 Descendent, All
echo BLC10gloss:
R104=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin010/gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R104

Cls104=$(cat ../out/wn30/descmin010/gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls104

Res104=$(awk "BEGIN {printf \"%.4f\",$Cls104/$R104}")
echo "	" Result=$Cls104/$R104
echo "	" Result=$Res104
echo " "

## 10 Descendent, All+Gloss
echo BLC10gloss+freq:
R105=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin010/gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R105

Cls105=$(cat ../out/wn30/descmin010/gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls105

Res105=$(awk "BEGIN {printf \"%.4f\",$Cls105/$R105}")
echo "	" Result=$Cls105/$R105
echo "	" Result=$Res105
echo " "

## 10 Descendent, Frequency
echo BLC10all+freq:
R106=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin010/all+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R106

Cls106=$(cat ../out/wn30/descmin010/all+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls106

Res106=$(awk "BEGIN {printf \"%.4f\",$Cls106/$R106}")
echo "	" Result=$Cls106/$R106
echo "	" Result=$Res106
echo " "
echo " "


## 20 Descendent, All
echo BLC20gloss:
R204=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin020/gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R204

Cls204=$(cat ../out/wn30/descmin020/gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls204

Res204=$(awk "BEGIN {printf \"%.4f\",$Cls204/$R204}")
echo "	" Result=$Cls204/$R204
echo "	" Result=$Res204
echo " "

## 20 Descendent, All+Gloss
echo BLC20gloss+freq:
R205=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin020/gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R205

Cls205=$(cat ../out/wn30/descmin020/gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls205

Res205=$(awk "BEGIN {printf \"%.4f\",$Cls205/$R205}")
echo "	" Result=$Cls205/$R205
echo "	" Result=$Res205
echo " "

## 20 Descendent, Frequency 
echo BLC20all+freq:
R206=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin020/all+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R206

Cls206=$(cat ../out/wn30/descmin020/all+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls206

Res206=$(awk "BEGIN {printf \"%.4f\",$Cls206/$R206}")
echo "	" Result=$Cls206/$R206
echo "	" Result=$Res206
echo " "
echo " "


## 30 Descendent, All
echo BLC30gloss:
R304=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin030/gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R304

Cls304=$(cat ../out/wn30/descmin030/gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls304

Res304=$(awk "BEGIN {printf \"%.4f\",$Cls304/$R304}")
echo "	" Result=$Cls304/$R304
echo "	" Result=$Res304
echo " "

## 30 Descendent, All+Gloss
echo BLC30gloss+freq:
R305=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin030/gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R305

Cls305=$(cat ../out/wn30/descmin030/gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls305

Res305=$(awk "BEGIN {printf \"%.4f\",$Cls305/$R305}")
echo "	" Result=$Cls305/$R305
echo "	" Result=$Res305
echo " "

## 30 Descendent, Frequency 
echo BLC30all+freq:
R306=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin030/all+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R306

Cls306=$(cat ../out/wn30/descmin030/all+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls306

Res306=$(awk "BEGIN {printf \"%.4f\",$Cls306/$R306}")
echo "	" Result=$Cls306/$R306
echo "	" Result=$Res306
echo " "
echo " "


## 40 Descendent, All
echo BLC40gloss:
R404=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin040/gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R404

Cls404=$(cat ../out/wn30/descmin040/gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls404

Res404=$(awk "BEGIN {printf \"%.4f\",$Cls404/$R404}")
echo "	" Result=$Cls404/$R404
echo "	" Result=$Res404
echo " "

## 40 Descendent, All+Gloss
echo BLC40gloss+freq:
R405=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin040/gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R405

Cls405=$(cat ../out/wn30/descmin040/gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls405

Res405=$(awk "BEGIN {printf \"%.4f\",$Cls405/$R405}")
echo "	" Result=$Cls405/$R405
echo "	" Result=$Res405
echo " "

## 40 Descendent, Frequency 
echo BLC40all+freq:
R406=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin040/all+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R406

Cls406=$(cat ../out/wn30/descmin040/all+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls406

Res406=$(awk "BEGIN {printf \"%.4f\",$Cls406/$R406}")
echo "	" Result=$Cls406/$R406
echo "	" Result=$Res406
echo " "
echo " "

## 50 Descendent, All
echo BLC50gloss:
R504=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin050/gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R504

Cls504=$(cat ../out/wn30/descmin050/gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls504

Res504=$(awk "BEGIN {printf \"%.4f\",$Cls504/$R504}")
echo "	" Result=$Cls504/$R504
echo "	" Result=$Res504
echo " "

## 50 Descendent, All+Gloss
echo BLC50gloss+freq:
R505=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin050/gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R505

Cls505=$(cat ../out/wn30/descmin050/gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls505

Res505=$(awk "BEGIN {printf \"%.4f\",$Cls505/$R505}")
echo "	" Result=$Cls505/$R505
echo "	" Result=$Res505
echo " "

## 50 Descendent, Frequency 
echo BLC50all+freq:
R506=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin050/all+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R506

Cls506=$(cat ../out/wn30/descmin050/all+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls506

Res506=$(awk "BEGIN {printf \"%.4f\",$Cls506/$R506}")
echo "	" Result=$Cls506/$R506
echo "	" Result=$Res506
echo " "


## 60 Descendent, All
echo BLC60gloss:
R604=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin060/gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R604

Cls604=$(cat ../out/wn30/descmin060/gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls604

Res604=$(awk "BEGIN {printf \"%.4f\",$Cls604/$R604}")
echo "	" Result=$Cls604/$R604
echo "	" Result=$Res604
echo " "

## 60 Descendent, All+Gloss
echo BLC60gloss+freq:
R605=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin060/gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R605

Cls605=$(cat ../out/wn30/descmin060/gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls605

Res605=$(awk "BEGIN {printf \"%.4f\",$Cls605/$R605}")
echo "	" Result=$Cls605/$R605
echo "	" Result=$Res605
echo " "

## 60 Descendent, Frequency 
echo BLC60all+freq:
R606=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin060/all+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R606

Cls606=$(cat ../out/wn30/descmin060/all+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls606

Res606=$(awk "BEGIN {printf \"%.4f\",$Cls606/$R606}")
echo "	" Result=$Cls606/$R606
echo "	" Result=$Res606
echo " "
echo " "

## 70 Descendent, All
echo BLC70gloss:
R704=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin070/gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R704

Cls704=$(cat ../out/wn30/descmin070/gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls704

Res704=$(awk "BEGIN {printf \"%.4f\",$Cls704/$R704}")
echo "	" Result=$Cls704/$R704
echo "	" Result=$Res704
echo " "

## 70 Descendent, All+Gloss
echo BLC70gloss+freq:
R705=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin070/gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R705

Cls705=$(cat ../out/wn30/descmin070/gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls705

Res705=$(awk "BEGIN {printf \"%.4f\",$Cls705/$R705}")
echo "	" Result=$Cls705/$R705
echo "	" Result=$Res705
echo " "

## 70 Descendent, Frequency 
echo BLC70all+freq:
R706=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin070/all+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R706

Cls706=$(cat ../out/wn30/descmin070/all+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls706

Res706=$(awk "BEGIN {printf \"%.4f\",$Cls706/$R706}")
echo "	" Result=$Cls706/$R706
echo "	" Result=$Res706
echo " "
echo " "


## 80 Descendent, All
echo BLC80gloss:
R804=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin080/gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R804

Cls804=$(cat ../out/wn30/descmin080/gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls804

Res804=$(awk "BEGIN {printf \"%.4f\",$Cls804/$R804}")
echo "	" Result=$Cls804/$R804
echo "	" Result=$Res804
echo " "

## 80 Descendent, All+Gloss
echo BLC80gloss+freq:
R805=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin080/gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R805

Cls805=$(cat ../out/wn30/descmin080/gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls805

Res805=$(awk "BEGIN {printf \"%.4f\",$Cls805/$R805}")
echo "	" Result=$Cls805/$R805
echo "	" Result=$Res805
echo " "

## 80 Descendent, Frequency 
echo BLC80all+freq:
R806=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin080/all+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R806

Cls806=$(cat ../out/wn30/descmin080/all+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls806

Res806=$(awk "BEGIN {printf \"%.4f\",$Cls806/$R806}")
echo "	" Result=$Cls806/$R806
echo "	" Result=$Res806
echo " "
echo " "


## 90 Descendent, All
echo BLC90gloss:
R904=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin090/gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R904

Cls904=$(cat ../out/wn30/descmin090/gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls904

Res904=$(awk "BEGIN {printf \"%.4f\",$Cls904/$R904}")
echo "	" Result=$Cls904/$R904
echo "	" Result=$Res904
echo " "

## 90 Descendent, All+Gloss
echo BLC90gloss+freq:
R905=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin090/gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R905

Cls905=$(cat ../out/wn30/descmin090/gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls905

Res905=$(awk "BEGIN {printf \"%.4f\",$Cls905/$R905}")
echo "	" Result=$Cls905/$R905
echo "	" Result=$Res905
echo " "

## 90 Descendent, Frequency 
echo BLC90all+freq:
R906=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin090/all+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R906

Cls906=$(cat ../out/wn30/descmin090/all+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls906

Res906=$(awk "BEGIN {printf \"%.4f\",$Cls906/$R906}")
echo "	" Result=$Cls906/$R906
echo "	" Result=$Res906
echo " "
echo " "


## 100 Descendent, All
echo BLC100gloss:
R1004=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin100/gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R1004

Cls1004=$(cat ../out/wn30/descmin100/gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls1004

Res1004=$(awk "BEGIN {printf \"%.4f\",$Cls1004/$R1004}")
echo "	" Result=$Cls1004/$R1004
echo "	" Result=$Res1004
echo " "

## 100 Descendent, All+Gloss
echo BLC100gloss+freq:
R1005=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin100/gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R1005

Cls1005=$(cat ../out/wn30/descmin100/gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls1005

Res1005=$(awk "BEGIN {printf \"%.4f\",$Cls1005/$R1005}")
echo "	" Result=$Cls1005/$R1005
echo "	" Result=$Res1005
echo " "

## 100 Descendent, Frequency 
echo BLC100all+freq:
R1006=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin100/all+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R1006

Cls1006=$(cat ../out/wn30/descmin100/all+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls1006

Res1006=$(awk "BEGIN {printf \"%.4f\",$Cls1006/$R1006}")
echo "	" Result=$Cls1006/$R1006
echo "	" Result=$Res1006
echo " "
echo " "


## 15 Descendent, All
echo BLC15gloss:
R154=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin015/gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R154

Cls154=$(cat ../out/wn30/descmin015/gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls154

Res154=$(awk "BEGIN {printf \"%.4f\",$Cls154/$R154}")
echo "	" Result=$Cls154/$R154
echo "	" Result=$Res154
echo " "

## 15 Descendent, All+Gloss
echo BLC15gloss+freq:
R155=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin015/gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R155

Cls155=$(cat ../out/wn30/descmin015/gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls155

Res155=$(awk "BEGIN {printf \"%.4f\",$Cls155/$R155}")
echo "	" Result=$Cls155/$R155
echo "	" Result=$Res155
echo " "

## 15 Descendent, Frequency
echo BLC15all+freq:
R156=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin015/all+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R156

Cls156=$(cat ../out/wn30/descmin015/all+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls156

Res156=$(awk "BEGIN {printf \"%.4f\",$Cls156/$R156}")
echo "	" Result=$Cls156/$R156
echo "	" Result=$Res156
echo " "
echo " "


## 25 Descendent, All
echo BLC25gloss:
R254=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin025/gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R254

Cls254=$(cat ../out/wn30/descmin025/gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls254

Res254=$(awk "BEGIN {printf \"%.4f\",$Cls254/$R254}")
echo "	" Result=$Cls254/$R254
echo "	" Result=$Res254
echo " "

## 25 Descendent, All+Gloss
echo BLC25gloss+freq:
R255=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin025/gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R255

Cls255=$(cat ../out/wn30/descmin025/gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls255

Res255=$(awk "BEGIN {printf \"%.4f\",$Cls255/$R255}")
echo "	" Result=$Cls255/$R255
echo "	" Result=$Res255
echo " "

## 25 Descendent, Frequency 
echo BLC25all+freq:
R256=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin025/all+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R256

Cls256=$(cat ../out/wn30/descmin025/all+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls256

Res256=$(awk "BEGIN {printf \"%.4f\",$Cls256/$R256}")
echo "	" Result=$Cls256/$R256
echo "	" Result=$Res256
echo " "
echo " "


## 35 Descendent, All
echo BLC35gloss:
R354=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin035/gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R354

Cls354=$(cat ../out/wn30/descmin035/gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls354

Res354=$(awk "BEGIN {printf \"%.4f\",$Cls354/$R354}")
echo "	" Result=$Cls354/$R354
echo "	" Result=$Res354
echo " "

## 35 Descendent, All+Gloss
echo BLC35gloss+freq:
R355=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin035/gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R355

Cls355=$(cat ../out/wn30/descmin035/gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls355

Res355=$(awk "BEGIN {printf \"%.4f\",$Cls355/$R355}")
echo "	" Result=$Cls355/$R355
echo "	" Result=$Res355
echo " "

## 35 Descendent, Frequency 
echo BLC35all+freq:
R356=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin035/all+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R356

Cls356=$(cat ../out/wn30/descmin035/all+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls356

Res356=$(awk "BEGIN {printf \"%.4f\",$Cls356/$R356}")
echo "	" Result=$Cls356/$R356
echo "	" Result=$Res356
echo " "
echo " "


## 45 Descendent, All
echo BLC45gloss:
R454=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin045/gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R454

Cls454=$(cat ../out/wn30/descmin045/gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls454

Res454=$(awk "BEGIN {printf \"%.4f\",$Cls454/$R454}")
echo "	" Result=$Cls454/$R454
echo "	" Result=$Res454
echo " "

## 45 Descendent, All+Gloss
echo BLC45gloss+freq:
R455=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin045/gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R455

Cls455=$(cat ../out/wn30/descmin045/gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls455

Res455=$(awk "BEGIN {printf \"%.4f\",$Cls455/$R455}")
echo "	" Result=$Cls455/$R455
echo "	" Result=$Res455
echo " "

## 45 Descendent, Frequency 
echo BLC45all+freq:
R456=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin045/all+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R456

Cls456=$(cat ../out/wn30/descmin045/all+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls456

Res456=$(awk "BEGIN {printf \"%.4f\",$Cls456/$R456}")
echo "	" Result=$Cls456/$R456
echo "	" Result=$Res456
echo " "
echo " "

## 55 Descendent, All
echo BLC55gloss:
R554=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin055/gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R554

Cls554=$(cat ../out/wn30/descmin055/gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls554

Res554=$(awk "BEGIN {printf \"%.4f\",$Cls554/$R554}")
echo "	" Result=$Cls554/$R554
echo "	" Result=$Res554
echo " "

## 55 Descendent, All+Gloss
echo BLC55gloss+freq:
R555=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin055/gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R555

Cls555=$(cat ../out/wn30/descmin055/gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls555

Res555=$(awk "BEGIN {printf \"%.4f\",$Cls555/$R555}")
echo "	" Result=$Cls555/$R555
echo "	" Result=$Res555
echo " "

## 55 Descendent, Frequency 
echo BLC55all+freq:
R556=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin055/all+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R556

Cls556=$(cat ../out/wn30/descmin055/all+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls556

Res556=$(awk "BEGIN {printf \"%.4f\",$Cls556/$R556}")
echo "	" Result=$Cls556/$R556
echo "	" Result=$Res556
echo " "


## 65 Descendent, All
echo BLC65gloss:
R654=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin065/gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R654

Cls654=$(cat ../out/wn30/descmin065/gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls654

Res654=$(awk "BEGIN {printf \"%.4f\",$Cls654/$R654}")
echo "	" Result=$Cls654/$R654
echo "	" Result=$Res654
echo " "

## 65 Descendent, All+Gloss
echo BLC65gloss+freq:
R655=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin065/gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R655

Cls655=$(cat ../out/wn30/descmin065/gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls655

Res655=$(awk "BEGIN {printf \"%.4f\",$Cls655/$R655}")
echo "	" Result=$Cls655/$R655
echo "	" Result=$Res655
echo " "

## 65 Descendent, Frequency 
echo BLC65all+freq:
R656=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin065/all+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R656

Cls656=$(cat ../out/wn30/descmin065/all+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls656

Res656=$(awk "BEGIN {printf \"%.4f\",$Cls656/$R656}")
echo "	" Result=$Cls656/$R656
echo "	" Result=$Res656
echo " "
echo " "


## 75 Descendent, All
echo BLC75gloss:
R754=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin075/gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R754

Cls754=$(cat ../out/wn30/descmin075/gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls754

Res754=$(awk "BEGIN {printf \"%.4f\",$Cls754/$R754}")
echo "	" Result=$Cls754/$R754
echo "	" Result=$Res754
echo " "

## 75 Descendent, All+Gloss
echo BLC75gloss+freq:
R755=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin075/gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R755

Cls755=$(cat ../out/wn30/descmin075/gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls755

Res755=$(awk "BEGIN {printf \"%.4f\",$Cls755/$R755}")
echo "	" Result=$Cls755/$R755
echo "	" Result=$Res755
echo " "

## 75 Descendent, Frequency 
echo BLC75all+freq:
R756=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin075/all+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R756

Cls756=$(cat ../out/wn30/descmin075/all+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls756

Res756=$(awk "BEGIN {printf \"%.4f\",$Cls756/$R756}")
echo "	" Result=$Cls756/$R756
echo "	" Result=$Res756
echo " "
echo " "


## 85 Descendent, All
echo BLC85gloss:
R854=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin085/gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R854

Cls854=$(cat ../out/wn30/descmin085/gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls854

Res854=$(awk "BEGIN {printf \"%.4f\",$Cls854/$R854}")
echo "	" Result=$Cls854/$R854
echo "	" Result=$Res854
echo " "

## 85 Descendent, All+Gloss
echo BLC85gloss+freq:
R855=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin085/gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R855

Cls855=$(cat ../out/wn30/descmin085/gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls855

Res855=$(awk "BEGIN {printf \"%.4f\",$Cls855/$R855}")
echo "	" Result=$Cls855/$R855
echo "	" Result=$Res855
echo " "

## 85 Descendent, Frequency 
echo BLC85all+freq:
R856=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin085/all+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R856

Cls856=$(cat ../out/wn30/descmin085/all+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls856

Res856=$(awk "BEGIN {printf \"%.4f\",$Cls856/$R856}")
echo "	" Result=$Cls856/$R856
echo "	" Result=$Res856
echo " "
echo " "


## 95 Descendent, All
echo BLC95gloss:
R954=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin095/gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R954

Cls954=$(cat ../out/wn30/descmin095/gloss/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls954

Res954=$(awk "BEGIN {printf \"%.4f\",$Cls954/$R954}")
echo "	" Result=$Cls954/$R954
echo "	" Result=$Res954
echo " "

## 95 Descendent, All+Gloss
echo BLC95gloss+freq:
R955=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin095/gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R955

Cls955=$(cat ../out/wn30/descmin095/gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls955

Res955=$(awk "BEGIN {printf \"%.4f\",$Cls955/$R955}")
echo "	" Result=$Cls955/$R955
echo "	" Result=$Res955
echo " "

## 95 Descendent, Frequency 
echo BLC95all+freq:
R956=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin095/all+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R956

Cls956=$(cat ../out/wn30/descmin095/all+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls956

Res956=$(awk "BEGIN {printf \"%.4f\",$Cls956/$R956}")
echo "	" Result=$Cls956/$R956
echo "	" Result=$Res956
echo " "
echo " "





## 0 Descendent, All+Gloss+Freq
echo BLC0all+gloss+freq:

R07=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin000/all+gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R07

Cls07=$(cat ../out/wn30/descmin000/all+gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls07

Res07=$(awk "BEGIN {printf \"%.4f\",$Cls07/$R07}")
echo "	" Result=$Cls07/$R07
echo "	" Result=$Res07
echo " "


## 5 Descendent, All+Gloss+Freq
echo BLC5all+gloss+freq:

R57=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin005/all+gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R57

Cls57=$(cat ../out/wn30/descmin005/all+gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls57

Res57=$(awk "BEGIN {printf \"%.4f\",$Cls57/$R57}")
echo "	" Result=$Cls57/$R57
echo "	" Result=$Res57
echo " "


## 10 Descendent, All+Gloss+Freq
echo BLC10all+gloss+freq:

R107=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin010/all+gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R107

Cls107=$(cat ../out/wn30/descmin010/all+gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls107

Res107=$(awk "BEGIN {printf \"%.4f\",$Cls107/$R107}")
echo "	" Result=$Cls107/$R107
echo "	" Result=$Res107
echo " "


## 20 Descendent, All+Gloss+Freq
echo BLC20all+gloss+freq:

R207=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin020/all+gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R207

Cls207=$(cat ../out/wn30/descmin020/all+gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls207

Res207=$(awk "BEGIN {printf \"%.4f\",$Cls207/$R207}")
echo "	" Result=$Cls207/$R207
echo "	" Result=$Res207
echo " "


## 30 Descendent, All+Gloss+Freq
echo BLC30all+gloss+freq:

R307=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin030/all+gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R307

Cls307=$(cat ../out/wn30/descmin030/all+gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls307

Res307=$(awk "BEGIN {printf \"%.4f\",$Cls307/$R307}")
echo "	" Result=$Cls307/$R307
echo "	" Result=$Res307
echo " "


## 40 Descendent, All+Gloss+Freq
echo BLC40all+gloss+freq:

R407=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin070/all+gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R407

Cls407=$(cat ../out/wn30/descmin070/all+gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls407

Res407=$(awk "BEGIN {printf \"%.4f\",$Cls407/$R407}")
echo "	" Result=$Cls407/$R407
echo "	" Result=$Res407
echo " "


## 50 Descendent, All+Gloss+Freq
echo BLC50all+gloss+freq:

R507=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin050/all+gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R507

Cls507=$(cat ../out/wn30/descmin050/all+gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls507

Res507=$(awk "BEGIN {printf \"%.4f\",$Cls507/$R507}")
echo "	" Result=$Cls507/$R507
echo "	" Result=$Res507
echo " "


## 60 Descendent, All+Gloss+Freq
echo BLC60all+gloss+freq:

R607=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin060/all+gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R607

Cls607=$(cat ../out/wn30/descmin060/all+gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls607

Res607=$(awk "BEGIN {printf \"%.4f\",$Cls607/$R607}")
echo "	" Result=$Cls607/$R607
echo "	" Result=$Res607
echo " "


## 70 Descendent, All+Gloss+Freq
echo BLC70all+gloss+freq:

R707=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin070/all+gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R707

Cls707=$(cat ../out/wn30/descmin070/all+gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls707

Res707=$(awk "BEGIN {printf \"%.4f\",$Cls707/$R707}")
echo "	" Result=$Cls707/$R707
echo "	" Result=$Res707
echo " "


## 80 Descendent, All+Gloss+Freq
echo BLC80all+gloss+freq:

R807=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin080/all+gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R807

Cls807=$(cat ../out/wn30/descmin080/all+gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls807

Res807=$(awk "BEGIN {printf \"%.4f\",$Cls807/$R807}")
echo "	" Result=$Cls807/$R807
echo "	" Result=$Res807
echo " "


## 90 Descendent, All+Gloss+Freq
echo BLC90all+gloss+freq:

R907=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin090/all+gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R907

Cls907=$(cat ../out/wn30/descmin090/all+gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls907

Res907=$(awk "BEGIN {printf \"%.4f\",$Cls907/$R907}")
echo "	" Result=$Cls907/$R907
echo "	" Result=$Res907
echo " "


## 100 Descendent, All+Gloss+Freq
echo BLC100all+gloss+freq:

R1007=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin100/all+gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R1007

Cls1007=$(cat ../out/wn30/descmin100/all+gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls1007

Res1007=$(awk "BEGIN {printf \"%.4f\",$Cls1007/$R1007}")
echo "	" Result=$Cls1007/$R1007
echo "	" Result=$Res1007
echo " "


## 15 Descendent, All+Gloss+Freq
echo BLC15all+gloss+freq:

R157=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin015/all+gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R157

Cls157=$(cat ../out/wn30/descmin015/all+gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls157

Res157=$(awk "BEGIN {printf \"%.4f\",$Cls157/$R157}")
echo "	" Result=$Cls157/$R157
echo "	" Result=$Res157
echo " "


## 25 Descendent, All+Gloss+Freq
echo BLC25all+gloss+freq:

R257=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin025/all+gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R257

Cls257=$(cat ../out/wn30/descmin025/all+gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls257

Res257=$(awk "BEGIN {printf \"%.4f\",$Cls257/$R257}")
echo "	" Result=$Cls257/$R257
echo "	" Result=$Res257
echo " "


## 35 Descendent, All+Gloss+Freq
echo BLC35all+gloss+freq:

R357=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin035/all+gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R357

Cls357=$(cat ../out/wn30/descmin035/all+gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls357

Res357=$(awk "BEGIN {printf \"%.4f\",$Cls357/$R357}")
echo "	" Result=$Cls357/$R357
echo "	" Result=$Res357
echo " "


## 45 Descendent, All+Gloss+Freq
echo BLC45all+gloss+freq:

R457=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin045/all+gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R457

Cls457=$(cat ../out/wn30/descmin045/all+gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls457

Res457=$(awk "BEGIN {printf \"%.4f\",$Cls457/$R457}")
echo "	" Result=$Cls457/$R457
echo "	" Result=$Res457
echo " "


## 55 Descendent, All+Gloss+Freq
echo BLC55all+gloss+freq:

R557=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin055/all+gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R557

Cls557=$(cat ../out/wn30/descmin055/all+gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls557

Res557=$(awk "BEGIN {printf \"%.4f\",$Cls557/$R557}")
echo "	" Result=$Cls557/$R557
echo "	" Result=$Res557
echo " "


## 65 Descendent, All+Gloss+Freq
echo BLC65all+gloss+freq:

R657=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin065/all+gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R657

Cls657=$(cat ../out/wn30/descmin065/all+gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls657

Res657=$(awk "BEGIN {printf \"%.4f\",$Cls657/$R657}")
echo "	" Result=$Cls657/$R657
echo "	" Result=$Res657
echo " "



## 75 Descendent, All+Gloss+Freq
echo BLC75all+gloss+freq:

R757=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin075/all+gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R757

Cls757=$(cat ../out/wn30/descmin075/all+gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls757

Res757=$(awk "BEGIN {printf \"%.4f\",$Cls757/$R757}")
echo "	" Result=$Cls757/$R757
echo "	" Result=$Res757
echo " "


## 85 Descendent, All+Gloss+Freq
echo BLC85all+gloss+freq:

R857=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin085/all+gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R857

Cls857=$(cat ../out/wn30/descmin085/all+gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls857

Res857=$(awk "BEGIN {printf \"%.4f\",$Cls857/$R857}")
echo "	" Result=$Cls857/$R857
echo "	" Result=$Res857
echo " "


## 95 Descendent, All+Gloss+Freq
echo BLC95all+gloss+freq:

R957=$(tr ':' ' ' < ../dict/wn30/index_alt.sense | fgrep '%1' | gawk '$2=="'$1'"{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin095/all+gloss+freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R957

Cls957=$(cat ../out/wn30/descmin095/all+gloss+freq/BLCnoun.list | gawk '$2="'$1'"{print $1}'| wc | gawk '{print $1}')
echo "	" Cls = $Cls957

Res957=$(awk "BEGIN {printf \"%.4f\",$Cls957/$R957}")
echo "	" Result=$Cls957/$R957
echo "	" Result=$Res957
echo " "




echo d All All All All+Gloss All+Gloss All+Gloss Freq Freq Freq Gloss Gloss Gloss Gloss+Freq Gloss+Freq Gloss+Freq All+Freq All+Freq All+Freq All+Gloss+Freq All+Gloss+Freq All+Gloss+Freq
echo 0 $Cls01 $R01 $Res01 $Cls02 $R02 $Res02 $Cls03 $R03 $Res03 $Cls04 $R04 $Res04 $Cls05 $R05 $Res05 $Cls06 $R06 $Res06 $Cls07 $R07 $Res07 
echo 5 $Cls51 $R51 $Res51 $Cls52 $R52 $Res52 $Cls53 $R53 $Res53 $Cls54 $R54 $Res54 $Cls55 $R55 $Res55 $Cls56 $R56 $Res56 $Cls57 $R57 $Res57
echo 10 $Cls101 $R101 $Res101 $Cls102 $R102 $Res102 $Cls103 $R103 $Res103 $Cls104 $R104 $Res104 $Cls105 $R105 $Res105 $Cls106 $R106 $Res106 $Cls107 $R107 $Res107
echo 15 $Cls151 $R151 $Res151 $Cls152 $R152 $Res152 $Cls153 $R153 $Res153 $Cls154 $R154 $Res154 $Cls155 $R155 $Res155 $Cls156 $R156 $Res156 $Cls157 $R157 $Res157
echo 20 $Cls201 $R201 $Res201 $Cls202 $R202 $Res202 $Cls203 $R203 $Res203 $Cls204 $R204 $Res204 $Cls205 $R205 $Res205 $Cls206 $R206 $Res206 $Cls207 $R207 $Res207
echo 25 $Cls251 $R251 $Res251 $Cls252 $R252 $Res252 $Cls253 $R253 $Res253 $Cls254 $R254 $Res254 $Cls255 $R255 $Res255 $Cls256 $R256 $Res256 $Cls257 $R257 $Res257
echo 30 $Cls301 $R301 $Res301 $Cls302 $R302 $Res302 $Cls303 $R303 $Res303 $Cls304 $R304 $Res304 $Cls305 $R305 $Res305 $Cls306 $R306 $Res306 $Cls307 $R307 $Res307
echo 35 $Cls351 $R351 $Res351 $Cls352 $R352 $Res352 $Cls353 $R353 $Res353 $Cls354 $R354 $Res354 $Cls355 $R355 $Res355 $Cls356 $R356 $Res356 $Cls357 $R357 $Res357
echo 40 $Cls401 $R401 $Res401 $Cls402 $R402 $Res402 $Cls403 $R403 $Res403 $Cls404 $R404 $Res404 $Cls405 $R405 $Res405 $Cls406 $R406 $Res406 $Cls407 $R407 $Res407
echo 45 $Cls451 $R451 $Res451 $Cls452 $R452 $Res452 $Cls453 $R453 $Res453 $Cls454 $R454 $Res454 $Cls455 $R455 $Res455 $Cls456 $R456 $Res456 $Cls457 $R457 $Res457
echo 50 $Cls501 $R501 $Res501 $Cls502 $R502 $Res502 $Cls503 $R503 $Res503 $Cls504 $R504 $Res504 $Cls505 $R505 $Res505 $Cls506 $R506 $Res506 $Cls507 $R507 $Res507
echo 55 $Cls551 $R551 $Res551 $Cls552 $R552 $Res552 $Cls553 $R553 $Res553 $Cls554 $R554 $Res554 $Cls555 $R555 $Res555 $Cls556 $R556 $Res556 $Cls557 $R557 $Res557
echo 60 $Cls601 $R601 $Res601 $Cls602 $R602 $Res602 $Cls603 $R603 $Res603 $Cls604 $R604 $Res604 $Cls605 $R605 $Res605 $Cls606 $R606 $Res606 $Cls607 $R607 $Res607
echo 65 $Cls651 $R651 $Res651 $Cls652 $R652 $Res652 $Cls653 $R653 $Res653 $Cls654 $R654 $Res654 $Cls655 $R655 $Res655 $Cls656 $R656 $Res656 $Cls657 $R657 $Res657
echo 70 $Cls701 $R701 $Res701 $Cls702 $R702 $Res702 $Cls703 $R703 $Res703 $Cls704 $R704 $Res704 $Cls705 $R705 $Res705 $Cls706 $R706 $Res706 $Cls707 $R707 $Res707
echo 75 $Cls751 $R751 $Res751 $Cls752 $R752 $Res752 $Cls753 $R753 $Res753 $Cls754 $R754 $Res754 $Cls755 $R755 $Res755 $Cls756 $R756 $Res756 $Cls757 $R757 $Res757
echo 80 $Cls801 $R801 $Res801 $Cls802 $R802 $Res802 $Cls803 $R803 $Res803 $Cls804 $R804 $Res804 $Cls805 $R805 $Res805 $Cls806 $R806 $Res806 $Cls807 $R807 $Res807
echo 85 $Cls851 $R851 $Res851 $Cls852 $R852 $Res852 $Cls853 $R853 $Res853 $Cls854 $R854 $Res854 $Cls855 $R855 $Res855 $Cls856 $R856 $Res856 $Cls857 $R857 $Res857
echo 90 $Cls901 $R901 $Res901 $Cls902 $R902 $Res902 $Cls903 $R903 $Res903 $Cls904 $R904 $Res904 $Cls905 $R905 $Res905 $Cls906 $R906 $Res906 $Cls907 $R907 $Res907
echo 95 $Cls951 $R951 $Res951 $Cls952 $R952 $Res952 $Cls953 $R953 $Res953 $Cls954 $R954 $Res954 $Cls955 $R955 $Res955 $Cls956 $R956 $Res956 $Cls957 $R957 $Res957
echo 100 $Cls1001 $R1001 $Res1001 $Cls1002 $R1002 $Res1002 $Cls1003 $R1003 $Res1003 $Cls1004 $R1004 $Res1004 $Cls1005 $R1005 $Res1005 $Cls1006 $R1006 $Res1006 $Cls1007 $R1007 $Res1007

