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
##############################################################
## READ DESIGN
##############################################################
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
  
##############################################################
## ANALYSIS
##############################################################

#set timing_save_pin_arrival_and_slack true 
update_timing -full
set_HVT_LVT
report_global_slack -max 

##############################################################
# HVT_map procedure
##############################################################
proc HVT_map {} {
  set TIME_start [clock clicks -milliseconds]
  set execution_type "soft"
  #compute number of cells that must be swapped to HVT
  set number_of_cells [sizeof_collection [get_cell]]
  set percentage_lvt [expr {int(0.1*100)}]
  set number_of_cycles 10
  set number_hvt  [expr {(100 - $percentage_lvt) * $number_of_cells / 100 }]  
  set N [expr {$number_hvt/$number_of_cycles}]
  set number_cells_changed 0

  ######## DEBUG ONLY #######
  set counter 0
  
  set remaining $number_hvt
  ###########################
  # Create 2  lists ordered by slack
  ###########################
  while {$remaining > 0} {
    set lvt_pins [get_pins -filter "@cell.lib_cell.threshold_voltage_group == LVT"]
    # take pins collection and sort by slack 
    set sorted_pins_collection [sort_collection $lvt_pins {max_slack}]
    # eliminate multiple cells
    set cell_unmasked [get_attribute $sorted_pins_collection cell]
    set cell [index_collection $cell_unmasked 0]
    append_to_collection cell $cell_unmasked -unique
    # now cell_unmasked contains a collection of cells sorted from lower to higher slack 
    set cell_list      [get_attribute $cell full_name]
    set type_cell_list [get_attribute $cell ref_name]
    #report_threshold_voltage_group
    

    ######## DEBUG ONLY #######
    echo "remaining before = $remaining"

    ###########################
    # Change cells 
    ###########################
    set coll_length [expr {[sizeof_collection $cell] - 1}]
    if {$remaining <= $N} {
      set N [incr remaining]
    ######## DEBUG ONLY #######
    echo "N: $N (should be equal to remaining + 1"
    }
    for {set x 0} {$x<$N} {incr x} {
      set pointer   [expr   {$coll_length - $x}]
      set cell_temp [lindex $cell_list $pointer]
      set temp      [lindex $type_cell_list $pointer ]
      set type_temp [string replace $temp 5 6 LH]
      size_cell $cell_temp CORE65LPHVT_nom_1.20V_25C.db:CORE65LPHVT/$type_temp
    }
    update_timing
    report_threshold_voltage_group
    ######## DEBUG ONLY #######
           echo "SLACK IS :"
           echo [set slack_tot  [get_attribute [get_timing_paths] slack]]
    echo "NUMBER OF CYCLES: "
    echo [incr counter]

    incr remaining -$N

     if {$execution_type == "soft"} {
       set slack_tot  [get_attribute [get_timing_paths] slack]
       if { $slack_tot < 0 } {
         set remaining $N
         while {$slack_tot < 0} { 
           echo "print N" [ set N [expr {($N >> 2)+ 1} ]]
       
           set hvt_pins [get_pins -filter "@cell.lib_cell.threshold_voltage_group == HVT"]
           # take pins collection and sort by slack 
           set sorted_pins_collection [sort_collection $hvt_pins {max_slack}]
           # eliminate multiple cells
           set cell_unmasked [get_attribute $sorted_pins_collection cell]
           set cell [index_collection $cell_unmasked 0]
           append_to_collection cell $cell_unmasked -unique
           # now cell_unmasked contains a collection of cells sorted from lower to higher slack 
           set cell_list      [get_attribute $cell full_name]
           set type_cell_list [get_attribute $cell ref_name]
           #report_threshold_voltage_group
           

           ######## DEBUG ONLY #######
           echo "remaining before = $remaining"

           ###########################
           # Change cells 
           ###########################
           set coll_length [expr {[sizeof_collection $cell] - 1}]
           if {$remaining <= $N} {
             set N [incr remaining]
           }
           for {set x 0} {$x<$N} {incr x} {
             set pointer   [expr   {$x}]
             set cell_temp [lindex $cell_list $pointer]
             set temp      [lindex $type_cell_list $pointer ]
             set type_temp [string replace $temp 5 6 LL]
             size_cell $cell_temp CORE65LPLVT_nom_1.20V_25C.db:CORE65LPLVT/$type_temp
           }
           update_timing
           echo "SLACK IS: [set slack_tot  [get_attribute [get_timing_paths] slack]]"

         }
       set remaining 0  
       }
     }
     echo "Time elapsed is: [expr {[clock clicks -milliseconds] - $TIME_start}]"
    ######## DEBUG ONLY #######
    echo "remaining after = $remaining"
  } 
  report_threshold_voltage_group
}


##############################################################
# restore all cells to LVT
##############################################################
proc LVT_restore {} {
    set lvt_cell [get_cells]
    foreach z [get_attribute $lvt_cell full_name ] y [get_attribute $lvt_cell ref_name ] {
      set   lvt_type_temp [string replace $y 5 6 LL ]
      size_cell $z CORE65LPLVT_nom_1.20V_25C.db:CORE65LPLVT/$lvt_type_temp
    }
    report_threshold_voltage_group
}

