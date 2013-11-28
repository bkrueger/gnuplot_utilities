# Call with:
# gnuplot example_2_1.plt
# make

####################
# General settings #
####################

# Set the terminal with an explicit size matching your requirements
set terminal epslatex standalone color colortext size 14.7cm,9cm
set output "example_2_1.tex"

# Call the script from its location
# Argument 1: Number of plots in x-direction
# Argument 2: Number of plots in y-direction
# Argument 3: Percentage of the left margin
# Argument 4: Percentage of the right margin
# Argument 5: Percentage of the bottom margin
# Argument 6: Percentage of the top margin
call "../gpfs_sizes_gen.gp" 2 1 0.1 0.1 0.15 0

set multiplot

##########
# Plot 1 #
##########

reset

# Set the margins to 0
set lmargin 0; set rmargin 0; set tmargin 0; set bmargin 0;
# Set the sizes of the plot
set size gpfs_size_x,gpfs_size_y
# Plot is the first in x-direction and the first in y-direction
set origin gpfs_origin_x(0),gpfs_origin_y(0)

set xrange [-pi:pi]
set yrange [-1.1:1.1]

set xlabel '\textbf{argument} $x$'
set ylabel '\textbf{result} $\sin(x)$' offset 1.5

plot sin(x) title '$f(x) = \sin(x)$'


##########
# Plot 2 #
##########

reset

# Set the margins to 0
set lmargin 0; set rmargin 0; set tmargin 0; set bmargin 0;
# Set the sizes of the plot
set size gpfs_size_x,gpfs_size_y
# Plot is the second in x-direction and the first in y-direction
set origin gpfs_origin_x(1),gpfs_origin_y(0)

set xrange [-pi:pi]
set yrange [-1.1:1.1]
set y2range [-1.1:1.1]

set format y ''
set y2tics -1.5,0.5,1.5

set xlabel '\textbf{argument} $x$'
set y2label '\textbf{result} $\cos(x)$' rotate by 270 offset -1.5

plot cos(x) title '$f(x) = \cos(x)$'

