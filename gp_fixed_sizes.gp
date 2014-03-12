# File to specify variables for the size of a multiplot
# Plot consisting of a generic number of plots plot
#
# The file can be called with the following number of argument:
#
# For using with relative sizes (the margins are given as a fraction of the screen size)
# call "gp_fixed_sizes.gp" total_number_x total_number_y margin_horizontal_left margin_horizontal_left margin_vertical_bottom margin_vertical_top
#
# For using with absolute sizes (the margins are given in the same units as the screen width and the screen size
# call "gp_fixed_sizes.gp" screen_width screen_height total_number_x total_number_y margin_horizontal_left margin_horizontal_left margin_vertical_bottom margin_vertical_top
# The screen_width and the screen_height as well as the margins must be given in the same, arbitrary unit (e.g. cm)

################################
# Read command line parameters #
################################

# Reads the margins from the command line
if ($# == 6) \
   gpfs_total_number_x = $0; \
   gpfs_total_number_y = $1; \
   gpfs_screen_size_x = 1.0; \
   gpfs_screen_size_y = 1.0; \
   gpfs_margin_horizontal_left = $2; \
   gpfs_margin_horizontal_right = $3; \
   gpfs_margin_vertical_bottom = $4; \
   gpfs_margin_vertical_top = $5
if ($# == 8) \
   gpfs_total_number_x = $2; \
   gpfs_total_number_y = $3; \
   gpfs_screen_size_x = $0; \
   gpfs_screen_size_y = $1; \
   gpfs_margin_horizontal_left = $4 / $0; \
   gpfs_margin_horizontal_right = $5 / $0; \
   gpfs_margin_vertical_bottom = $6 / $1; \
   gpfs_margin_vertical_top = $7 / $1


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


############################################
# Functions to set the origin of the plots #
############################################

# Function to calculate the x-origin of a plot in terms of the x-index of the plot
gpfs_origin_x(index) = gpfs_calc_origin(gpfs_margin_horizontal_left, gpfs_margin_horizontal_right, gpfs_total_number_x, index)
# Function to calculate the y-origin of a plot in terms of the y-index of the plot
gpfs_origin_y(index) = gpfs_calc_origin(gpfs_margin_vertical_bottom, gpfs_margin_vertical_top, gpfs_total_number_y, index)


#################################
# Functions for unit conversion #
#################################

# Function to convert a graph width into a screen width
gpfs_graph_to_screen_length_x(l) = l*gpfs_size_x
# Function to convert a graph height into a screen height
gpfs_graph_to_screen_length_y(l) = l*gpfs_size_y
# Function to convert a screen width into a graph width
gpfs_screen_to_graph_length_x(l) = l/gpfs_size_x
# Function to convert a screen height into a screen height
gpfs_screen_to_graph_length_y(l) = l/gpfs_size_y

# Function to convert a screen width into a width with units
gpfs_screen_to_unit_length_x(l) = l*gpfs_screen_size_x
# Function to convert a screen height into a width with units
gpfs_screen_to_unit_length_y(l) = l*gpfs_screen_size_y
# Function to convert a width with units into a screen width
gpfs_unit_to_screen_length_x(l) = l/gpfs_screen_size_x
# Function to convert a height with units into a screen height
gpfs_unit_to_screen_length_y(l) = l/gpfs_screen_size_y

# Function to convert a width with units into a graph width
gpfs_unit_to_graph_length_x(l) = gpfs_screen_to_graph_length_x(gpfs_unit_to_screen_length_x(l))
# Function to convert a height with units into a graph height
gpfs_unit_to_graph_length_y(l) = gpfs_screen_to_graph_length_y(gpfs_unit_to_screen_length_y(l))
# Function to convert a graph width into a width with units
gpfs_graph_to_unit_length_x(l) = gpfs_screen_to_unit_length_x(gpfs_graph_to_screen_length_x(l))
# Function to convert a graph height into a height with units
gpfs_graph_to_unit_length_y(l) = gpfs_screen_to_unit_length_y(gpfs_graph_to_screen_length_y(l))

# Function to convert a graph coordinate c of the plot with given index i into a screen coordinate
gpfs_graph_to_screen_coordinate_x(c, i) = gpfs_margin_horizontal_left + (i + l)*gpfs_size_x
# Function to convert a graph coordinate c of the plot with given index i into a screen coordinate
gpfs_graph_to_screen_coordinate_y(c, i) = gpfs_margin_vertical_bottom + (i + l)*gpfs_size_y


#############################################
# Functions for calculating label positions #
#############################################

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