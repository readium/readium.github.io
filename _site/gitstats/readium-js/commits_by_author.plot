set terminal png transparent size 640,240
set size 1.0,1.0

set terminal png transparent size 640,480
set output 'commits_by_author.png'
set key left top
set yrange [0:]
set xdata time
set timefmt "%s"
set format x "%Y-%m-%d"
set grid y
set ylabel "Commits"
set xtics rotate
set bmargin 6
plot 'commits_by_author.dat' using 1:2 title "justinHume" w lines, 'commits_by_author.dat' using 1:3 title "Boris Schneiderman" w lines, 'commits_by_author.dat' using 1:4 title "Daniel Weck" w lines, 'commits_by_author.dat' using 1:5 title "Aleksander Adamowski" w lines, 'commits_by_author.dat' using 1:6 title "Dmitry M" w lines, 'commits_by_author.dat' using 1:7 title "Ryan Ackley" w lines, 'commits_by_author.dat' using 1:8 title "David D. Roberts" w lines, 'commits_by_author.dat' using 1:9 title "Juan Corona" w lines, 'commits_by_author.dat' using 1:10 title "Ric Wright" w lines, 'commits_by_author.dat' using 1:11 title "danielweck" w lines, 'commits_by_author.dat' using 1:12 title "Justin Hume" w lines, 'commits_by_author.dat' using 1:13 title "idov" w lines, 'commits_by_author.dat' using 1:14 title "william lo" w lines, 'commits_by_author.dat' using 1:15 title "Matthew" w lines, 'commits_by_author.dat' using 1:16 title "ep-sas" w lines, 'commits_by_author.dat' using 1:17 title "ryanackley" w lines, 'commits_by_author.dat' using 1:18 title "Julien Chaumond" w lines, 'commits_by_author.dat' using 1:19 title "Johan Poirier" w lines, 'commits_by_author.dat' using 1:20 title "Corey Wilson" w lines, 'commits_by_author.dat' using 1:21 title "readium" w lines
