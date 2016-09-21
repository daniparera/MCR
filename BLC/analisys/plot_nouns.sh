#!/bin/bash

echo "
  set datafile separator ','
  set title 'Second'
  set key autotitle columnhead outside
  plot 'stability_noun.csv' using 1:5 with lines, 'stability_noun.csv' using 1:13 with lines, 'stability_noun.csv' using 1:17 with lines, 'stability_noun.csv' using 1:18 with lines, 'stability_noun.csv' using 1:19 with lines, 'stability_noun.csv' using 1:24 with lines, 'stability_noun.csv' using 1:26 with lines, 'stability_noun.csv' using 1:31 with lines, 'stability_noun.csv' using 1:39 with lines, 'stability_noun.csv' using 1:41 with lines
" | gnuplot --persist


echo "
  set datafile separator ','
  set title 'First'
  set key autotitle columnhead outside
  plot 'stability_noun.csv' using 1:10 with lines, 'stability_noun.csv' using 1:12 with lines, 'stability_noun.csv' using 1:21 with lines, 'stability_noun.csv' using 1:24 with lines, 'stability_noun.csv' using 1:25 with lines, 'stability_noun.csv' using 1:33 with lines, 'stability_noun.csv' using 1:35 with lines, 'stability_noun.csv' using 1:37 with lines, 'stability_noun.csv' using 1:42 with lines, 'stability_noun.csv' using 1:43 with lines 
" | gnuplot --persist


echo "
  set datafile separator ','
  set title 'Divided by A'
  set key autotitle columnhead outside
  plot 'stability_noun.csv' using 1:2 with lines, 'stability_noun.csv' using 1:3 with lines, 'stability_noun.csv' using 1:4 with lines, 'stability_noun.csv' using 1:5 with lines, 'stability_noun.csv' using 1:6 with lines, 'stability_noun.csv' using 1:7 with lines 
" | gnuplot --persist

echo "
  set datafile separator ','
  set title 'Divided by G'
  set key autotitle columnhead outside
  plot 'stability_noun.csv' using 1:8 with lines, 'stability_noun.csv' using 1:9 with lines, 'stability_noun.csv' using 1:10 with lines, 'stability_noun.csv' using 1:11 with lines, 'stability_noun.csv' using 1:12 with lines, 'stability_noun.csv' using 1:13 with lines 
" | gnuplot --persist

echo "
  set datafile separator ','
  set title 'Divided by F'
  set key autotitle columnhead outside
  plot 'stability_noun.csv' using 1:14 with lines, 'stability_noun.csv' using 1:15 with lines, 'stability_noun.csv' using 1:16 with lines, 'stability_noun.csv' using 1:17 with lines, 'stability_noun.csv' using 1:18 with lines, 'stability_noun.csv' using 1:19 with lines 
" | gnuplot --persist

echo "
  set datafile separator ','
  set title 'Divided by A+G'
  set key autotitle columnhead outside
  plot 'stability_noun.csv' using 1:20 with lines, 'stability_noun.csv' using 1:21 with lines, 'stability_noun.csv' using 1:22 with lines, 'stability_noun.csv' using 1:23 with lines, 'stability_noun.csv' using 1:24 with lines, 'stability_noun.csv' using 1:25 with lines 
" | gnuplot --persist

echo "
  set datafile separator ','
  set title 'Divided by A+F'
  set key autotitle columnhead outside
  plot 'stability_noun.csv' using 1:26 with lines, 'stability_noun.csv' using 1:27 with lines, 'stability_noun.csv' using 1:28 with lines, 'stability_noun.csv' using 1:29 with lines, 'stability_noun.csv' using 1:30 with lines, 'stability_noun.csv' using 1:31 with lines 
" | gnuplot --persist

echo "
  set datafile separator ','
  set title 'Divided by G+F'
  set key autotitle columnhead outside
  plot 'stability_noun.csv' using 1:32 with lines, 'stability_noun.csv' using 1:33 with lines, 'stability_noun.csv' using 1:34 with lines, 'stability_noun.csv' using 1:35 with lines, 'stability_noun.csv' using 1:36 with lines, 'stability_noun.csv' using 1:37 with lines 
" | gnuplot --persist

echo "
  set datafile separator ','
  set title 'Divided by A+G+F'
  set key autotitle columnhead outside
  plot 'stability_noun.csv' using 1:38 with lines, 'stability_noun.csv' using 1:39 with lines, 'stability_noun.csv' using 1:40 with lines, 'stability_noun.csv' using 1:41 with lines, 'stability_noun.csv' using 1:42 with lines, 'stability_noun.csv' using 1:43 with lines 
" | gnuplot --persist
