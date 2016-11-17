set terminal png transparent size 640,240
set size 1.0,1.0

set terminal png transparent size 640,480
set output 'lines_of_code_by_author.png'
set key left top
set yrange [0:]
set xdata time
set timefmt "%s"
set format x "%Y-%m-%d"
set grid y
set ylabel "Lines"
set xtics rotate
set bmargin 6
plot 'lines_of_code_by_author.dat' using 1:2 title "Shane Meyer" w lines, 'lines_of_code_by_author.dat' using 1:3 title "Daniel Weck" w lines, 'lines_of_code_by_author.dat' using 1:4 title "Ric Wright" w lines, 'lines_of_code_by_author.dat' using 1:5 title "Boris Schneiderman" w lines, 'lines_of_code_by_author.dat' using 1:6 title "danielweck" w lines, 'lines_of_code_by_author.dat' using 1:7 title "Brandon Haugen" w lines, 'lines_of_code_by_author.dat' using 1:8 title "Patrick Keating" w lines, 'lines_of_code_by_author.dat' using 1:9 title "agilshane" w lines, 'lines_of_code_by_author.dat' using 1:10 title "Oliver Eikemeier" w lines, 'lines_of_code_by_author.dat' using 1:11 title "rkwright" w lines, 'lines_of_code_by_author.dat' using 1:12 title "Jim Dovey" w lines
