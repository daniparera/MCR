#!/bin/bash

echo "
  set datafile separator ','
  set title 'Second $2 $3'
  set term png
  set output 'printme_second_$2_$3.png'
  set key autotitle columnhead outside
  plot '$1' using 1:5 with lines, '$1' using 1:13 with lines, '$1' using 1:17 with lines, '$1' using 1:18 with lines, '$1' using 1:19 with lines, '$1' using 1:24 with lines, '$1' using 1:26 with lines, '$1' using 1:31 with lines, '$1' using 1:39 with lines, '$1' using 1:41 with lines
" | gnuplot --persist


echo "
  set datafile separator ','
  set title 'First $2 $3'
  set output 'printme_first_$2_$3.png'
  set key autotitle columnhead outside
  plot '$1' using 1:10 with lines, '$1' using 1:12 with lines, '$1' using 1:21 with lines, '$1' using 1:24 with lines, '$1' using 1:25 with lines, '$1' using 1:33 with lines, '$1' using 1:35 with lines, '$1' using 1:37 with lines, '$1' using 1:42 with lines, '$1' using 1:43 with lines 
" | gnuplot --persist


echo "
  set datafile separator ','
  set title 'Divided by A $2 $3'
  set key autotitle columnhead outside
  plot '$1' using 1:2 with lines, '$1' using 1:3 with lines, '$1' using 1:4 with lines, '$1' using 1:5 with lines, '$1' using 1:6 with lines, '$1' using 1:7 with lines 
" | gnuplot --persist

echo "
  set datafile separator ','
  set title 'Divided by G $2 $3'
  set key autotitle columnhead outside
  plot '$1' using 1:8 with lines, '$1' using 1:9 with lines, '$1' using 1:10 with lines, '$1' using 1:11 with lines, '$1' using 1:12 with lines, '$1' using 1:13 with lines 
" | gnuplot --persist

echo "
  set datafile separator ','
  set title 'Divided by F $2 $3'
  set key autotitle columnhead outside
  plot '$1' using 1:14 with lines, '$1' using 1:15 with lines, '$1' using 1:16 with lines, '$1' using 1:17 with lines, '$1' using 1:18 with lines, '$1' using 1:19 with lines 
" | gnuplot --persist

echo "
  set datafile separator ','
  set title 'Divided by A+G $2 $3'
  set key autotitle columnhead outside
  plot '$1' using 1:20 with lines, '$1' using 1:21 with lines, '$1' using 1:22 with lines, '$1' using 1:23 with lines, '$1' using 1:24 with lines, '$1' using 1:25 with lines 
" | gnuplot --persist

echo "
  set datafile separator ','
  set title 'Divided by A+F $2 $3'
  set key autotitle columnhead outside
  plot '$1' using 1:26 with lines, '$1' using 1:27 with lines, '$1' using 1:28 with lines, '$1' using 1:29 with lines, '$1' using 1:30 with lines, '$1' using 1:31 with lines 
" | gnuplot --persist

echo "
  set datafile separator ','
  set title 'Divided by G+F $2 $3'
  set key autotitle columnhead outside
  plot '$1' using 1:32 with lines, '$1' using 1:33 with lines, '$1' using 1:34 with lines, '$1' using 1:35 with lines, '$1' using 1:36 with lines, '$1' using 1:37 with lines 
" | gnuplot --persist

echo "
  set datafile separator ','
  set title 'Divided by A+G+F $2 $3'
  set key autotitle columnhead outside
  plot '$1' using 1:38 with lines, '$1' using 1:39 with lines, '$1' using 1:40 with lines, '$1' using 1:41 with lines, '$1' using 1:42 with lines, '$1' using 1:43 with lines 
" | gnuplot --persist
