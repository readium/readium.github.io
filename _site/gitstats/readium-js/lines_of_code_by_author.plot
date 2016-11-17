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
plot 'lines_of_code_by_author.dat' using 1:2 title "justinHume" w lines, 'lines_of_code_by_author.dat' using 1:3 title "Boris Schneiderman" w lines, 'lines_of_code_by_author.dat' using 1:4 title "Daniel Weck" w lines, 'lines_of_code_by_author.dat' using 1:5 title "Aleksander Adamowski" w lines, 'lines_of_code_by_author.dat' using 1:6 title "Dmitry M" w lines, 'lines_of_code_by_author.dat' using 1:7 title "Ryan Ackley" w lines, 'lines_of_code_by_author.dat' using 1:8 title "David D. Roberts" w lines, 'lines_of_code_by_author.dat' using 1:9 title "Juan Corona" w lines, 'lines_of_code_by_author.dat' using 1:10 title "Ric Wright" w lines, 'lines_of_code_by_author.dat' using 1:11 title "danielweck" w lines, 'lines_of_code_by_author.dat' using 1:12 title "Justin Hume" w lines, 'lines_of_code_by_author.dat' using 1:13 title "idov" w lines, 'lines_of_code_by_author.dat' using 1:14 title "william lo" w lines, 'lines_of_code_by_author.dat' using 1:15 title "Matthew" w lines, 'lines_of_code_by_author.dat' using 1:16 title "ep-sas" w lines, 'lines_of_code_by_author.dat' using 1:17 title "ryanackley" w lines, 'lines_of_code_by_author.dat' using 1:18 title "Julien Chaumond" w lines, 'lines_of_code_by_author.dat' using 1:19 title "Johan Poirier" w lines, 'lines_of_code_by_author.dat' using 1:20 title "Corey Wilson" w lines, 'lines_of_code_by_author.dat' using 1:21 title "readium" w lines
