#!/bin/bash

echo Total Freq
cat out/senses-freq-cat-30.tab | wc
echo Iguals Freq VS All
comm -12 out/senses-freq-cat-30.tab out/senses-all-cat-30.tab | wc
echo Diferents Freq VS All
comm -23 out/senses-freq-cat-30.tab out/senses-all-cat-30.tab | wc
comm -13 out/senses-freq-cat-30.tab out/senses-all-cat-30.tab | wc


echo Total All
cat out/senses-all-cat-30.tab | wc
echo Iguals All+Glos VS All
comm -12 out/senses-all+gloss-cat-30.tab out/senses-all-cat-30.tab | wc
echo Diferents
comm -23 out/senses-all+gloss-cat-30.tab out/senses-all-cat-30.tab | wc
comm -13 out/senses-all+gloss-cat-30.tab out/senses-all-cat-30.tab | wc



echo Total All+Gloss
cat out/senses-all+gloss-cat-30.tab | wc
echo Iguals All+Glos VS Freq
comm -12 out/senses-all+gloss-cat-30.tab out/senses-freq-cat-30.tab | wc
echo Diferents All+Glos VS Freq
comm -23 out/senses-all+gloss-cat-30.tab out/senses-freq-cat-30.tab | wc
comm -13 out/senses-all+gloss-cat-30.tab out/senses-freq-cat-30.tab | wc



