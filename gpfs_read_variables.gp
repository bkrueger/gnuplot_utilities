# Reads the margins from the command line

if ($# == 2) \
   gpfs_margin_horizontal_left = $0; \
   gpfs_margin_horizontal_right = $0; \
   gpfs_margin_vertical_bottom = $1; \
   gpfs_margin_vertical_top = $1
if ($# == 3) \
   gpfs_margin_horizontal_left = $0; \
   gpfs_margin_horizontal_right = $0; \
   gpfs_margin_vertical_bottom = $1; \
   gpfs_margin_vertical_top = $2
if ($# == 4) \
   gpfs_margin_horizontal_left = $0; \
   gpfs_margin_horizontal_right = $1; \
   gpfs_margin_vertical_bottom = $2; \
   gpfs_margin_vertical_top = $3
