#!/bin/bash


tempfolder=/tmp/auswertung
exfolder=/home/felix/GITHUB/NotenAuswerten
folder=$(pwd)

mkdir $tempfolder

cp $exfolder/auswertung.m $exfolder/auswertung.gplot $exfolder/auswertung.tex $exfolder/gnuplot_style $folder/$1 $tempfolder

cd $tempfolder

./auswertung.m $1
gnuplot auswertung.gplot


pdflatex --shell-escape auswertung.tex

#extrahiert filename aus filename.pdf
#name=${1%.*}
#echo $name

mv auswertung.pdf $folder/auswertung_${1%.*}.pdf

#rm -r $tempfolder


#gnuplot auswertung.gplot
