# Function for calculating the size of the screen of a plot

# Function to calculate the height of the plot given a fixed width
# width: The width of the plot in arbitrary units (cm or 1.0 for relative size)
# plot_ratio_x_y: The width-to-height ratio of the actual plot (without the margins)
# margin_###: Size of the respective margin
gpsc_fixed_width(width, plot_ratio_x_y, margin_left, margin_right, margin_bottom, margin_top) = margin_top + margin_bottom + (width - margin_left - margin_right) / plot_ratio_x_y

# Function to calculate the width of the plot given a fixed height
# height: The height of the plot in arbitrary units (cm or 1.0 for relative size)
# plot_ratio_x_y: The width-to-height ratio of the actual plot (without the margins)
# margin_###: Size of the respective margin
gpsc_fixed_height(height, plot_ratio_x_y, margin_left, margin_right, margin_bottom, margin_top) = margin_left + margin_bottom + (height - margin_bottom - margin_top) * plot_ratio_x_y

# Function to create a size string to be used in the terminal options
# width: The width of the plot
# height: The height of the plot
# unit: String specifying the unit to use
gpsc_size_string(width, height, unit) = "size ".gprintf("%g", width).unit.",".gprintf("%g", height).unit
