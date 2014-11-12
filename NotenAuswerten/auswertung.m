#!/usr/bin/octave -qf
# a sample Octave program
printf ("Hello, world!\n");
###https://www.gnu.org/software/octave/doc/interpreter/Executable-Octave-Programs.html


#clear;

arg_list = argv ();


file = sprintf("%s", arg_list{1});

Data = dlmread(file, " ")
#Data = dlmread("2D1.csv", " ")


#Summe der einzelnen Aufgaben pro Schüler
Summe = Data(:,1)+Data(:,2)+Data(:,3)+Data(:,4)+Data(:,5);
Note =Summe + 1;

############### ANFANG HISTOGRAMM #######################################


Einteilung = [1 3 4 4.5 5 6];
NofCa = NofEl=size(Einteilung)(1,2) - 1;#Anzahl Kategorien
for i=1:NofCa
X(1,i) = 0.5*(Einteilung(i+1)-Einteilung(i)) + Einteilung(i);#erstellt den X Wert mit Hilfe der Einteilung
X(2,i) = sum(Note(:) < Einteilung(i+1));
X(3,i) = Einteilung(i+1) - Einteilung(i); 
endfor


#korregiert die anzahl elemente im histogramm
M=[0 X(2,(1:4))]; X(2,:) = X(2,:)-M;


############### ENDE HISTOGRAMM Noten der SuS#######################################

############### ANFANG Balkendiagramm Mittlere Punktzahl pro Aufgabe ###############

Einteilung = [0 1 2 3 4 5];
NofCa = NofEl=size(Einteilung)(1,2) - 1;#Anzahl Kategorien
for i=1:NofCa
Xe(1,i) = i; 
Xe(2,i) = mean(Data(:,i)); 
endfor

Xe(3,:) = ones(5)(1,:);



### AUSGABEN SCHREIBEN ######################################

folder = sprintf("/tmp/auswertung/");
createfolder = sprintf("mkdir %s",folder);
system(createfolder);


#schreibt den inhalt von
gdata =sprintf("%sgnuplot_data",folder);
dlmwrite (gdata,Data," ");

#schreibt den inhalt von X transponiert in die Datei
ghist =sprintf("%shist.dat",folder);
dlmwrite (ghist,X'," ")

#schreibt den inhalt von Xe transponiert in die Datei
gmittelwert =sprintf("%s/mittelwertaufgaben.dat",folder);
dlmwrite (gmittelwert,Xe'," ")


mittelwert_HIST1 = mean(Note)
median_HIST1 = median(Note)

gfid =sprintf("%sgnuplot_input",folder);
fid = fopen (gfid, "w");

fprintf(fid,"folder = sprintf(\"%s\")\n", folder);
fprintf(fid,"mittelwert_HIST1 = %f\n", mittelwert_HIST1);
fprintf(fid,"median_HIST1 = %f\n", median_HIST1);
fclose (fid);







#### AUSFÜHREN VON EXTERNEN PROGRAMMEN ################################

#lasse das gnuplot skript laufen
gcd =sprintf("cd %s",folder)
system(gcd)
system("pwd")
system ("gnuplot /home/felix/GITHUB/NotenAuswerten/auswertung.gplot");


#erstelle pdf mit pdflatex
[output, text] = system ("pdflatex /home/felix/GITHUB/NotenAuswerten/auswertung.tex");




