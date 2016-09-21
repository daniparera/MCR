#!/bin/bash


## General
R=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $1,$4"-"$2}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | perl -ne 's/([0-9]{8}-)//g;print' | gawk -f nawk/descolapsar.nawk | uniq | gawk -f nawk/colapsar.nawk | gawk '{n=n+1;s=s+(NF-1)}END{print n,s,s/n}')

echo "	" R_Nouns = $R

R=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $1,$4"-"$2}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | perl -ne 's/([0-9]{8}-)//g;print' | gawk -f nawk/descolapsar.nawk | uniq | gawk -f nawk/colapsar.nawk | gawk '{n=n+1;s=s+(NF-1)}END{print n,s,s/n}')

echo "	" R_Verbs = $R


## Domains

R=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4"-n",$1}' | sort | uniq | join - ../dict/wn30/domains_n_des.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')

echo "	" R_Dom_n = $R

Cls01=$(gawk '{print $2}' ../dict/wn30/domains_n_des.rel | sort | uniq | wc | gawk '{print $1}')
echo "	" Cls = $Cls01

Res01=$(awk "BEGIN {printf \"%.4f\",$Cls01/$R}")
echo "	" Result=$Cls01/$R
echo "	" Result=$Res01
echo " "


R=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $4"-v",$1}' | sort | uniq | join - ../dict/wn30/domains_v_des.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')

echo "	" R_Dom_v = $R

Cls01=$(gawk '{print $2}' ../dict/wn30/domains_v_des.rel | sort | uniq | wc | gawk '{print $1}')
echo "	" Cls = $Cls01

Res01=$(awk "BEGIN {printf \"%.4f\",$Cls01/$R}")
echo "	" Result=$Cls01/$R
echo "	" Result=$Res01
echo " "


## SUMO

R=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4"-n",$1}' | sort | uniq | join - ../dict/wn30/sumo_n_des.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')

echo "	" R_Sumo_n = $R

Cls01=$(gawk '{print $2}' ../dict/wn30/sumo_n_des.rel | sort | uniq | wc | gawk '{print $1}')
echo "	" Cls = $Cls01

Res01=$(awk "BEGIN {printf \"%.4f\",$Cls01/$R}")
echo "	" Result=$Cls01/$R
echo "	" Result=$Res01
echo " "


R=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $4"-v",$1}' | sort | uniq | join - ../dict/wn30/sumo_v_des.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')

echo "	" R_Sumo_v = $R

Cls01=$(gawk '{print $2}' ../dict/wn30/sumo_v_des.rel | sort | uniq | wc | gawk '{print $1}')
echo "	" Cls = $Cls01

Res01=$(awk "BEGIN {printf \"%.4f\",$Cls01/$R}")
echo "	" Result=$Cls01/$R
echo "	" Result=$Res01
echo " "


echo Noun analisys
## 0 Descendent, All
echo BLC0all:
R01=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin000/all/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R01

Cls01=$(wc ../out/wn30/descmin000/all/BLCnoun.list | gawk '{print $1}')
echo "	" Cls = $Cls01

Res01=$(awk "BEGIN {printf \"%.4f\",$Cls01/$R01}")
echo "	" Result=$Cls01/$R01
echo "	" Result=$Res01
echo " "

## 0 Descendent, All+Gloss
echo BLC0all+gloss:
R02=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin000/all+gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R02

Cls02=$(wc ../out/wn30/descmin000/all+gloss/BLCnoun.list | gawk '{print $1}')
echo "	" Cls = $Cls02

Res02=$(awk "BEGIN {printf \"%.4f\",$Cls02/$R02}")
echo "	" Result=$Cls02/$R02
echo "	" Result=$Res02
echo " "

## 0 Descendent, Frequency
echo BLC0freq:
R03=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin000/freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R03

Cls03=$(wc ../out/wn30/descmin000/freq/BLCnoun.list | gawk '{print $1}')
echo "	" Cls = $Cls03

Res03=$(awk "BEGIN {printf \"%.4f\",$Cls03/$R03}")
echo "	" Result=$Cls03/$R03
echo "	" Result=$Res03
echo " "
echo " "


## 5 Descendent, All
echo BLC5all:
R51=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin005/all/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R51

Cls51=$(wc ../out/wn30/descmin005/all/BLCnoun.list | gawk '{print $1}')
echo "	" Cls = $Cls51

Res51=$(awk "BEGIN {printf \"%.4f\",$Cls51/$R51}")
echo "	" Result=$Cls51/$R51
echo "	" Result=$Res51
echo " "

## 5 Descendent, All+Gloss
echo BLC5all+gloss:
R52=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin005/all+gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R52

Cls52=$(wc ../out/wn30/descmin005/all+gloss/BLCnoun.list | gawk '{print $1}')
echo "	" Cls = $Cls52

Res52=$(awk "BEGIN {printf \"%.4f\",$Cls52/$R52}")
echo "	" Result=$Cls52/$R52
echo "	" Result=$Res52
echo " "

## 5 Descendent, Frequency
echo BLC5freq:
R53=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin005/freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R53

Cls53=$(wc ../out/wn30/descmin005/freq/BLCnoun.list | gawk '{print $1}')
echo "	" Cls = $Cls53

Res53=$(awk "BEGIN {printf \"%.4f\",$Cls53/$R53}")
echo "	" Result=$Cls53/$R53
echo "	" Result=$Res53
echo " "
echo " "


## 10 Descendent, All
echo BLC10all:
R101=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin010/all/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R101

Cls101=$(wc ../out/wn30/descmin010/all/BLCnoun.list | gawk '{print $1}')
echo "	" Cls = $Cls101

Res101=$(awk "BEGIN {printf \"%.4f\",$Cls101/$R101}")
echo "	" Result=$Cls101/$R101
echo "	" Result=$Res101
echo " "

## 10 Descendent, All+Gloss
echo BLC10all+gloss:
R102=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin010/all+gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R102

Cls102=$(wc ../out/wn30/descmin010/all+gloss/BLCnoun.list | gawk '{print $1}')
echo "	" Cls = $Cls102

Res102=$(awk "BEGIN {printf \"%.4f\",$Cls102/$R102}")
echo "	" Result=$Cls102/$R102
echo "	" Result=$Res102
echo " "

## 10 Descendent, Frequency
echo BLC10freq:
R103=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin010/freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R103

Cls103=$(wc ../out/wn30/descmin010/freq/BLCnoun.list | gawk '{print $1}')
echo "	" Cls = $Cls103

Res103=$(awk "BEGIN {printf \"%.4f\",$Cls103/$R103}")
echo "	" Result=$Cls103/$R103
echo "	" Result=$Res103
echo " "
echo " "


## 20 Descendent, All
echo BLC20all:
R201=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin020/all/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R201

Cls201=$(wc ../out/wn30/descmin020/all/BLCnoun.list | gawk '{print $1}')
echo "	" Cls = $Cls201

Res201=$(awk "BEGIN {printf \"%.4f\",$Cls201/$R201}")
echo "	" Result=$Cls201/$R201
echo "	" Result=$Res201
echo " "

## 20 Descendent, All+Gloss
echo BLC20all+gloss:
R202=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin020/all+gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R202

Cls202=$(wc ../out/wn30/descmin020/all+gloss/BLCnoun.list | gawk '{print $1}')
echo "	" Cls = $Cls202

Res202=$(awk "BEGIN {printf \"%.4f\",$Cls202/$R202}")
echo "	" Result=$Cls202/$R202
echo "	" Result=$Res202
echo " "

## 20 Descendent, Frequency 
echo BLC20freq:
R203=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin020/freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R203

Cls203=$(wc ../out/wn30/descmin020/freq/BLCnoun.list | gawk '{print $1}')
echo "	" Cls = $Cls203

Res203=$(awk "BEGIN {printf \"%.4f\",$Cls203/$R203}")
echo "	" Result=$Cls203/$R203
echo "	" Result=$Res203
echo " "
echo " "


## 30 Descendent, All
echo BLC30all:
R301=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin030/all/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R301

Cls301=$(wc ../out/wn30/descmin030/all/BLCnoun.list | gawk '{print $1}')
echo "	" Cls = $Cls301

Res301=$(awk "BEGIN {printf \"%.4f\",$Cls301/$R301}")
echo "	" Result=$Cls301/$R301
echo "	" Result=$Res301
echo " "

## 30 Descendent, All+Gloss
echo BLC30all+gloss:
R302=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin030/all+gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R302

Cls302=$(wc ../out/wn30/descmin030/all+gloss/BLCnoun.list | gawk '{print $1}')
echo "	" Cls = $Cls302

Res302=$(awk "BEGIN {printf \"%.4f\",$Cls302/$R302}")
echo "	" Result=$Cls302/$R302
echo "	" Result=$Res302
echo " "

## 30 Descendent, Frequency 
echo BLC30freq:
R303=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin030/freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R303

Cls303=$(wc ../out/wn30/descmin030/freq/BLCnoun.list | gawk '{print $1}')
echo "	" Cls = $Cls303

Res303=$(awk "BEGIN {printf \"%.4f\",$Cls303/$R303}")
echo "	" Result=$Cls303/$R303
echo "	" Result=$Res303
echo " "
echo " "


## 35 Descendent, All
echo BLC35all:
R351=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin035/all/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R351

Cls351=$(wc ../out/wn30/descmin035/all/BLCnoun.list | gawk '{print $1}')
echo "	" Cls = $Cls351

Res351=$(awk "BEGIN {printf \"%.4f\",$Cls351/$R351}")
echo "	" Result=$Cls351/$R351
echo "	" Result=$Res351
echo " "


## 35 Descendent, All+Gloss
echo BLC35all+gloss:
R352=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin035/all+gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R352

Cls352=$(wc ../out/wn30/descmin035/all+gloss/BLCnoun.list | gawk '{print $1}')
echo "	" Cls = $Cls352

Res352=$(awk "BEGIN {printf \"%.4f\",$Cls352/$R352}")
echo "	" Result=$Cls352/$R352
echo "	" Result=$Res352
echo " "
echo " "


## 40 Descendent, All
echo BLC40all:
R401=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin040/all/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R401

Cls401=$(wc ../out/wn30/descmin040/all/BLCnoun.list | gawk '{print $1}')
echo "	" Cls = $Cls401

Res401=$(awk "BEGIN {printf \"%.4f\",$Cls401/$R401}")
echo "	" Result=$Cls401/$R401
echo "	" Result=$Res401
echo " "

## 40 Descendent, All+Gloss
echo BLC40all+gloss:
R402=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin040/all+gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R402

Cls402=$(wc ../out/wn30/descmin040/all+gloss/BLCnoun.list | gawk '{print $1}')
echo "	" Cls = $Cls402

Res402=$(awk "BEGIN {printf \"%.4f\",$Cls402/$R402}")
echo "	" Result=$Cls402/$R402
echo "	" Result=$Res402
echo " "

## 40 Descendent, Frequency 
echo BLC40freq:
R403=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin040/freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R403

Cls403=$(wc ../out/wn30/descmin040/freq/BLCnoun.list | gawk '{print $1}')
echo "	" Cls = $Cls403

Res403=$(awk "BEGIN {printf \"%.4f\",$Cls403/$R403}")
echo "	" Result=$Cls403/$R403
echo "	" Result=$Res403
echo " "
echo " "

## 50 Descendent, All
echo BLC50all:
R501=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin050/all/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R501

Cls501=$(wc ../out/wn30/descmin050/all/BLCnoun.list | gawk '{print $1}')
echo "	" Cls = $Cls501

Res501=$(awk "BEGIN {printf \"%.4f\",$Cls501/$R501}")
echo "	" Result=$Cls501/$R501
echo "	" Result=$Res501
echo " "

## 50 Descendent, All+Gloss
echo BLC50all+gloss:
R502=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin050/all+gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R502

Cls502=$(wc ../out/wn30/descmin050/all+gloss/BLCnoun.list | gawk '{print $1}')
echo "	" Cls = $Cls502

Res502=$(awk "BEGIN {printf \"%.4f\",$Cls502/$R502}")
echo "	" Result=$Cls502/$R502
echo "	" Result=$Res502
echo " "

## 50 Descendent, Frequency 
echo BLC50freq:
R503=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin050/freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R503

Cls503=$(wc ../out/wn30/descmin050/freq/BLCnoun.list | gawk '{print $1}')
echo "	" Cls = $Cls503

Res503=$(awk "BEGIN {printf \"%.4f\",$Cls503/$R503}")
echo "	" Result=$Cls503/$R503
echo "	" Result=$Res503
echo " "


## 60 Descendent, All
echo BLC60all:
R601=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin060/all/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R601

Cls601=$(wc ../out/wn30/descmin060/all/BLCnoun.list | gawk '{print $1}')
echo "	" Cls = $Cls601

Res601=$(awk "BEGIN {printf \"%.4f\",$Cls601/$R601}")
echo "	" Result=$Cls601/$R601
echo "	" Result=$Res601
echo " "

## 60 Descendent, All+Gloss
echo BLC60all+gloss:
R602=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin060/all+gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R602

Cls602=$(wc ../out/wn30/descmin060/all+gloss/BLCnoun.list | gawk '{print $1}')
echo "	" Cls = $Cls602

Res602=$(awk "BEGIN {printf \"%.4f\",$Cls602/$R602}")
echo "	" Result=$Cls602/$R602
echo "	" Result=$Res602
echo " "

## 60 Descendent, Frequency 
echo BLC60freq:
R603=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin060/freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R603

Cls603=$(wc ../out/wn30/descmin060/freq/BLCnoun.list | gawk '{print $1}')
echo "	" Cls = $Cls603

Res603=$(awk "BEGIN {printf \"%.4f\",$Cls603/$R603}")
echo "	" Result=$Cls603/$R603
echo "	" Result=$Res603
echo " "
echo " "

## 70 Descendent, All
echo BLC70all:
R701=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin070/all/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R701

Cls701=$(wc ../out/wn30/descmin070/all/BLCnoun.list | gawk '{print $1}')
echo "	" Cls = $Cls701

Res701=$(awk "BEGIN {printf \"%.4f\",$Cls701/$R701}")
echo "	" Result=$Cls701/$R701
echo "	" Result=$Res701
echo " "

## 70 Descendent, All+Gloss
echo BLC70all+gloss:
R702=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin070/all+gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R702

Cls702=$(wc ../out/wn30/descmin070/all+gloss/BLCnoun.list | gawk '{print $1}')
echo "	" Cls = $Cls702

Res702=$(awk "BEGIN {printf \"%.4f\",$Cls702/$R702}")
echo "	" Result=$Cls702/$R702
echo "	" Result=$Res702
echo " "

## 70 Descendent, Frequency 
echo BLC70freq:
R703=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin070/freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R703

Cls703=$(wc ../out/wn30/descmin070/freq/BLCnoun.list | gawk '{print $1}')
echo "	" Cls = $Cls703

Res703=$(awk "BEGIN {printf \"%.4f\",$Cls703/$R703}")
echo "	" Result=$Cls703/$R703
echo "	" Result=$Res703
echo " "
echo " "

## 80 Descendent, All
echo BLC80all:
R801=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin080/all/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R801

Cls801=$(wc ../out/wn30/descmin080/all/BLCnoun.list | gawk '{print $1}')
echo "	" Cls = $Cls801

Res801=$(awk "BEGIN {printf \"%.4f\",$Cls801/$R801}")
echo "	" Result=$Cls801/$R801
echo "	" Result=$Res801
echo " "


## 80 Descendent, All+Gloss
echo BLC80all+gloss:
R802=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin080/all+gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R802

Cls802=$(wc ../out/wn30/descmin080/all+gloss/BLCnoun.list | gawk '{print $1}')
echo "	" Cls = $Cls802

Res802=$(awk "BEGIN {printf \"%.4f\",$Cls802/$R802}")
echo "	" Result=$Cls802/$R802
echo "	" Result=$Res802
echo " "

## 80 Descendent, Frequency 
echo BLC80freq:
R803=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin080/freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R803

Cls803=$(wc ../out/wn30/descmin080/freq/BLCnoun.list | gawk '{print $1}')
echo "	" Cls = $Cls803

Res803=$(awk "BEGIN {printf \"%.4f\",$Cls803/$R803}")
echo "	" Result=$Cls803/$R803
echo "	" Result=$Res803
echo " "
echo " "


## 100 Descendent, All
echo BLC100all:
R1001=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin100/all/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R1001

Cls1001=$(wc ../out/wn30/descmin100/all/BLCnoun.list | gawk '{print $1}')
echo "	" Cls = $Cls1001

Res1001=$(awk "BEGIN {printf \"%.4f\",$Cls1001/$R1001}")
echo "	" Result=$Cls1001/$R1001
echo "	" Result=$Res1001
echo " "

## 100 Descendent, All+Gloss
echo BLC100all+gloss:
R1002=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin100/all+gloss/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R1002

Cls1002=$(wc ../out/wn30/descmin100/all+gloss/BLCnoun.list | gawk '{print $1}')
echo "	" Cls = $Cls1002

Res1002=$(awk "BEGIN {printf \"%.4f\",$Cls1002/$R1002}")
echo "	" Result=$Cls1002/$R1002
echo "	" Result=$Res1002
echo " "

## 100 Descendent, Frequency 
echo BLC100freq:
R1003=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%1' | gawk '{print $4"-n",$1}' | sort | uniq | join - ../out/wn30/descmin100/freq/BLCnoun.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R1003

Cls1003=$(wc ../out/wn30/descmin100/freq/BLCnoun.list | gawk '{print $1}')
echo "	" Cls = $Cls1003

Res1003=$(awk "BEGIN {printf \"%.4f\",$Cls1003/$R1003}")
echo "	" Result=$Cls1003/$R1003
echo "	" Result=$Res1003
echo " "
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

echo " "
echo " "
echo " "



echo Verb analisys
## 0 Descendent, All
echo BLC0all:
R01=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $4"-v",$1}' | sort | uniq | join - ../out/wn30/descmin000/all/BLCverb.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R01

Cls01=$(wc ../out/wn30/descmin000/all/BLCverb.list | gawk '{print $1}')
echo "	" Cls = $Cls01

Res=$(awk "BEGIN {printf \"%.4f\",$Cls01/$R01}")
echo "	" Result=$Cls01/$R01
echo "	" Result=$Res01
echo " "

## 0 Descendent, All+Gloss
echo BLC0all+gloss:
R02=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $4"-v",$1}' | sort | uniq | join - ../out/wn30/descmin000/all+gloss/BLCverb.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R02

Cls02=$(wc ../out/wn30/descmin000/all+gloss/BLCverb.list | gawk '{print $1}')
echo "	" Cls = $Cls02

Res02=$(awk "BEGIN {printf \"%.4f\",$Cls02/$R02}")
echo "	" Result=$Cls02/$R02
echo "	" Result=$Res02
echo " "

## 0 Descendent, Frequency
echo BLC0freq:
R03=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $4"-v",$1}' | sort | uniq | join - ../out/wn30/descmin000/freq/BLCverb.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R03

Cls=$(wc ../out/wn30/descmin000/freq/BLCverb.list | gawk '{print $1}')
echo "	" Cls = $Cls

Res=$(awk "BEGIN {printf \"%.4f\",$Cls/$R03}")
echo "	" Result=$Cls/$R03
echo "	" Result=$Res
echo " "
echo " "


## 5 Descendent, All
echo BLC5all:
R51=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $4"-v",$1}' | sort | uniq | join - ../out/wn30/descmin005/all/BLCverb.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R51

Cls51=$(wc ../out/wn30/descmin005/all/BLCverb.list | gawk '{print $1}')
echo "	" Cls = $Cls51

Res51=$(awk "BEGIN {printf \"%.4f\",$Cls/$R51}")
echo "	" Result=$Cls/$R51
echo "	" Result=$Res51
echo " "

## 5 Descendent, All+Gloss
echo BLC5all+gloss:
R52=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $4"-v",$1}' | sort | uniq | join - ../out/wn30/descmin005/all+gloss/BLCverb.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R52

Cls52=$(wc ../out/wn30/descmin005/all+gloss/BLCverb.list | gawk '{print $1}')
echo "	" Cls = $Cls52

Res52=$(awk "BEGIN {printf \"%.4f\",$Cls/$R52}")
echo "	" Result=$Cls/$R52
echo "	" Result=$Res52
echo " "

## 5 Descendent, Frequency
echo BLC5freq:
R53=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $4"-v",$1}' | sort | uniq | join - ../out/wn30/descmin005/freq/BLCverb.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R53

Cls53=$(wc ../out/wn30/descmin005/freq/BLCverb.list | gawk '{print $1}')
echo "	" Cls = $Cls53

Res53=$(awk "BEGIN {printf \"%.4f\",$Cls/$R53}")
echo "	" Result=$Cls53/$R53
echo "	" Result=$Res53
echo " "
echo " "


## 10 Descendent, All
echo BLC10all:
R101=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $4"-v",$1}' | sort | uniq | join - ../out/wn30/descmin010/all/BLCverb.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R101

Cls101=$(wc ../out/wn30/descmin010/all/BLCverb.list | gawk '{print $1}')
echo "	" Cls = $Cls101

Res101=$(awk "BEGIN {printf \"%.4f\",$Cls101/$R101}")
echo "	" Result=$Cls101/$R101
echo "	" Result=$Res101
echo " "

## 10 Descendent, All+Gloss
echo BLC10all+gloss:
R102=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $4"-v",$1}' | sort | uniq | join - ../out/wn30/descmin010/all+gloss/BLCverb.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R102

Cls102=$(wc ../out/wn30/descmin010/all+gloss/BLCverb.list | gawk '{print $1}')
echo "	" Cls = $Cls102

Res102=$(awk "BEGIN {printf \"%.4f\",$Cls102/$R102}")
echo "	" Result=$Cls102/$R102
echo "	" Result=$Res102
echo " "

## 10 Descendent, Frequency
echo BLC10freq:
R103=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $4"-v",$1}' | sort | uniq | join - ../out/wn30/descmin010/freq/BLCverb.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R103

Cls103=$(wc ../out/wn30/descmin010/freq/BLCverb.list | gawk '{print $1}')
echo "	" Cls = $Cls103

Res103=$(awk "BEGIN {printf \"%.4f\",$Cls103/$R103}")
echo "	" Result=$Cls103/$R103
echo "	" Result=$Res103
echo " "
echo " "


## 20 Descendent, All
echo BLC20all:
R201=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $4"-v",$1}' | sort | uniq | join - ../out/wn30/descmin020/all/BLCverb.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R201

Cls201=$(wc ../out/wn30/descmin020/all/BLCverb.list | gawk '{print $1}')
echo "	" Cls = $Cls201

Res201=$(awk "BEGIN {printf \"%.4f\",$Cls201/$R201}")
echo "	" Result=$Cls201/$R201
echo "	" Result=$Res201
echo " "

## 20 Descendent, All+Gloss
echo BLC20all+gloss:
R202=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $4"-v",$1}' | sort | uniq | join - ../out/wn30/descmin020/all+gloss/BLCverb.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R202

Cls202=$(wc ../out/wn30/descmin020/all+gloss/BLCverb.list | gawk '{print $1}')
echo "	" Cls = $Cls202

Res202=$(awk "BEGIN {printf \"%.4f\",$Cls202/$R202}")
echo "	" Result=$Cls202/$R202
echo "	" Result=$Res202
echo " "

## 20 Descendent, Frequency 
echo BLC20freq:
R203=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $4"-v",$1}' | sort | uniq | join - ../out/wn30/descmin020/freq/BLCverb.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R203

Cls203=$(wc ../out/wn30/descmin020/freq/BLCverb.list | gawk '{print $1}')
echo "	" Cls = $Cls203

Res203=$(awk "BEGIN {printf \"%.4f\",$Cls203/$R203}")
echo "	" Result=$Cls203/$R203
echo "	" Result=$Res203
echo " "
echo " "


## 30 Descendent, All
echo BLC30all:
R301=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $4"-v",$1}' | sort | uniq | join - ../out/wn30/descmin030/all/BLCverb.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R301

Cls301=$(wc ../out/wn30/descmin030/all/BLCverb.list | gawk '{print $1}')
echo "	" Cls = $Cls301

Res301=$(awk "BEGIN {printf \"%.4f\",$Cls301/$R301}")
echo "	" Result=$Cls301/$R301
echo "	" Result=$Res301
echo " "

## 30 Descendent, All+Gloss
echo BLC30all+gloss:
R302=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $4"-v",$1}' | sort | uniq | join - ../out/wn30/descmin030/all+gloss/BLCverb.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R302

Cls302=$(wc ../out/wn30/descmin030/all+gloss/BLCverb.list | gawk '{print $1}')
echo "	" Cls = $Cls302

Res302=$(awk "BEGIN {printf \"%.4f\",$Cls302/$R302}")
echo "	" Result=$Cls302/$R302
echo "	" Result=$Res302
echo " "

## 30 Descendent, Frequency 
echo BLC30freq:
R303=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $4"-v",$1}' | sort | uniq | join - ../out/wn30/descmin030/freq/BLCverb.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R303

Cls303=$(wc ../out/wn30/descmin030/freq/BLCverb.list | gawk '{print $1}')
echo "	" Cls = $Cls303

Res303=$(awk "BEGIN {printf \"%.4f\",$Cls303/$R303}")
echo "	" Result=$Cls303/$R303
echo "	" Result=$Res303
echo " "
echo " "


## 40 Descendent, All
echo BLC40all:
R401=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $4"-v",$1}' | sort | uniq | join - ../out/wn30/descmin040/all/BLCverb.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R401

Cls401=$(wc ../out/wn30/descmin040/all/BLCverb.list | gawk '{print $1}')
echo "	" Cls = $Cls401

Res401=$(awk "BEGIN {printf \"%.4f\",$Cls401/$R401}")
echo "	" Result=$Cls401/$R401
echo "	" Result=$Res401
echo " "

## 40 Descendent, All+Gloss
echo BLC40all+gloss:
R402=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $4"-v",$1}' | sort | uniq | join - ../out/wn30/descmin040/all+gloss/BLCverb.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R402

Cls402=$(wc ../out/wn30/descmin040/all+gloss/BLCverb.list | gawk '{print $1}')
echo "	" Cls = $Cls402

Res402=$(awk "BEGIN {printf \"%.4f\",$Cls402/$R402}")
echo "	" Result=$Cls402/$R402
echo "	" Result=$Res402
echo " "

## 40 Descendent, Frequency 
echo BLC40freq:
R403=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $4"-v",$1}' | sort | uniq | join - ../out/wn30/descmin040/freq/BLCverb.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R403

Cls403=$(wc ../out/wn30/descmin040/freq/BLCverb.list | gawk '{print $1}')
echo "	" Cls = $Cls403

Res403=$(awk "BEGIN {printf \"%.4f\",$Cls403/$R403}")
echo "	" Result=$Cls403/$R403
echo "	" Result=$Res403
echo " "
echo " "

## 50 Descendent, All
echo BLC50all:
R501=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $4"-v",$1}' | sort | uniq | join - ../out/wn30/descmin050/all/BLCverb.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R501

Cls501=$(wc ../out/wn30/descmin050/all/BLCverb.list | gawk '{print $1}')
echo "	" Cls = $Cls501

Res501=$(awk "BEGIN {printf \"%.4f\",$Cls501/$R501}")
echo "	" Result=$Cls501/$R501
echo "	" Result=$Res501
echo " "

## 50 Descendent, All+Gloss
echo BLC50all+gloss:
R502=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $4"-v",$1}' | sort | uniq | join - ../out/wn30/descmin050/all+gloss/BLCverb.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R502

Cls502=$(wc ../out/wn30/descmin050/all+gloss/BLCverb.list | gawk '{print $1}')
echo "	" Cls = $Cls502

Res502=$(awk "BEGIN {printf \"%.4f\",$Cls502/$R502}")
echo "	" Result=$Cls502/$R502
echo "	" Result=$Res502
echo " "

## 50 Descendent, Frequency 
echo BLC50freq:
R503=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $4"-v",$1}' | sort | uniq | join - ../out/wn30/descmin050/freq/BLCverb.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R503

Cls503=$(wc ../out/wn30/descmin050/freq/BLCverb.list | gawk '{print $1}')
echo "	" Cls = $Cls503

Res503=$(awk "BEGIN {printf \"%.4f\",$Cls503/$R503}")
echo "	" Result=$Cls503/$R503
echo "	" Result=$Res503
echo " "


## 60 Descendent, All
echo BLC60all:
R601=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $4"-v",$1}' | sort | uniq | join - ../out/wn30/descmin060/all/BLCverb.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R601

Cls601=$(wc ../out/wn30/descmin060/all/BLCverb.list | gawk '{print $1}')
echo "	" Cls = $Cls601

Res601=$(awk "BEGIN {printf \"%.4f\",$Cls601/$R601}")
echo "	" Result=$Cls601/$R601
echo "	" Result=$Res601
echo " "

## 60 Descendent, All+Gloss
echo BLC60all+gloss:
R602=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $4"-v",$1}' | sort | uniq | join - ../out/wn30/descmin060/all+gloss/BLCverb.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R602

Cls602=$(wc ../out/wn30/descmin060/all+gloss/BLCverb.list | gawk '{print $1}')
echo "	" Cls = $Cls602

Res602=$(awk "BEGIN {printf \"%.4f\",$Cls602/$R602}")
echo "	" Result=$Cls602/$R602
echo "	" Result=$Res602
echo " "

## 60 Descendent, Frequency 
echo BLC60freq:
R603=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $4"-v",$1}' | sort | uniq | join - ../out/wn30/descmin060/freq/BLCverb.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R603

Cls603=$(wc ../out/wn30/descmin060/freq/BLCverb.list | gawk '{print $1}')
echo "	" Cls = $Cls603

Res603=$(awk "BEGIN {printf \"%.4f\",$Cls603/$R603}")
echo "	" Result=$Cls603/$R603
echo "	" Result=$Res603
echo " "
echo " "

## 70 Descendent, All
echo BLC70all:
R701=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $4"-v",$1}' | sort | uniq | join - ../out/wn30/descmin070/all/BLCverb.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R701

Cls701=$(wc ../out/wn30/descmin070/all/BLCverb.list | gawk '{print $1}')
echo "	" Cls = $Cls701

Res701=$(awk "BEGIN {printf \"%.4f\",$Cls701/$R701}")
echo "	" Result=$Cls701/$R701
echo "	" Result=$Res701
echo " "

## 70 Descendent, All+Gloss
echo BLC70all+gloss:
R702=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $4"-v",$1}' | sort | uniq | join - ../out/wn30/descmin070/all+gloss/BLCverb.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R702

Cls702=$(wc ../out/wn30/descmin070/all+gloss/BLCverb.list | gawk '{print $1}')
echo "	" Cls = $Cls702

Res702=$(awk "BEGIN {printf \"%.4f\",$Cls702/$R702}")
echo "	" Result=$Cls702/$R702
echo "	" Result=$Res702
echo " "

## 70 Descendent, Frequency 
echo BLC70freq:
R703=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $4"-v",$1}' | sort | uniq | join - ../out/wn30/descmin070/freq/BLCverb.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R703

Cls703=$(wc ../out/wn30/descmin070/freq/BLCverb.list | gawk '{print $1}')
echo "	" Cls = $Cls703

Res703=$(awk "BEGIN {printf \"%.4f\",$Cls703/$R703}")
echo "	" Result=$Cls703/$R703
echo "	" Result=$Res703
echo " "
echo " "

## 80 Descendent, All
echo BLC80all:
R801=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $4"-v",$1}' | sort | uniq | join - ../out/wn30/descmin080/all/BLCverb.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R801

Cls801=$(wc ../out/wn30/descmin080/all/BLCverb.list | gawk '{print $1}')
echo "	" Cls = $Cls801

Res801=$(awk "BEGIN {printf \"%.4f\",$Cls801/$R801}")
echo "	" Result=$Cls801/$R801
echo "	" Result=$Res801
echo " "


## 80 Descendent, All+Gloss
echo BLC80all+gloss:
R802=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $4"-v",$1}' | sort | uniq | join - ../out/wn30/descmin080/all+gloss/BLCverb.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R802

Cls802=$(wc ../out/wn30/descmin080/all+gloss/BLCverb.list | gawk '{print $1}')
echo "	" Cls = $Cls802

Res802=$(awk "BEGIN {printf \"%.4f\",$Cls802/$R802}")
echo "	" Result=$Cls802/$R802
echo "	" Result=$Res802
echo " "

## 80 Descendent, Frequency 
echo BLC80freq:
R803=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $4"-v",$1}' | sort | uniq | join - ../out/wn30/descmin080/freq/BLCverb.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R803

Cls803=$(wc ../out/wn30/descmin080/freq/BLCverb.list | gawk '{print $1}')
echo "	" Cls = $Cls803

Res803=$(awk "BEGIN {printf \"%.4f\",$Cls803/$R803}")
echo "	" Result=$Cls803/$R803
echo "	" Result=$Res803
echo " "
echo " "


## 100 Descendent, All
echo BLC100all:
R1001=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $4"-v",$1}' | sort | uniq | join - ../out/wn30/descmin100/all/BLCverb.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R1001

Cls1001=$(wc ../out/wn30/descmin100/all/BLCverb.list | gawk '{print $1}')
echo "	" Cls = $Cls1001

Res1001=$(awk "BEGIN {printf \"%.4f\",$Cls1001/$R1001}")
echo "	" Result=$Cls1001/$R1001
echo "	" Result=$Res1001
echo " "

## 100 Descendent, All+Gloss
echo BLC100all+gloss:
R1002=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $4"-v",$1}' | sort | uniq | join - ../out/wn30/descmin100/all+gloss/BLCverb.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R1002

Cls1002=$(wc ../out/wn30/descmin100/all+gloss/BLCverb.list | gawk '{print $1}')
echo "	" Cls = $Cls1002

Res1002=$(awk "BEGIN {printf \"%.4f\",$Cls1002/$R1002}")
echo "	" Result=$Cls1002/$R1002
echo "	" Result=$Res1002
echo " "

## 100 Descendent, Frequency 
echo BLC100freq:
R1003=$(tr ':' ' ' < ../dict/wn30/index.sense | fgrep '%2' | gawk '{print $4"-v",$1}' | sort | uniq | join - ../out/wn30/descmin100/freq/BLCverb.rel | gawk '{print $2,$3}' | sort | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF>2' | wc | gawk '{print ($2-$1)/$1}')
echo "	" R = $R1003

Cls1003=$(wc ../out/wn30/descmin100/freq/BLCverb.list | gawk '{print $1}')
echo "	" Cls = $Cls1003

Res1003=$(awk "BEGIN {printf \"%.4f\",$Cls1003/$R1003}")
echo "	" Result=$Cls1003/$R1003
echo "	" Result=$Res1003
echo " "
echo " "
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
