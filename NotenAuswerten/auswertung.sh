#!/bin/bash

tempfolder=/tmp/auswertung
exfolder=/home/felix/GITHUB/NotenAuswerten
folder=$(pwd)

mkdir $tempfolder

cp $exfolder/auswertung.m $exfolder/auswertung.gplot $exfolder/auswertung.tex $folder/$1 $tempfolder

cd $tempfolder

$exfolder/auswertung.m $1

mv auswertung.pdf $folder

#rm -r $tempfolder


#gnuplot auswertung.gplot
#pdflatex auswertung.tex
