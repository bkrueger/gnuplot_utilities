
set macros

# Function for setting subplot labels
# label:  String to write into the rectangle (not more than one character
# pos_x:  Center position (x-coordinate) of the label given in graph-coordinates
# pos_y:  Center position (y-coordinate) of the label given in graph-coordinates
# size_x: Size of the background rectangle (x-coordinate) given in screen-coordinates
# size_y: Size of the background rectangle (y-coordinate) given in screen-coordinates
gpsl_label(label, pos_x, pos_y, size_x, size_y) = "set object rectangle center graph ".sprintf("%f", pos_x).",".sprintf("%f", pos_y)." size screen ".sprintf("%f", size_x).",".sprintf("%f", size_y)." fs solid fc rgb \"#000000\" front; set label '".label."' at graph ".sprintf("%f", pos_x).",".sprintf("%f", pos_y)." center tc rgb \"#FFFFFF\" front"

# The following functions take the following arguments
# label:  The label to use for the plot
# size:   The size of the sourrounding box in screen coordinates
# margin: The distance from the plot boundaries in screen coordinates
# x_multi: If the size of the plot is not gpfs_size_x, gpfs_size_y, but x_multi*gpfs_size_x, y_multi*gpfs_size_y, this is the specificator
# y_multi: If the size of the plot is not gpfs_size_x, gpfs_size_y, but x_multi*gpfs_size_x, y_multi*gpfs_size_y, this is the specificator

# Function for setting a subplot label at the bottom left of the plot
gpsl_bottom_left(label, size, margin) = gpsl_label(label, \
                                                  gpfs_screen_to_graph_x_size(margin + 0.5*size), \
                                                  gpfs_screen_to_graph_y_size(margin + 0.5*size), size, size)
# Function for setting a subplot label at the bottom right of the plot
gpsl_bottom_right(label, size, margin) = gpsl_label(label, \
                                                   1 - gpfs_screen_to_graph_x_size(margin + 0.5*size), \
                                                   gpfs_screen_to_graph_y_size(margin + 0.5*size), size, size)
# Function for setting a subplot label at the top left of the plot
gpsl_top_left(label, size, margin) = gpsl_label(label, \
                                               gpfs_screen_to_graph_x_size(margin + 0.5*size), \
                                               1 - gpfs_screen_to_graph_y_size(margin + 0.5*size), size, size)
# Function for setting a subplot label at the top right of the plot
gpsl_top_right(label, size, margin) = gpsl_label(label, \
                                                1 - gpfs_screen_to_graph_x_size(margin + 0.5*size), \
                                                1 - gpfs_screen_to_graph_y_size(margin + 0.5*size), size, size)
# Function for setting a subplot label at the bottom left of the non-standard-sized plot
gpsl_bottom_left_multi(label, size, margin, x_multi, y_multi) = gpsl_label(label, \
                                                                          gpfs_screen_to_graph_x_size(margin + 0.5*size)/x_multi, \
                                                                          gpfs_screen_to_graph_y_size(margin + 0.5*size)/y_multi, size, size)
# Function for setting a subplot label at the bottom right of the non-standard-sized plot
gpsl_bottom_right_multi(label, size, margin, x_multi, y_multi) = gpsl_label(label, \
                                                                           1 - gpfs_screen_to_graph_x_size(margin + 0.5*size)/x_multi, \
                                                                           gpfs_screen_to_graph_y_size(margin + 0.5*size)/y_multi, size, size)
# Function for setting a subplot label at the top left of the non-standard-sized plot
gpsl_top_left_multi(label, size, margin, x_multi, y_multi) = gpsl_label(label, \
                                                                       gpfs_screen_to_graph_x_size(margin + 0.5*size)/x_multi, \
                                                                       1 - gpfs_screen_to_graph_y_size(margin + 0.5*size)/y_multi, size, size)
# Function for setting a subplot label at the top right of the non-standard-sized plot
gpsl_top_right_multi(label, size, margin, x_multi, y_multi) = gpsl_label(label, \
                                                                   1 - gpfs_screen_to_graph_x_size(margin + 0.5*size)/x_multi, \
                                                                   1 - gpfs_screen_to_graph_y_size(margin + 0.5*size)/y_multi, size, size)

# Function for setting a subplot label at the bottom left of the plot
gpsl_bottom_left_xy(label, size_x, size_y, margin) = gpsl_label(label, \
                                                     gpfs_screen_to_graph_x_size(margin + 0.5*size_x), \
                                                     gpfs_screen_to_graph_y_size(margin + 0.5*size_y), size_x, size_y)
# Function for setting a subplot label at the bottom right of the plot
gpsl_bottom_right_xy(label, size_x, size_y, margin) = gpsl_label(label, \
                                                     1 - gpfs_screen_to_graph_x_size(margin + 0.5*size_x), \
                                                     gpfs_screen_to_graph_y_size(margin + 0.5*size_y), size_x, size_y)
# Function for setting a subplot label at the top left of the plot
gpsl_top_left_xy(label, size_x, size_y, margin) = gpsl_label(label, \
                                                  gpfs_screen_to_graph_x_size(margin + 0.5*size_x), \
                                                  1 - gpfs_screen_to_graph_y_size(margin + 0.5*size_y), size_x, size_y)
# Function for setting a subplot label at the top right of the plot
gpsl_top_right_xy(label, size_x, size_y, margin) = gpsl_label(label, \
                                                   1 - gpfs_screen_to_graph_x_size(margin + 0.5*size_x), \
                                                   1 - gpfs_screen_to_graph_y_size(margin + 0.5*size_y), size_x, size_y)
# Function for setting a subplot label at the bottom left of the non-standard-sized plot
gpsl_bottom_left_xy_multi(label, size_x, size_y, margin, x_multi, y_multi) = gpsl_label(label, \
                                                                             gpfs_screen_to_graph_x_size(margin + 0.5*size_x)/x_multi, \
                                                                             gpfs_screen_to_graph_y_size(margin + 0.5*size_y)/y_multi, size_x, size_y)
# Function for setting a subplot label at the bottom right of the non-standard-sized plot
gpsl_bottom_right_xy_multi(label, size_x, size_y, margin, x_multi, y_multi) = gpsl_label(label, \
                                                                              1 - gpfs_screen_to_graph_x_size(margin + 0.5*size_x)/x_multi, \
                                                                              gpfs_screen_to_graph_y_size(margin + 0.5*size_y)/y_multi, size_x, size_y)
# Function for setting a subplot label at the top left of the non-standard-sized plot
gpsl_top_left_xy_multi(label, size_x, size_y, margin, x_multi, y_multi) = gpsl_label(label, \
                                                                          gpfs_screen_to_graph_x_size(margin + 0.5*size_x)/x_multi, \
                                                                          1 - gpfs_screen_to_graph_y_size(margin + 0.5*size_y)/y_multi, size_x, size_y)
# Function for setting a subplot label at the top right of the non-standard-sized plot
gpsl_top_right_xy_multi(label, size_x, size_y, margin, x_multi, y_multi) = gpsl_label(label, \
                                                                           1 - gpfs_screen_to_graph_x_size(margin + 0.5*size_x)/x_multi, \
                                                                           1 - gpfs_screen_to_graph_y_size(margin + 0.5*size_y)/y_multi, size_x, size_y)