#!/bin/bash

echo "
  $1 set term png
  $1 set output 'polysemy_n-Cls.png'
  set datafile separator ','
  set title 'Polysemy BLC Class comparison - Nouns'
  set key autotitle columnhead outside
  set xtics rotate by -60
  set grid
  plot 'polysemy_n.csv'  using 2:xticlabel(1) with lines, 'polysemy_n.csv'  using 5:xticlabel(1) with lines, 'polysemy_n.csv'  using 8:xticlabel(1) with lines, 'polysemy_n.csv'  using 11:xticlabel(1) with lines, 'polysemy_n.csv'  using 14:xticlabel(1) with lines, 'polysemy_n.csv'  using 17:xticlabel(1) with lines, 'polysemy_n.csv'  using 20:xticlabel(1) with lines
" | gnuplot --persist

echo "
  $1 set term png
  $1 set output 'polysemy_n-R.png'
  set datafile separator ','
  set title 'Polysemy BLC R comparison - Nouns'
  set key autotitle columnhead outside
  set xtics rotate by -60
  set grid
  plot 'polysemy_n.csv'  using 3:xticlabel(1) with lines, 'polysemy_n.csv'  using 6:xticlabel(1) with lines, 'polysemy_n.csv'  using 9:xticlabel(1) with lines, 'polysemy_n.csv'  using 12:xticlabel(1) with lines, 'polysemy_n.csv'  using 15:xticlabel(1) with lines, 'polysemy_n.csv'  using 18:xticlabel(1) with lines, 'polysemy_n.csv'  using 21:xticlabel(1) with lines
" | gnuplot --persist

echo "
  $1 set term png
  $1 set output 'polysemy_n-Cls_div_R.png'
  set datafile separator ','
  set title 'Polysemy BLC Cls/R comparison - Nouns'
  set key autotitle columnhead outside
  set xtics rotate by -60
  set grid
  plot 'polysemy_n.csv'  using 4:xticlabel(1) with lines, 'polysemy_n.csv'  using 7:xticlabel(1) with lines, 'polysemy_n.csv'  using 10:xticlabel(1) with lines, 'polysemy_n.csv'  using 13:xticlabel(1) with lines, 'polysemy_n.csv'  using 16:xticlabel(1) with lines, 'polysemy_n.csv'  using 19:xticlabel(1) with lines, 'polysemy_n.csv'  using 22:xticlabel(1) with lines
" | gnuplot --persist


echo "
  $1 set term png
  $1 set output 'polysemy_v-Cls.png'
  set datafile separator ','
  set title 'Polysemy BLC Class comparison - Verbs'
  set key autotitle columnhead outside
  set xtics rotate by -60
  set grid
  plot 'polysemy_v.csv'  using 2:xticlabel(1) with lines, 'polysemy_v.csv'  using 5:xticlabel(1) with lines, 'polysemy_v.csv'  using 8:xticlabel(1) with lines, 'polysemy_v.csv'  using 11:xticlabel(1) with lines, 'polysemy_v.csv'  using 14:xticlabel(1) with lines, 'polysemy_v.csv'  using 17:xticlabel(1) with lines, 'polysemy_v.csv'  using 20:xticlabel(1) with lines
" | gnuplot --persist

echo "
  $1 set term png
  $1 set output 'polysemy_v-R.png'
  set datafile separator ','
  set title 'Polysemy BLC R comparison - Verbs'
  set key autotitle columnhead outside
  set xtics rotate by -60
  set grid
  plot 'polysemy_v.csv'  using 3:xticlabel(1) with lines, 'polysemy_v.csv'  using 6:xticlabel(1) with lines, 'polysemy_v.csv'  using 9:xticlabel(1) with lines, 'polysemy_v.csv'  using 12:xticlabel(1) with lines, 'polysemy_v.csv'  using 15:xticlabel(1) with lines, 'polysemy_v.csv'  using 18:xticlabel(1) with lines, 'polysemy_v.csv'  using 21:xticlabel(1) with lines
" | gnuplot --persist

echo "
  $1 set term png
  $1 set output 'polysemy_v-Cls_div_R.png'
  set datafile separator ','
  set title 'Polysemy BLC Cls/R comparison - Verbs'
  set key autotitle columnhead outside
  set xtics rotate by -60
  set grid
  plot 'polysemy_v.csv'  using 4:xticlabel(1) with lines, 'polysemy_v.csv'  using 7:xticlabel(1) with lines, 'polysemy_v.csv'  using 10:xticlabel(1) with lines, 'polysemy_v.csv'  using 13:xticlabel(1) with lines, 'polysemy_v.csv'  using 16:xticlabel(1) with lines, 'polysemy_v.csv'  using 19:xticlabel(1) with lines, 'polysemy_v.csv'  using 22:xticlabel(1) with lines
" | gnuplot --persist

