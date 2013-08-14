# File to specify variables for the size of a multiplot
# Plot consisting of a generic number of plots plot
#
# The file can be called with the following number of arguments
# call "gpfs_sizes_gen.gp" gpfs_dir total_number_x total_number_y margin_horizontal margin_vertical
# call "gpfs_sizes_gen.gp" gpfs_dir total_number_x total_number_y margin_horizontal margin_vertical_bottom margin_vertical_top
# call "gpfs_sizes_gen.gp" gpfs_dir total_number_x total_number_y margin_horizontal_left margin_horizontal_left margin_vertical_bottom margin_vertical_top

load "$0/gpfs_calculate_sizes.gp"

call "$1/gpfs_read_variables.gp" $1 $2 $3 $4

gpfs_size_x = gpfs_calc_size(margin_horizontal_left + margin_horizontal_right, total_number_x)
gpfs_size_y = gpfs_calc_size(margin_vertical_bottom + margin_vertical_top, total_number_x)

gpfs_origin_x(index) = gpfs_calc_origin(gpfs_margin_horizontal_left, gpfs_margin_horizontal_right, 1, index)

gpfs_origin_y(index) = gpfs_calc_origin(gpfs_margin_vertical_bottom, gpfs_margin_vertical_top, 1, index)