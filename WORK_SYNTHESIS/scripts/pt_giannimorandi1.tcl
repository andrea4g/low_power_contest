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
set in_verilog_filename "${dir}/${blockName}_LVT_postsyn.v"
set in_sdc_filename "${dir}/${blockName}_LVT_postsyn.sdc"
# DEFINE LVT/HVT cells
proc set_HVT_LVT {} {
   set_user_attribute [find library CORE65LPLVT] default_threshold_voltage_group LVT
   set_user_attribute [find library CORE65LPHVT] default_threshold_voltage_group HVT
}
# READ
read_verilog $in_verilog_filename
read_sdc -version 1.3 $in_sdc_filename
######################################################################
## ANALYSIS
######################################################################

#set timing_save_pin_arrival_and_slack 1
update_timing -ful
report_global_slack -max
## CREATE 3 LIST WITH DESIRED PARAMETERS  
set cell  ""
set pin   ""
set slack "" 

foreach_in_collection PIN [get_pins] {
    lappend cell  "[get_attribute [get_attribute $PIN cell] full_name]"
    lappend type  "[get_attribute [get_attribute $PIN cell] ref_name] "
    lappend slack "[get_attribute $PIN max_slack ]"
}

## CREATE A NEW LIST MERGING CELL NAME AND MIN_SLACK OF THAT CELL
set cell_pin ""
set temp [lindex $cell 0]
set min_slack [lindex $slack 0]

foreach x $cell y $slack z $type {
  if {$x != $temp} {
    lappend cell_pin  "$min_slack  $temp  $z"
    set temp $x
    set min_slack $y
  } else {
    if {$y < $min_slack} {
      set min_slack $y
    }
  }
}
## SORT THE LIST IN DECREASING ORDER
set sorted_list [lsort -decreasing -real -index 0 \ $cell_pin]


