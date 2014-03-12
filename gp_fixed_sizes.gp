# File to specify variables for the size of a multiplot
# Plot consisting of a generic number of plots plot
#
# The file can be called with the following number of arguments
# call "gpfs_sizes_gen.gp" total_number_x total_number_y margin_horizontal margin_vertical
# call "gpfs_sizes_gen.gp" total_number_x total_number_y margin_horizontal margin_vertical_bottom margin_vertical_top
# call "gpfs_sizes_gen.gp" total_number_x total_number_y margin_horizontal_left margin_horizontal_left margin_vertical_bottom margin_vertical_top

###############################
# Functions needed for script #
###############################

# Function to calculate the size of a plot
# margins = Fraction of screen size used for both margins
# total_number = Number of plots in the respective direction
gpfs_calc_size(margins, total_number) = (1.0 - margins)/total_number

# Function to calculate the origin of a plot
# margin_1 = Fraction of screen size used for the first margin (left or bottom)
# margin_2 = Fraction of screen size used for the second margin (right or top)
# total_number = Total number of plots to place in this direction
# index = 0-based index of the plot, starting from the plot most left or most bottom
gpfs_calc_origin(margin_1, margin_2, total_number, index) = margin_1 + index*gpfs_calc_size(margin_1 + margin_2, total_number)

################################
# Read command line parameters #
################################

# Reads the margins from the command line
if ($# == 4) \
   gpfs_margin_horizontal_left = $2; \
   gpfs_margin_horizontal_right = $2; \
   gpfs_margin_vertical_bottom = $3; \
   gpfs_margin_vertical_top = $3
if ($# == 5) \
   gpfs_margin_horizontal_left = $2; \
   gpfs_margin_horizontal_right = $2; \
   gpfs_margin_vertical_bottom = $3; \
   gpfs_margin_vertical_top = $4
if ($# == 6) \
   gpfs_margin_horizontal_left = $2; \
   gpfs_margin_horizontal_right = $3; \
   gpfs_margin_vertical_bottom = $4; \
   gpfs_margin_vertical_top = $5

gpfs_total_number_x = $0
gpfs_total_number_y = $1


###############################
# Variables defined for users #
###############################

# Size (x-direction) of a single plot
gpfs_size_x = gpfs_calc_size(gpfs_margin_horizontal_left + gpfs_margin_horizontal_right, gpfs_total_number_x)
# Size (y-direction) of a single plot
gpfs_size_y = gpfs_calc_size(gpfs_margin_vertical_bottom + gpfs_margin_vertical_top, gpfs_total_number_y)


############################
# Macros defined for users #
############################

set macros

# Macro for setting all margins to 0
gpfs_set_margins = "set lmargin 0; set rmargin 0; set tmargin 0; set bmargin 0;"



###############################
# Functions defined for users #
###############################

# Function to calculate the x-origin of a plot in terms of the x-index of the plot
gpfs_origin_x(index) = gpfs_calc_origin(gpfs_margin_horizontal_left, gpfs_margin_horizontal_right, gpfs_total_number_x, index)
# Function to calculate the y-origin of a plot in terms of the y-index of the plot
gpfs_origin_y(index) = gpfs_calc_origin(gpfs_margin_vertical_bottom, gpfs_margin_vertical_top, gpfs_total_number_y, index)

# Functions to calculate the centers of the x1-labels
gpfs_label_x1_x(index) = gpfs_margin_horizontal_left + (index + 0.5)*gpfs_size_x
gpfs_label_x1_y(index) = 0.5*gpfs_margin_vertical_bottom
# Functions to calculate the centers of the x2-labels
gpfs_label_x2_x(index) = gpfs_label_x1_x(index)
gpfs_label_x2_y(index) = 1 - 0.5*gpfs_margin_vertical_top
# Functions to calculate the centers of the y1-labels
gpfs_label_y1_x(index) = 0.5*gpfs_margin_horizontal_left
gpfs_label_y1_y(index) = gpfs_margin_vertical_bottom + (index + 0.5)*gpfs_size_y
# Functions to calculate the centers of the y2-labels
gpfs_label_y2_x(index) = 1 - 0.5*gpfs_margin_horizontal_right
gpfs_label_y2_y(index) = gpfs_label_y1_y(index)

# Auxiliary functions for converting graph to screen coordinates and vice versa
gpfs_graph_to_screen_coordinate(index, coordinate, size, margin) = margin + (index + coordinate)*size
gpfs_graph_to_screen_x_coordinate(index, coordinate) = gpfs_graph_to_screen_coordinate(index, coordinate, gpfs_size_x, gpfs_margin_horizontal_left)
gpfs_graph_to_screen_y_coordinate(index, coordinate) = gpfs_graph_to_screen_coordinate(index, coordinate, gpfs_size_x, gpfs_margin_vertical_bottom)
# Auxiliary functions for converting graph to screen lengthes and vice versa
gpfs_graph_to_screen_x_size(size) = size*gpfs_size_x
gpfs_graph_to_screen_y_size(size) = size*gpfs_size_y
gpfs_screen_to_graph_x_size(size) = size/gpfs_size_x
gpfs_screen_to_graph_y_size(size) = size/gpfs_size_y