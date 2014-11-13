#!/bin/bash

folder=/tmp/auswertung

mkdir $folder

cp auswertung.m auswertung.gplot auswertung.tex $folder

cd $folder

./auswertung.m $1

#gnuplot auswertung.gplot
#pdflatex auswertung.tex
