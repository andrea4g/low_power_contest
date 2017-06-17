######################################################################
## SPECIFY LIBRARIES
######################################################################

# SOURCE SETUP FILE
source "./tech/STcmos65/synopsys_pt.setup"

# DEFINE OPTIONS
set report_default_significant_digits 6
set power_enable_analysis true

# SUPPRESS WARNING MESSAGES
suppress_message RC-004
suppress_message PTE-003
suppress_message UID-401
suppress_message ENV-003
suppress_message UITE-489
suppress_message CMD-041
######################################################################
## READ DESIGN
######################################################################
# DEFINE CIRCUITS
set blockName "c1908"

# DEFINE INPUT FILES
set dir "./saved/${blockName}/synthesis"
set in_verilog_filename "${dir}/${blockName}_postsyn.v"
set in_sdc_filename "${dir}/${blockName}_postsyn.sdc"

# READ
read_verilog $in_verilog_filename
read_sdc -version 1.3 $in_sdc_filename

#set timing_save_pin_arrival_and_slack 1
update_timing -full

report_global_slack -max
#report_timing -sort_by slack
#get_object_name [get_cells]
#get_object_name [get_pins]

#get_attribute [get_pins] cell
list  pins_celle " [get_attribute [get_attribute  [get_pins] cell] full_name]" 
set indice 0
foreach_in_collection PIN [get_pins] {
  echo -n "Cell = [lindex $pins_celle $indice]   \t "
  echo -n "  pin  = [get_attribute $PIN full_name ] \t "
  echo "  slack = [get_attribute $PIN max_slack ] "
  incr indice
}
