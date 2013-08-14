# File to specify variables for the size of a multiplot
# Plot consisting of 9 (3x3) plots
#
# The file can be called with the following number of arguments
# call "gpfs_sizes_3_3.gp" gpfs_dir margin_horizontal margin_vertical
# call "gpfs_sizes_3_3.gp" gpfs_dir margin_horizontal margin_vertical_bottom margin_vertical_top
# call "gpfs_sizes_3_3.gp" gpfs_dir margin_horizontal_left margin_horizontal_left margin_vertical_bottom margin_vertical_top

load "$0/gpfs_calculate_sizes.gp"

call "$0/gpfs_read_variables.gp" $1 $2 $3 $4

gpfs_size_x = gpfs_calc_size(gpfs_margin_horizontal_left + gpfs_margin_horizontal_right, 3)
gpfs_size_y = gpfs_calc_size(gpfs_margin_vertical_bottom + gpfs_margin_vertical_top, 2)

gpfs_origin_x_0 = gpfs_calc_origin(gpfs_margin_horizontal_left, gpfs_margin_horizontal_right, 3, 0)
gpfs_origin_x_1 = gpfs_calc_origin(gpfs_margin_horizontal_left, gpfs_margin_horizontal_right, 3, 1)
gpfs_origin_x_2 = gpfs_calc_origin(gpfs_margin_horizontal_left, gpfs_margin_horizontal_right, 3, 2)

gpfs_origin_y_0 = gpfs_calc_origin(gpfs_margin_vertical_bottom, gpfs_margin_vertical_top, 3, 0)
gpfs_origin_y_1 = gpfs_calc_origin(gpfs_margin_vertical_bottom, gpfs_margin_vertical_top, 3, 1)
gpfs_origin_y_2 = gpfs_calc_origin(gpfs_margin_vertical_bottom, gpfs_margin_vertical_top, 3, 2)