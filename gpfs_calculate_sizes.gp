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