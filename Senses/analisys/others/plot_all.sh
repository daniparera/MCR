#!/bin/bash

echo "
  set term png
  set output 'senses_comparison_all.png'
  set datafile separator ','
  set title 'Similarity senses comparison'
  set key autotitle columnhead outside
  set xtics rotate by -60
  set grid
  plot 'stability_senses_all.csv'  using 2:xticlabel(1) with lines, 'stability_senses_all.csv'  using 3:xticlabel(1) with lines, 'stability_senses_all.csv'  using 4:xticlabel(1) with lines
" | gnuplot --persist

