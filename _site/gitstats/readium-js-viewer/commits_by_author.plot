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
plot 'commits_by_author.dat' using 1:2 title "Daniel Weck" w lines, 'commits_by_author.dat' using 1:3 title "Ryan Ackley" w lines, 'commits_by_author.dat' using 1:4 title "Boris Schneiderman" w lines, 'commits_by_author.dat' using 1:5 title "justinHume" w lines, 'commits_by_author.dat' using 1:6 title "danielweck" w lines, 'commits_by_author.dat' using 1:7 title "Ric Wright" w lines, 'commits_by_author.dat' using 1:8 title "Dmitry M" w lines, 'commits_by_author.dat' using 1:9 title "Juan Corona" w lines, 'commits_by_author.dat' using 1:10 title "Aleksander Adamowski" w lines, 'commits_by_author.dat' using 1:11 title "ryanackley" w lines, 'commits_by_author.dat' using 1:12 title "vincent gros" w lines, 'commits_by_author.dat' using 1:13 title "Becky Gibson" w lines, 'commits_by_author.dat' using 1:14 title "David D. Roberts" w lines, 'commits_by_author.dat' using 1:15 title "rkwright" w lines, 'commits_by_author.dat' using 1:16 title "Justin Hume" w lines, 'commits_by_author.dat' using 1:17 title "Bill McCoy" w lines, 'commits_by_author.dat' using 1:18 title "lmvco" w lines, 'commits_by_author.dat' using 1:19 title "vagrant" w lines, 'commits_by_author.dat' using 1:20 title "shao" w lines, 'commits_by_author.dat' using 1:21 title "idov" w lines
