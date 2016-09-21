#!/bin/bash

wc_a=$(wc ../out/wn30/descmin$1/all/BLC$2.list | gawk '{print $1}')
wc_g=$(wc ../out/wn30/descmin$1/gloss/BLC$2.list | gawk '{print $1}')
wc_f=$(wc ../out/wn30/descmin$1/freq/BLC$2.list | gawk '{print $1}')
wc_ag=$(wc ../out/wn30/descmin$1/all+gloss/BLC$2.list | gawk '{print $1}')
wc_af=$(wc ../out/wn30/descmin$1/all+freq/BLC$2.list | gawk '{print $1}')
wc_gf=$(wc ../out/wn30/descmin$1/gloss+freq/BLC$2.list | gawk '{print $1}')
wc_agf=$(wc ../out/wn30/descmin$1/all+gloss+freq/BLC$2.list | gawk '{print $1}')

eq_a_g=$(comm -1 -2 <(cat ../out/wn30/descmin$1/all/BLC$2.list | gawk '{print $1}') <(cat ../out/wn30/descmin$1/gloss/BLC$2.list | gawk '{print $1}') | wc | gawk '{print $1}')
eq_a_f=$(comm -1 -2 <(cat ../out/wn30/descmin$1/all/BLC$2.list | gawk '{print $1}') <(cat ../out/wn30/descmin$1/freq/BLC$2.list | gawk '{print $1}') | wc | gawk '{print $1}')
eq_a_ag=$(comm -1 -2 <(cat ../out/wn30/descmin$1/all/BLC$2.list | gawk '{print $1}') <(cat ../out/wn30/descmin$1/all+gloss/BLC$2.list | gawk '{print $1}') | wc | gawk '{print $1}')
eq_a_af=$(comm -1 -2 <(cat ../out/wn30/descmin$1/all/BLC$2.list | gawk '{print $1}') <(cat ../out/wn30/descmin$1/all+freq/BLC$2.list | gawk '{print $1}') | wc | gawk '{print $1}')
eq_a_gf=$(comm -1 -2 <(cat ../out/wn30/descmin$1/all/BLC$2.list | gawk '{print $1}') <(cat ../out/wn30/descmin$1/gloss+freq/BLC$2.list | gawk '{print $1}') | wc | gawk '{print $1}')
eq_a_agf=$(comm -1 -2 <(cat ../out/wn30/descmin$1/all/BLC$2.list | gawk '{print $1}') <(cat ../out/wn30/descmin$1/all+gloss+freq/BLC$2.list | gawk '{print $1}') | wc | gawk '{print $1}')

eq_g_f=$(comm -1 -2 <(cat ../out/wn30/descmin$1/gloss/BLC$2.list | gawk '{print $1}') <(cat ../out/wn30/descmin$1/freq/BLC$2.list | gawk '{print $1}') | wc | gawk '{print $1}')
eq_g_ag=$(comm -1 -2 <(cat ../out/wn30/descmin$1/gloss/BLC$2.list | gawk '{print $1}') <(cat ../out/wn30/descmin$1/all+gloss/BLC$2.list | gawk '{print $1}') | wc | gawk '{print $1}')
eq_g_af=$(comm -1 -2 <(cat ../out/wn30/descmin$1/gloss/BLC$2.list | gawk '{print $1}') <(cat ../out/wn30/descmin$1/all+freq/BLC$2.list | gawk '{print $1}') | wc | gawk '{print $1}')
eq_g_gf=$(comm -1 -2 <(cat ../out/wn30/descmin$1/gloss/BLC$2.list | gawk '{print $1}') <(cat ../out/wn30/descmin$1/gloss+freq/BLC$2.list | gawk '{print $1}') | wc | gawk '{print $1}')
eq_g_agf=$(comm -1 -2 <(cat ../out/wn30/descmin$1/gloss/BLC$2.list | gawk '{print $1}') <(cat ../out/wn30/descmin$1/all+gloss+freq/BLC$2.list | gawk '{print $1}') | wc | gawk '{print $1}')

eq_f_ag=$(comm -1 -2 <(cat ../out/wn30/descmin$1/freq/BLC$2.list | gawk '{print $1}') <(cat ../out/wn30/descmin$1/all+gloss/BLC$2.list | gawk '{print $1}') | wc | gawk '{print $1}')
eq_f_af=$(comm -1 -2 <(cat ../out/wn30/descmin$1/freq/BLC$2.list | gawk '{print $1}') <(cat ../out/wn30/descmin$1/all+freq/BLC$2.list | gawk '{print $1}') | wc | gawk '{print $1}')
eq_f_gf=$(comm -1 -2 <(cat ../out/wn30/descmin$1/freq/BLC$2.list | gawk '{print $1}') <(cat ../out/wn30/descmin$1/gloss+freq/BLC$2.list | gawk '{print $1}') | wc | gawk '{print $1}')
eq_f_agf=$(comm -1 -2 <(cat ../out/wn30/descmin$1/freq/BLC$2.list | gawk '{print $1}') <(cat ../out/wn30/descmin$1/all+gloss+freq/BLC$2.list | gawk '{print $1}') | wc | gawk '{print $1}')

eq_ag_af=$(comm -1 -2 <(cat ../out/wn30/descmin$1/all+gloss/BLC$2.list | gawk '{print $1}') <(cat ../out/wn30/descmin$1/all+freq/BLC$2.list | gawk '{print $1}') | wc | gawk '{print $1}')
eq_ag_gf=$(comm -1 -2 <(cat ../out/wn30/descmin$1/all+gloss/BLC$2.list | gawk '{print $1}') <(cat ../out/wn30/descmin$1/gloss+freq/BLC$2.list | gawk '{print $1}') | wc | gawk '{print $1}')
eq_ag_agf=$(comm -1 -2 <(cat ../out/wn30/descmin$1/all+gloss/BLC$2.list | gawk '{print $1}') <(cat ../out/wn30/descmin$1/all+gloss+freq/BLC$2.list | gawk '{print $1}') | wc | gawk '{print $1}')

eq_af_gf=$(comm -1 -2 <(cat ../out/wn30/descmin$1/all+freq/BLC$2.list | gawk '{print $1}') <(cat ../out/wn30/descmin$1/gloss+freq/BLC$2.list | gawk '{print $1}') | wc | gawk '{print $1}')
eq_af_agf=$(comm -1 -2 <(cat ../out/wn30/descmin$1/all+freq/BLC$2.list | gawk '{print $1}') <(cat ../out/wn30/descmin$1/all+gloss+freq/BLC$2.list | gawk '{print $1}') | wc | gawk '{print $1}')

eq_gf_agf=$(comm -1 -2 <(cat ../out/wn30/descmin$1/gloss+freq/BLC$2.list | gawk '{print $1}') <(cat ../out/wn30/descmin$1/all+gloss+freq/BLC$2.list | gawk '{print $1}') | wc | gawk '{print $1}')


echo $1,$(awk "BEGIN {printf \"%.4f\",$eq_a_g/$wc_a}"),$(awk "BEGIN {printf \"%.4f\",$eq_a_f/$wc_a}"),$(awk "BEGIN {printf \"%.4f\",$eq_a_ag/$wc_a}"),$(awk "BEGIN {printf \"%.4f\",$eq_a_af/$wc_a}"),$(awk "BEGIN {printf \"%.4f\",$eq_a_gf/$wc_a}"),$(awk "BEGIN {printf \"%.4f\",$eq_a_agf/$wc_a}"),$(awk "BEGIN {printf \"%.4f\",$eq_a_g/$wc_g}"),$(awk "BEGIN {printf \"%.4f\",$eq_g_f/$wc_g}"),$(awk "BEGIN {printf \"%.4f\",$eq_g_ag/$wc_g}"),$(awk "BEGIN {printf \"%.4f\",$eq_g_af/$wc_g}"),$(awk "BEGIN {printf \"%.4f\",$eq_g_gf/$wc_g}"),$(awk "BEGIN {printf \"%.4f\",$eq_g_agf/$wc_g}"),$(awk "BEGIN {printf \"%.4f\",$eq_a_f/$wc_f}"),$(awk "BEGIN {printf \"%.4f\",$eq_g_f/$wc_f}"),$(awk "BEGIN {printf \"%.4f\",$eq_f_ag/$wc_f}"),$(awk "BEGIN {printf \"%.4f\",$eq_f_af/$wc_f}"),$(awk "BEGIN {printf \"%.4f\",$eq_f_gf/$wc_f}"),$(awk "BEGIN {printf \"%.4f\",$eq_f_agf/$wc_f}"),$(awk "BEGIN {printf \"%.4f\",$eq_a_ag/$wc_ag}"),$(awk "BEGIN {printf \"%.4f\",$eq_g_ag/$wc_ag}"),$(awk "BEGIN {printf \"%.4f\",$eq_f_ag/$wc_ag}"),$(awk "BEGIN {printf \"%.4f\",$eq_ag_af/$wc_ag}"),$(awk "BEGIN {printf \"%.4f\",$eq_ag_gf/$wc_ag}"),$(awk "BEGIN {printf \"%.4f\",$eq_ag_agf/$wc_ag}"),$(awk "BEGIN {printf \"%.4f\",$eq_a_af/$wc_af}"),$(awk "BEGIN {printf \"%.4f\",$eq_g_af/$wc_af}"),$(awk "BEGIN {printf \"%.4f\",$eq_f_af/$wc_af}"),$(awk "BEGIN {printf \"%.4f\",$eq_ag_af/$wc_af}"),$(awk "BEGIN {printf \"%.4f\",$eq_af_gf/$wc_af}"),$(awk "BEGIN {printf \"%.4f\",$eq_af_agf/$wc_af}"),$(awk "BEGIN {printf \"%.4f\",$eq_a_gf/$wc_gf}"),$(awk "BEGIN {printf \"%.4f\",$eq_g_gf/$wc_gf}"),$(awk "BEGIN {printf \"%.4f\",$eq_f_gf/$wc_gf}"),$(awk "BEGIN {printf \"%.4f\",$eq_ag_gf/$wc_gf}"),$(awk "BEGIN {printf \"%.4f\",$eq_af_gf/$wc_gf}"),$(awk "BEGIN {printf \"%.4f\",$eq_gf_agf/$wc_gf}"),$(awk "BEGIN {printf \"%.4f\",$eq_a_agf/$wc_agf}"),$(awk "BEGIN {printf \"%.4f\",$eq_g_agf/$wc_agf}"),$(awk "BEGIN {printf \"%.4f\",$eq_f_agf/$wc_agf}"),$(awk "BEGIN {printf \"%.4f\",$eq_af_agf/$wc_agf}"),$(awk "BEGIN {printf \"%.4f\",$eq_ag_agf/$wc_agf}"),$(awk "BEGIN {printf \"%.4f\",$eq_gf_agf/$wc_agf}")

