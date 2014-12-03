set terminal tikz size 14cm, 8cm
set output 'Mechanik-gnuplottex-fig1.tex'
load("../gnuplot_style")
g = 9.81
s = 0.8 #beschleunigungsstrecke daten.dat
s = 0.95 #beschleunigungsstrecke daten2.dat

f(x) = a0 + a1*x
fit f(x) "./Experimente_Mechanik/dynamik_auto/daten2.dat"  u ((2*s)/($2**2)):(($1*0.001)*g) via a0, a1

set xlabel "Beschleunigung (m/s$^2$)"
set ylabel "Kraft (N)"


plot [0:0.6][0:] "./Experimente_Mechanik/dynamik_auto/daten2.dat" u ((2*s)/($2**2)):(($1*0.001)*g) not "F(a)" w p ls 1, f(x) not w l ls 1
    
