# File to read a single value from a file into a variable
# The value will be stored in the variable "gp_read_values_result"
#
# This script can be called with the following arguments
# call "read_value.gp" datafile column row
# datafile: File with the values to access
# column:   Index (one-based) of the column with the value to read
# row:      Index (one-based) of the row with the value to read
#
# call "read_value.gp" datafile column_search column_value key
# datafile:      File with the values to access
# column_search: Index of the column where a key should be searched
# column_value:  Index of the column where the valued to be read is located
# key:           Key associated to the value that should be searched

set terminal unknown

if ($# == 3) \
   gprv_column = $1; \
   gprv_row = $2; \
   plot "$0" index 0 every 1:1:gprv_row:0:gprv_row:0 using (gprv_result = column(gprv_column)):1
if ($# == 4) \
   gprv_column_search = $1; \
   gprv_column_value = $2; \
   gprv_key = $3; \
   plot "$0" index 0 using (column(gprv_column_search) == gprv_key ? gprv_result = column(gprv_column_value):1/0):1