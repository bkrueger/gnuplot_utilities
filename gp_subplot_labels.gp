####################################################
# Functions for setting subplot labels             #
# Can only be used after gp_fixed_sizes was called #
####################################################

set macros

# Configuration variables
gpsl_background_color = "#000000"
gpsl_font_color = "#FFFFFF"

# Function for setting subplot labels
# label:        String to write into the rectangle (not more than one character
# graph_pos_x:  Center position (x-coordinate) of the label given in graph-coordinates
# graph_pos_y:  Center position (y-coordinate) of the label given in graph-coordinates
# unit_size_x:  Size of the background rectangle (x-coordinate) given in absolute units
# unit_size_y:  Size of the background rectangle (y-coordinate) given in absolute units
gpsl_label_unit_size(label, graph_pos_x, graph_pos_y, unit_size_x, unit_size_y) = \
"set object rectangle ".\
"center graph ".sprintf("%f", graph_pos_x).",".sprintf("%f", graph_pos_y)." ".\
"size screen ".sprintf("%f", gpfs_unit_to_screen_length_x(unit_size_x)).",".sprintf("%f", gpfs_unit_to_screen_length_y(unit_size_y))." ".\
"fs solid fc rgb \"".gpsl_background_color."\" front; ".\
"set label '".label."' ".\
"at graph ".sprintf("%f", graph_pos_x).",".sprintf("%f", graph_pos_y)." center tc rgb \"".gpsl_font_color."\" front"


# Function for setting subplot labels
# label:         String to write into the rectangle (not more than one character
# graph_pos_x:   Center position (x-coordinate) of the label given in graph-coordinates
# graph_pos_y:   Center position (y-coordinate) of the label given in graph-coordinates
# screen_size_x: Size of the background rectangle (x-coordinate) given in absolute units
# screen_size_y: Size of the background rectangle (y-coordinate) given in absolute units
gpsl_label_screen_size(label, graph_pos_x, graph_pos_y, screen_size_x, screen_size_y) = \
"set object rectangle ".\
"center graph ".sprintf("%f", graph_pos_x).",".sprintf("%f", graph_pos_y)." ".\
"size screen ".sprintf("%f", screen_size_x).",".sprintf("%f", screen_size_y)." ".\
"fs solid fc rgb \"".gpsl_background_color."\" front; ".\
"set label '".label."' ".\
"at graph ".sprintf("%f", graph_pos_x).",".sprintf("%f", graph_pos_y)." center tc rgb \"".gpsl_font_color."\" front"


# The following functions take the following arguments
# label:  The label to use for the plot
# unit_size:   The size of the sourrounding box in absolute units
# unit_margin: The distance from the plot boundaries in absolute units
# screen_size_x:   The x-size of the sourrounding box in screen coordinates
# screen_size_y:   The y-size of the sourrounding box in screen coordinates
# screen_margin_x: The x-distance from the plot boundaries in screen coordinates
# screen_margin_y: The y-distance from the plot boundaries in screen coordinates

# Function for setting a subplot label at the bottom left of the plot, for plots of size factor_x * gpfs_size_x times factor_y * gpfs_size_y
gpsl_bottom_left_factor(label, unit_size, unit_margin, factor_x, factor_y) = \
    gpsl_label_unit_size(label, gpfs_unit_to_graph_length_x(unit_margin + 0.5*unit_size/factor_x), \
                         gpfs_unit_to_graph_length_y(unit_margin + 0.5*unit_size/factor_y), unit_size, unit_size)
# Function for setting a subplot label at the bottom left of the plot, for plots of size gpfs_size_x times gpfs_size_y
gpsl_bottom_left(label, unit_size, unit_margin) = gpsl_bottom_left_factor(label, unit_size, unit_margin, 1.0, 1.0)

# Function for setting a subplot label at the bottom right of the plot, for plots of size factor_x * gpfs_size_x times factor_y * gpfs_size_y
gpsl_bottom_right_factor(label, unit_size, unit_margin, factor_x, factor_y) = \
    gpsl_label_unit_size(label, 1 - gpfs_unit_to_graph_length_x(unit_margin + 0.5*unit_size/factor_x), \
                         gpfs_unit_to_graph_length_y(unit_margin + 0.5*unit_size/factor_y), unit_size, unit_size)
# Function for setting a subplot label at the bottom right of the plot, for plots of size gpfs_size_x times gpfs_size_y
gpsl_bottom_right(label, unit_size, unit_margin) = gpsl_bottom_right_factor(label, unit_size, unit_margin, 1.0, 1.0)

# Function for setting a subplot label at the top left of the plot, for plots of size factor_x * gpfs_size_x times factor_y * gpfs_size_y
gpsl_top_left_factor(label, unit_size, unit_margin, factor_x, factor_y) = \
    gpsl_label_unit_size(label, gpfs_unit_to_graph_length_x(unit_margin + 0.5*unit_size/factor_x), \
                                1 - gpfs_unit_to_graph_length_y(unit_margin + 0.5*unit_size/factor_y), unit_size, unit_size)
# Function for setting a subplot label at the top left of the plot, for plots of size gpfs_size_x times gpfs_size_y
gpsl_top_left(label, unit_size, unit_margin) = gpsl_top_left_factor(label, unit_size, unit_margin, 1.0, 1.0)

# Function for setting a subplot label at the top right of the plot, for plots of size factor_x * gpfs_size_x times factor_y * gpfs_size_y
gpsl_top_right_factor(label, unit_size, unit_margin, factor_x, factor_y) = \
    gpsl_label_unit_size(label, 1 - gpfs_unit_to_graph_length_x(unit_margin + 0.5*unit_size/factor_x), \
                                1 - gpfs_unit_to_graph_length_y(unit_margin + 0.5*unit_size/factor_y), unit_size, unit_size)
# Function for setting a subplot label at the top right of the plot, for plots of size gpfs_size_x times gpfs_size_y
gpsl_top_right(label, unit_size, unit_margin) = gpsl_top_right_factor(label, unit_size, unit_margin, 1.0, 1.0)

# Function for setting a subplot label at the bottom left of the plot
gpsl_bottom_left_screen(label, screen_size_x, screen_size_y, screen_margin_x, screen_margin_y) = \
    gpsl_label_screen(label, gpfs_screen_to_graph_length_x(screen_margin_x + 0.5*screen_size_x), \
                             gpfs_screen_to_graph_length_y(screen_margin_y + 0.5*screen_size_y), screen_size_x, screen_size_y)

# Function for setting a subplot label at the bottom right of the plot
gpsl_bottom_right_screen(label, screen_size_x, screen_size_y, screen_margin_x, screen_margin_y) = \
    gpsl_label_screen(label, 1 - gpfs_screen_to_graph_length_x(screen_margin_x + 0.5*screen_size_x), \
                             gpfs_screen_to_graph_length_y(screen_margin_y + 0.5*screen_size_y), screen_size_x, screen_size_y)

# Function for setting a subplot label at the top left of the plot
gpsl_top_left_screen(label, screen_size_x, screen_size_y, screen_margin_x, screen_margin_y) = \
    gpsl_label_screen(label, gpfs_screen_to_graph_length_x(screen_margin_x + 0.5*screen_size_x), \
                             1 - gpfs_screen_to_graph_length_y(screen_margin_y + 0.5*screen_size_y), screen_size_x, screen_size_y)

# Function for setting a subplot label at the top right of the plot
gpsl_top_right_screen(label, screen_size_x, screen_size_y, screen_margin_x, screen_margin_y) = \
    gpsl_label_screen(label, 1 - gpfs_screen_to_graph_length_x(screen_margin_x + 0.5*screen_size_x), \
                             1 - gpfs_screen_to_graph_length_y(screen_margin_y + 0.5*screen_size_y), screen_size_x, screen_size_y)