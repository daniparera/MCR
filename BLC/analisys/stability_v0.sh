#!/bin/bash


## $1 Descendent, All
echo == $2 BLCs, $1 Descendents ==
echo Rel. Files:

Req01=$(join ../out/wn30/descmin$1/all/BLC$2.rel ../out/wn30/descmin$1/all+gloss/BLC$2.rel | join - ../out/wn30/descmin$1/freq/BLC$2.rel | gawk -f nawk/descolapsar.nawk | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF==2' | wc | gawk '{print $1}')
Rmed01=$(join ../out/wn30/descmin$1/all/BLC$2.rel ../out/wn30/descmin$1/all+gloss/BLC$2.rel | join - ../out/wn30/descmin$1/freq/BLC$2.rel | gawk -f nawk/descolapsar.nawk | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF==3' | wc | gawk '{print $1}')
Rdif01=$(join ../out/wn30/descmin$1/all/BLC$2.rel ../out/wn30/descmin$1/all+gloss/BLC$2.rel | join - ../out/wn30/descmin$1/freq/BLC$2.rel | gawk -f nawk/descolapsar.nawk | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF==4' | wc | gawk '{print $1}')

total01=$(wc ../out/wn30/descmin$1/all/BLC$2.rel | gawk '{print $1}')
eq01=$(join ../out/wn30/descmin$1/all/BLC$2.rel ../out/wn30/descmin$1/all+gloss/BLC$2.rel | gawk -f nawk/descolapsar.nawk | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF==2' | wc | gawk '{print $1}')
eq02=$(join ../out/wn30/descmin$1/all/BLC$2.rel ../out/wn30/descmin$1/freq/BLC$2.rel | gawk -f nawk/descolapsar.nawk | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF==2' | wc | gawk '{print $1}')
eq03=$(join ../out/wn30/descmin$1/freq/BLC$2.rel ../out/wn30/descmin$1/all+gloss/BLC$2.rel | gawk -f nawk/descolapsar.nawk | uniq | gawk -f nawk/colapsar.nawk | gawk 'NF==2' | wc | gawk '{print $1}')

echo "	" All three have same BLC "	" = $Req01
echo "	" Two synsets have same "		" = $Rmed01
echo "	" Diferents BLC "			" = $Rdif01
echo " "
echo "	" Total BLCS "			" = $total01
echo " "
echo "	" in All and All+Gloss "		" = $eq01
echo "	" in All and Freq "		" = $eq02
echo "	" in Freq and All+Gloss "		" = $eq03
echo " "

wc01=$(wc ../out/wn30/descmin$1/all/BLC$2.list | gawk '{print $1}')
wc02=$(wc ../out/wn30/descmin$1/all+gloss/BLC$2.list | gawk '{print $1}')
wc03=$(wc ../out/wn30/descmin$1/freq/BLC$2.list | gawk '{print $1}')

eq01a=$(comm -1 -2 <(cat ../out/wn30/descmin$1/all/BLC$2.list | gawk '{print $1}') <(cat ../out/wn30/descmin$1/all+gloss/BLC$2.list | gawk '{print $1}') | wc | gawk '{print $1}')
diff01a=$(comm -2 -3 <(cat ../out/wn30/descmin$1/all/BLC$2.list | gawk '{print $1}') <(cat ../out/wn30/descmin$1/all+gloss/BLC$2.list | gawk '{print $1}') | wc | gawk '{print $1}')
diff02a=$(comm -1 -3 <(cat ../out/wn30/descmin$1/all/BLC$2.list | gawk '{print $1}') <(cat ../out/wn30/descmin$1/all+gloss/BLC$2.list | gawk '{print $1}') | wc | gawk '{print $1}')


eq01b=$(comm -1 -2 <(cat ../out/wn30/descmin$1/all/BLC$2.list | gawk '{print $1}') <(cat ../out/wn30/descmin$1/freq/BLC$2.list | gawk '{print $1}') | wc | gawk '{print $1}')
diff01b=$(comm -2 -3 <(cat ../out/wn30/descmin$1/all/BLC$2.list | gawk '{print $1}') <(cat ../out/wn30/descmin$1/freq/BLC$2.list | gawk '{print $1}') | wc | gawk '{print $1}')
diff02b=$(comm -1 -3 <(cat ../out/wn30/descmin$1/all/BLC$2.list | gawk '{print $1}') <(cat ../out/wn30/descmin$1/freq/BLC$2.list | gawk '{print $1}') | wc | gawk '{print $1}')


eq01c=$(comm -1 -2 <(cat ../out/wn30/descmin$1/freq/BLC$2.list | gawk '{print $1}') <(cat ../out/wn30/descmin$1/all+gloss/BLC$2.list | gawk '{print $1}') | wc | gawk '{print $1}')
diff01c=$(comm -2 -3 <(cat ../out/wn30/descmin$1/freq/BLC$2.list | gawk '{print $1}') <(cat ../out/wn30/descmin$1/all+gloss/BLC$2.list | gawk '{print $1}') | wc | gawk '{print $1}')
diff02c=$(comm -1 -3 <(cat ../out/wn30/descmin$1/freq/BLC$2.list | gawk '{print $1}') <(cat ../out/wn30/descmin$1/all+gloss/BLC$2.list | gawk '{print $1}') | wc | gawk '{print $1}')

echo List. Files:
echo "	" Blcs All "	" = $wc01
echo "	" Blcs All+Gloss "" = $wc02
echo "	" Blcs Freq "	" = $wc03

echo "	" All vs All+Gloss
echo "		" in both "		" = $eq01a
echo "		" only in All "		" = $diff01a
echo "		" only in All+Gloss "	" = $diff02a

echo "	" All vs Freq
echo "		" in both "		" = $eq01b
echo "		" only in All "		" = $diff01b
echo "		" only in Freq "		" = $diff02b

echo "	" Freq vs All+Gloss
echo "		" in both "		" = $eq01c
echo "		" only in Freq "		" = $diff01c
echo "		" only in All+Gloss "	" = $diff02c

echo "	" All v All+G  "/" All "	" = $(awk "BEGIN {printf \"%.4f\",$eq01a/$wc01}")
echo "	" All v All+G  "/" All+G "	" = $(awk "BEGIN {printf \"%.4f\",$eq01a/$wc02}")
echo "	" All v Freq   "/" All "	" = $(awk "BEGIN {printf \"%.4f\",$eq01b/$wc01}")
echo "	" All v Freq   "/" Freq "	" = $(awk "BEGIN {printf \"%.4f\",$eq01b/$wc03}")
echo "	" Freq v All+G "/" Freq "	" = $(awk "BEGIN {printf \"%.4f\",$eq01c/$wc03}")
echo "	" Freq v All+G "/" All+G "	" = $(awk "BEGIN {printf \"%.4f\",$eq01c/$wc02}")

echo " "
echo " "







