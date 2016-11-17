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
plot 'lines_of_code_by_author.dat' using 1:2 title "Daniel Weck" w lines, 'lines_of_code_by_author.dat' using 1:3 title "Ryan Ackley" w lines, 'lines_of_code_by_author.dat' using 1:4 title "Boris Schneiderman" w lines, 'lines_of_code_by_author.dat' using 1:5 title "justinHume" w lines, 'lines_of_code_by_author.dat' using 1:6 title "danielweck" w lines, 'lines_of_code_by_author.dat' using 1:7 title "Ric Wright" w lines, 'lines_of_code_by_author.dat' using 1:8 title "Dmitry M" w lines, 'lines_of_code_by_author.dat' using 1:9 title "Juan Corona" w lines, 'lines_of_code_by_author.dat' using 1:10 title "Aleksander Adamowski" w lines, 'lines_of_code_by_author.dat' using 1:11 title "ryanackley" w lines, 'lines_of_code_by_author.dat' using 1:12 title "vincent gros" w lines, 'lines_of_code_by_author.dat' using 1:13 title "Becky Gibson" w lines, 'lines_of_code_by_author.dat' using 1:14 title "David D. Roberts" w lines, 'lines_of_code_by_author.dat' using 1:15 title "rkwright" w lines, 'lines_of_code_by_author.dat' using 1:16 title "Justin Hume" w lines, 'lines_of_code_by_author.dat' using 1:17 title "Bill McCoy" w lines, 'lines_of_code_by_author.dat' using 1:18 title "lmvco" w lines, 'lines_of_code_by_author.dat' using 1:19 title "vagrant" w lines, 'lines_of_code_by_author.dat' using 1:20 title "shao" w lines, 'lines_of_code_by_author.dat' using 1:21 title "idov" w lines
