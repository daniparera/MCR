#!/bin/bash

echo "
  set term png
  set output 'polysemy_$1-$2-Cls.png'
  set datafile separator ','
  set title 'Polysemy BLC Class comparison - Nouns'
  set key autotitle columnhead outside
  set xtics rotate by -60
  set grid
  plot 'polysemy_$1-$2.csv'  using 2:xticlabel(1) with lines, 'polysemy_$1-$2.csv'  using 5:xticlabel(1) with lines, 'polysemy_$1-$2.csv'  using 8:xticlabel(1) with lines, 'polysemy_$1-$2.csv'  using 11:xticlabel(1) with lines, 'polysemy_$1-$2.csv'  using 14:xticlabel(1) with lines, 'polysemy_$1-$2.csv'  using 17:xticlabel(1) with lines, 'polysemy_$1-$2.csv'  using 20:xticlabel(1) with lines
" | gnuplot --persist

echo "
  set term png
  set output 'polysemy_$1-$2-R.png'
  set datafile separator ','
  set title 'Polysemy BLC R comparison - Nouns'
  set key autotitle columnhead outside
  set xtics rotate by -60
  set grid
  plot 'polysemy_$1-$2.csv'  using 3:xticlabel(1) with lines, 'polysemy_$1-$2.csv'  using 6:xticlabel(1) with lines, 'polysemy_$1-$2.csv'  using 9:xticlabel(1) with lines, 'polysemy_$1-$2.csv'  using 12:xticlabel(1) with lines, 'polysemy_$1-$2.csv'  using 15:xticlabel(1) with lines, 'polysemy_$1-$2.csv'  using 18:xticlabel(1) with lines, 'polysemy_$1-$2.csv'  using 21:xticlabel(1) with lines
" | gnuplot --persist

echo "
  set term png
  set output 'polysemy_$1-$2-Cls_div_R.png'
  set datafile separator ','
  set title 'Polysemy BLC Cls/R comparison - Nouns'
  set key autotitle columnhead outside
  set xtics rotate by -60
  set grid
  plot 'polysemy_$1-$2.csv'  using 4:xticlabel(1) with lines, 'polysemy_$1-$2.csv'  using 7:xticlabel(1) with lines, 'polysemy_$1-$2.csv'  using 10:xticlabel(1) with lines, 'polysemy_$1-$2.csv'  using 13:xticlabel(1) with lines, 'polysemy_$1-$2.csv'  using 16:xticlabel(1) with lines, 'polysemy_$1-$2.csv'  using 19:xticlabel(1) with lines, 'polysemy_$1-$2.csv'  using 22:xticlabel(1) with lines
" | gnuplot --persist
