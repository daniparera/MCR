#!/bin/bash

# Frequency Impact
echo "
  set datafile separator ','
  set title 'Stability - Noun List Files - Frequency impact addition in All vs Gloss'
  set key autotitle columnhead bottom
  set term png
  set output 'stability_noun_list_a_g_freq.png'
  plot 'stability_n_list.csv' using 1:38 with lines, 'stability_n_list.csv' using 1:39 with lines, 'stability_n_list.csv' using 1:28 with lines, 'stability_n_list.csv' using 1:29 with lines, 'stability_n_list.csv' using 1:40 with lines, 'stability_n_list.csv' using 1:41 with lines
" | gnuplot --persist

# Gloss Impact
echo "
  set datafile separator ','
  set title 'Stability - Noun List Files - Gloss relations impact addition in All vs Frequency'
  set key autotitle columnhead bottom
  set term png
  set output 'stability_noun_list_a_f_gloss.png'
  plot 'stability_n_list.csv' using 1:18 with lines, 'stability_n_list.csv' using 1:19 with lines, 'stability_n_list.csv' using 1:2 with lines, 'stability_n_list.csv' using 1:3 with lines, 'stability_n_list.csv' using 1:40 with lines, 'stability_n_list.csv' using 1:41 with lines
" | gnuplot --persist

# All Impact
echo "
  set datafile separator ','
  set title 'Stability - Noun List Files - All relations impact addition in Gloss vs Frequency'
  set key autotitle columnhead bottom
  set term png
  set output 'stability_noun_list_g_f_all.png'
  plot 'stability_n_list.csv' using 1:20 with lines, 'stability_n_list.csv' using 1:21 with lines, 'stability_n_list.csv' using 1:28 with lines, 'stability_n_list.csv' using 1:29 with lines, 'stability_n_list.csv' using 1:2 with lines, 'stability_n_list.csv' using 1:3 with lines
" | gnuplot --persist

# All vs Gloss
echo "
  set datafile separator ','
  set title 'Stability - Noun List Files - Gloss vs Frequency impact addition in All vs Gloss'
  set key autotitle columnhead bottom
  set term png
  set output 'stability_noun_list_g_f_all_gloss.png'
  plot 'stability_n_list.csv' using 1:38 with lines, 'stability_n_list.csv' using 1:39 with lines, 'stability_n_list.csv' using 1:10 with lines, 'stability_n_list.csv' using 1:11 with lines, 'stability_n_list.csv' using 1:28 with lines, 'stability_n_list.csv' using 1:29 with lines
" | gnuplot --persist

echo "
  set datafile separator ','
  set title 'Stability - Noun List Files - All vs Frequency impact addition in All vs Gloss'
  set key autotitle columnhead bottom
  set term png
  set output 'stability_noun_list_a_f_all_gloss.png'
  plot 'stability_n_list.csv' using 1:38 with lines, 'stability_n_list.csv' using 1:39 with lines, 'stability_n_list.csv' using 1:8 with lines, 'stability_n_list.csv' using 1:9 with lines, 'stability_n_list.csv' using 1:40 with lines, 'stability_n_list.csv' using 1:41 with lines
" | gnuplot --persist

echo "
  set datafile separator ','
  set title 'Stability - Noun List Files - All vs Gloss'
  set key autotitle columnhead bottom
  set term png
  set output 'stability_noun_list_ag.png'
  plot 'stability_n_list.csv' using 1:38 with lines, 'stability_n_list.csv' using 1:39 with lines, 'stability_n_list.csv' using 1:8 with lines, 'stability_n_list.csv' using 1:9 with lines, 'stability_n_list.csv' using 1:10 with lines, 'stability_n_list.csv' using 1:11 with lines
" | gnuplot --persist


# All vs Frequency
echo "
  set datafile separator ','
  set title 'Stability - Noun List Files - All vs Gloss impact addition in All vs Frequency'
  set key autotitle columnhead bottom
  set term png
  set output 'stability_noun_list_a_g_all_freq.png'
  plot 'stability_n_list.csv' using 1:18 with lines, 'stability_n_list.csv' using 1:19 with lines, 'stability_n_list.csv' using 1:40 with lines, 'stability_n_list.csv' using 1:41 with lines, 'stability_n_list.csv' using 1:26 with lines, 'stability_n_list.csv' using 1:27 with lines
" | gnuplot --persist

echo "
  set datafile separator ','
  set title 'Stability - Noun List Files - Gloss vs Frequency impact addition in All vs Frequency'
  set key autotitle columnhead bottom
  set term png
  set output 'stability_noun_list_g_f_all_freq.png'
  plot 'stability_n_list.csv' using 1:18 with lines, 'stability_n_list.csv' using 1:19 with lines, 'stability_n_list.csv' using 1:2 with lines, 'stability_n_list.csv' using 1:3 with lines, 'stability_n_list.csv' using 1:14 with lines, 'stability_n_list.csv' using 1:15 with lines
" | gnuplot --persist

echo "
  set datafile separator ','
  set title 'Stability - Noun List Files - All vs Frequency'
  set key autotitle columnhead bottom
  set term png
  set output 'stability_noun_list_af.png'
  plot 'stability_n_list.csv' using 1:18 with lines, 'stability_n_list.csv' using 1:19 with lines, 'stability_n_list.csv' using 1:14 with lines, 'stability_n_list.csv' using 1:15 with lines, 'stability_n_list.csv' using 1:26 with lines, 'stability_n_list.csv' using 1:27 with lines
" | gnuplot --persist


# Gloss vs Frequency
echo "
  set datafile separator ','
  set title 'Stability - Noun List Files - All vs Gloss impact addition in Gloss vs Frequency'
  set key autotitle columnhead bottom
  set term png
  set output 'stability_noun_list_a_g_gloss_freq.png'
  plot 'stability_n_list.csv' using 1:20 with lines, 'stability_n_list.csv' using 1:21 with lines, 'stability_n_list.csv' using 1:28 with lines, 'stability_n_list.csv' using 1:29 with lines, 'stability_n_list.csv' using 1:42 with lines, 'stability_n_list.csv' using 1:43 with lines
" | gnuplot --persist

echo "
  set datafile separator ','
  set title 'Stability - Noun List Files - All vs Frequency impact addition in Gloss vs Frequency'
  set key autotitle columnhead bottom
  set term png
  set output 'stability_noun_list_a_f_gloss_freq.png'
  plot 'stability_n_list.csv' using 1:20 with lines, 'stability_n_list.csv' using 1:21 with lines, 'stability_n_list.csv' using 1:2 with lines, 'stability_n_list.csv' using 1:3 with lines, 'stability_n_list.csv' using 1:22 with lines, 'stability_n_list.csv' using 1:23 with lines
" | gnuplot --persist

echo "
  set datafile separator ','
  set title 'Stability - Noun List Files - Gloss vs Frequency'
  set key autotitle columnhead bottom
  set term png
  set output 'stability_noun_list_gf.png'
  plot 'stability_n_list.csv' using 1:20 with lines, 'stability_n_list.csv' using 1:21 with lines, 'stability_n_list.csv' using 1:42 with lines, 'stability_n_list.csv' using 1:43 with lines, 'stability_n_list.csv' using 1:22 with lines, 'stability_n_list.csv' using 1:23 with lines
" | gnuplot --persist


echo "
  set datafile separator ','
  set title 'Stability Noun List Files 1'
  set key autotitle columnhead outside
  set term png
  set output 'stability_noun_list_1.png'
  plot 'stability_n_list.csv' using 1:10 with lines, 'stability_n_list.csv' using 1:12 with lines, 'stability_n_list.csv' using 1:21 with lines, 'stability_n_list.csv' using 1:24 with lines, 'stability_n_list.csv' using 1:25 with lines, 'stability_n_list.csv' using 1:33 with lines, 'stability_n_list.csv' using 1:35 with lines, 'stability_n_list.csv' using 1:37 with lines, 'stability_n_list.csv' using 1:42 with lines, 'stability_n_list.csv' using 1:43 with lines 
" | gnuplot --persist


echo "
  set datafile separator ','
  set title 'Stability Verb List Files 2'
  set key autotitle columnhead outside
  set term png
  set output 'stability_verb_list_2.png'
  plot 'stability_v_list.csv' using 1:5 with lines, 'stability_v_list.csv' using 1:13 with lines, 'stability_v_list.csv' using 1:17 with lines, 'stability_v_list.csv' using 1:18 with lines, 'stability_v_list.csv' using 1:19 with lines, 'stability_v_list.csv' using 1:24 with lines, 'stability_v_list.csv' using 1:26 with lines, 'stability_v_list.csv' using 1:31 with lines, 'stability_v_list.csv' using 1:39 with lines, 'stability_v_list.csv' using 1:41 with lines
" | gnuplot --persist


echo "
  set datafile separator ','
  set title 'Stability Verb List Files 1'
  set key autotitle columnhead outside
  set term png
  set output 'stability_verb_list_1.png'
  plot 'stability_v_list.csv' using 1:10 with lines, 'stability_v_list.csv' using 1:12 with lines, 'stability_v_list.csv' using 1:21 with lines, 'stability_v_list.csv' using 1:24 with lines, 'stability_v_list.csv' using 1:25 with lines, 'stability_v_list.csv' using 1:33 with lines, 'stability_v_list.csv' using 1:35 with lines, 'stability_v_list.csv' using 1:37 with lines, 'stability_v_list.csv' using 1:42 with lines, 'stability_v_list.csv' using 1:43 with lines 
" | gnuplot --persist


echo "
  set datafile separator ','
  set title 'Stability - Noun Relation Files - All relations impact'
  set key autotitle columnhead outside
  #set term png
  #set output 'stability_noun_rel_all.png'
  plot 'stability_n_rel.csv' using 1:10 with lines, 'stability_n_rel.csv' using 1:11 with lines, 'stability_n_rel.csv' using 1:20 with lines, 'stability_n_rel.csv' using 1:2 with lines, 'stability_n_rel.csv' using 1:5 with lines, 'stability_n_rel.csv' using 1:6 with lines, 'stability_n_rel.csv' using 1:15 with lines, 'stability_n_rel.csv' using 1:14 with lines, 'stability_n_rel.csv' using 1:8 with lines
" | gnuplot --persist

echo "
  set datafile separator ','
  set title 'Stability - Noun Relation Files - Gloss relations impact'
  set key autotitle columnhead outside
  set term png
  set output 'stability_noun_rel_gloss.png'
  plot 'stability_n_rel.csv' using 1:10 with lines, 'stability_n_rel.csv' using 1:11 with lines, 'stability_n_rel.csv' using 1:20 with lines, 'stability_n_rel.csv' using 1:2 with lines, 'stability_n_rel.csv' using 1:5 with lines, 'stability_n_rel.csv' using 1:6 with lines, 'stability_n_rel.csv' using 1:12 with lines, 'stability_n_rel.csv' using 1:21 with lines, 'stability_n_rel.csv' using 1:22 with lines
" | gnuplot --persist

echo "
  set datafile separator ','
  set title 'Stability - Noun Relation Files - Frequency impact'
  set key autotitle columnhead outside
  set term png
  set output 'stability_noun_rel_freq.png'
  plot 'stability_n_rel.csv' using 1:10 with lines, 'stability_n_rel.csv' using 1:11 with lines, 'stability_n_rel.csv' using 1:20 with lines, 'stability_n_rel.csv' using 1:8 with lines, 'stability_n_rel.csv' using 1:12 with lines, 'stability_n_rel.csv' using 1:14 with lines, 'stability_n_rel.csv' using 1:15 with lines, 'stability_n_rel.csv' using 1:21 with lines, 'stability_v_rel.csv' using 1:22 with lines
" | gnuplot --persist


echo "
  set datafile separator ','
  set title 'Stability Noun Rel Files 1'
  set key autotitle columnhead outside
  set term png
  set output 'stability_noun_rel_1.png'
  plot 'stability_n_rel.csv' using 1:6 with lines, 'stability_n_rel.csv' using 1:11 with lines, 'stability_n_rel.csv' using 1:13 with lines, 'stability_n_rel.csv' using 1:17 with lines, 'stability_n_rel.csv' using 1:18 with lines, 'stability_n_rel.csv' using 1:19 with lines, 'stability_n_rel.csv' using 1:21 with lines, 'stability_n_rel.csv' using 1:22 with lines 
" | gnuplot --persist

echo "
  set datafile separator ','
  set title 'Stability - Noun Relation Files - Others'
  set key autotitle columnhead outside
  set term png
  set output 'stability_noun_rel_others.png'
  plot 'stability_n_rel.csv' using 1:3 with lines, 'stability_n_rel.csv' using 1:4 with lines, 'stability_n_rel.csv' using 1:7 with lines, 'stability_n_rel.csv' using 1:9 with lines, 'stability_n_rel.csv' using 1:13 with lines, 'stability_n_rel.csv' using 1:16 with lines, 'stability_n_rel.csv' using 1:17 with lines, 'stability_n_rel.csv' using 1:18 with lines, 'stability_n_rel.csv' using 1:19 with lines 
" | gnuplot --persist


echo "
  set datafile separator ','
  set title 'Stability - Verb Relation Files - All relations impact'
  set key autotitle columnhead outside
  set term png
  set output 'stability_verb_rel_all.png'
  plot 'stability_v_rel.csv' using 1:10 with lines, 'stability_v_rel.csv' using 1:11 with lines, 'stability_v_rel.csv' using 1:20 with lines, 'stability_v_rel.csv' using 1:2 with lines, 'stability_v_rel.csv' using 1:5 with lines, 'stability_v_rel.csv' using 1:6 with lines, 'stability_v_rel.csv' using 1:15 with lines, 'stability_v_rel.csv' using 1:14 with lines, 'stability_v_rel.csv' using 1:8 with lines
" | gnuplot --persist

echo "
  set datafile separator ','
  set title 'Stability - Verb Relation Files - Gloss relations impact'
  set key autotitle columnhead outside
  set term png
  set output 'stability_verb_rel_gloss.png'
  plot 'stability_v_rel.csv' using 1:10 with lines, 'stability_v_rel.csv' using 1:11 with lines, 'stability_v_rel.csv' using 1:20 with lines, 'stability_v_rel.csv' using 1:2 with lines, 'stability_v_rel.csv' using 1:5 with lines, 'stability_v_rel.csv' using 1:6 with lines, 'stability_v_rel.csv' using 1:12 with lines, 'stability_v_rel.csv' using 1:21 with lines, 'stability_v_rel.csv' using 1:22 with lines
" | gnuplot --persist

echo "
  set datafile separator ','
  set title 'Stability - Verb Relation Files - Frequency impact'
  set key autotitle columnhead outside
  set term png
  set output 'stability_verb_rel_freq.png'
  plot 'stability_v_rel.csv' using 1:10 with lines, 'stability_v_rel.csv' using 1:11 with lines, 'stability_v_rel.csv' using 1:20 with lines, 'stability_v_rel.csv' using 1:8 with lines, 'stability_v_rel.csv' using 1:12 with lines, 'stability_v_rel.csv' using 1:14 with lines, 'stability_v_rel.csv' using 1:15 with lines, 'stability_v_rel.csv' using 1:21 with lines, 'stability_v_rel.csv' using 1:22 with lines
" | gnuplot --persist



echo "
  set datafile separator ','
  set title 'Stability - Verb Relation Files - Others'
  set key autotitle columnhead outside
  set term png
  set output 'stability_verb_rel_others.png'
  plot 'stability_v_rel.csv' using 1:3 with lines, 'stability_v_rel.csv' using 1:4 with lines, 'stability_v_rel.csv' using 1:7 with lines, 'stability_v_rel.csv' using 1:9 with lines, 'stability_v_rel.csv' using 1:13 with lines, 'stability_v_rel.csv' using 1:16 with lines, 'stability_v_rel.csv' using 1:17 with lines, 'stability_v_rel.csv' using 1:18 with lines, 'stability_v_rel.csv' using 1:19 with lines 
" | gnuplot --persist

