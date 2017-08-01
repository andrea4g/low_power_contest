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
set in_verilog_filename "${dir}/${blockName}_postsyn.v"
set in_sdc_filename "${dir}/${blockName}_postsyn.sdc"

# READ
read_verilog $in_verilog_filename
read_sdc -version 1.3 $in_sdc_filename

##############################################################
# ANALYSIS
##############################################################

update_timing -full

##############################################################
# HVT_map procedure
##############################################################

proc dualVth {args} {
  parse_proc_arguments -args $args results
  set lvt $results(-lvt)
  set constraint $results(-constraint)
  if {$constraint == "soft"} {
    set cycles 15
  } else {
    set cycles 5
  }

  set_user_attribute [find library CORE65LPLVT] default_threshold_voltage_group LVT > /dev/null
  set_user_attribute [find library CORE65LPHVT] default_threshold_voltage_group HVT > /dev/null
  report_global_slack -max > /dev/null
  #################################
  ### INSERT YOUR COMMANDS HERE ###
  #################################

  # Compute number of cells that must be swapped to HVT
  set number_of_cells [sizeof_collection [get_cell]]
  set percentage_lvt [expr {int($lvt * 100)}]
  set number_hvt  [expr {(100 - $percentage_lvt) * $number_of_cells / 100 }]
  set N [expr {$number_hvt/$cycles}]
  if {$N < 1} {
    set N 1
  }

  set remaining $number_hvt

  ###########################
  # Create 2 lists ordered by slack
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

    ###########################
    # Change cells LVT -> HVT #
    ###########################

    set coll_length [expr {[sizeof_collection $cell] - 1}]

    if {$remaining <= $N} {
      set N [incr remaining]
    }

    for {set x 0} {$x<$N} {incr x} {
      set pointer   [expr   {$coll_length - $x}]
      set cell_temp [lindex $cell_list $pointer]
      set temp      [lindex $type_cell_list $pointer ]
      set type_temp [string replace $temp 5 6 LH]
      size_cell $cell_temp CORE65LPHVT_nom_1.20V_25C.db:CORE65LPHVT/$type_temp > /dev/null
    }

    update_timing

    incr remaining -$N

    if {$constraint == "soft"} {
      set slack_tot [get_attribute [get_timing_paths] slack]
      if { $slack_tot < 0 } {
        set remaining $N
        while {$slack_tot < 0} {
          set N [expr {($N >> 2) + 1} ]

          set hvt_pins [get_pins -filter "@cell.lib_cell.threshold_voltage_group == HVT"]
          # Take pins collection and sort by slack
          set sorted_pins_collection [sort_collection $hvt_pins {max_slack}]
          # Delete repeated cells
          set cell_unmasked [get_attribute $sorted_pins_collection cell]
          set cell [index_collection $cell_unmasked 0]
          append_to_collection cell $cell_unmasked -unique
          # Now cell_unmasked contains a collection of cells sorted from lower to higher slack
          set cell_list      [get_attribute $cell full_name]
          set type_cell_list [get_attribute $cell ref_name]

          ###########################
          # Change cells HVT -> LVT #
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
            size_cell $cell_temp CORE65LPLVT_nom_1.20V_25C.db:CORE65LPLVT/$type_temp > /dev/null
          }

          update_timing
          set slack_tot  [get_attribute [get_timing_paths] slack]
        }
        break
      }
    }
  }
  return
}

define_proc_attributes dualVth \
-info "Post-Synthesis Dual-Vth cell assignment" \
-define_args \
{
  {-lvt "maximum % of LVT cells in range [0, 1]" lvt float required}
  {-constraint "optimization effort: soft or hard" constraint one_of_string {required {values {soft hard}}}}
}

