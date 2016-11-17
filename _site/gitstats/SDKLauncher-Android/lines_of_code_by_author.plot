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
plot 'lines_of_code_by_author.dat' using 1:2 title "Daniel Weck" w lines, 'lines_of_code_by_author.dat' using 1:3 title "chtian" w lines, 'lines_of_code_by_author.dat' using 1:4 title "Juan Corona" w lines, 'lines_of_code_by_author.dat' using 1:5 title "Ric Wright" w lines, 'lines_of_code_by_author.dat' using 1:6 title "Pedro Reis Colaço" w lines, 'lines_of_code_by_author.dat' using 1:7 title "yteitel@mantano.com" w lines, 'lines_of_code_by_author.dat' using 1:8 title "Pedro Reis Colaço" w lines, 'lines_of_code_by_author.dat' using 1:9 title "zwhu" w lines, 'lines_of_code_by_author.dat' using 1:10 title "Brandon Haugen" w lines, 'lines_of_code_by_author.dat' using 1:11 title "Boris Schneiderman" w lines, 'lines_of_code_by_author.dat' using 1:12 title "danielweck" w lines, 'lines_of_code_by_author.dat' using 1:13 title "Christian Oschwald" w lines, 'lines_of_code_by_author.dat' using 1:14 title "hqwu" w lines, 'lines_of_code_by_author.dat' using 1:15 title "Stas Stelle" w lines, 'lines_of_code_by_author.dat' using 1:16 title "AnFengDe" w lines, 'lines_of_code_by_author.dat' using 1:17 title "Vincent Richomme" w lines, 'lines_of_code_by_author.dat' using 1:18 title "Vincent R" w lines, 'lines_of_code_by_author.dat' using 1:19 title "Nelson Leme" w lines, 'lines_of_code_by_author.dat' using 1:20 title "yteitel" w lines, 'lines_of_code_by_author.dat' using 1:21 title "ThrowDice" w lines
