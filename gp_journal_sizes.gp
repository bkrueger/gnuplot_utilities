# File for providing the width of several scientific journals
# All variables are given in centimeters

# Function for converting a float number into a string with attached "cm" that can be used e.g. for terminal settings
gpjs_to_string(x) = sprintf("%.2f", x)."cm"

# Sizes of American Physical Society (APS) journals
gpjs_aps = 8.6
gpjs_prl = gpjs_aps
gpjs_pra = gpjs_aps
gpjs_prb = gpjs_aps
gpjs_prc = gpjs_aps
gpjs_prd = gpjs_aps
gpjs_pre = gpjs_aps
gpjs_prx = gpjs_aps

# Journal of Statistical Physics (JStatPhys)
gpjs_jstatphys = 11.88

# Europhysic Letters (EPL)
gpjs_epl = 8.82
gpjs_epl_single_column = 8.82
gpjs_epl_double_column = 18.00

# New Journal of Physics
gpjs_njp = 13.2