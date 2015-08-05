# File to read a single value from a file into a variable
# The value will be stored in the variable "gprv_result"
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

if ($# == 3) \
   gprv_column = $1; \
   gprv_row = $2; \
   load "<grep -v -e \"^#\" -e \"^ *$$\" $0 | head -n ".sprintf("%i", gprv_row)." | tail -n 1 | awk '{ printf \"gprv_result = \"$$".sprintf("%i", gprv_column)." }'"

if ($# == 4) \
   gprv_column_search = $1; \
   gprv_column_value = $2; \
   gprv_key = $3; \
   load "<awk '$$".sprintf("%i", gprv_column_search)." == ".sprintf("%f", gprv_key)." { printf \"gprv_result = \"$$".sprintf("%i", gprv_column_value)."\"\\n\" }' $0"

