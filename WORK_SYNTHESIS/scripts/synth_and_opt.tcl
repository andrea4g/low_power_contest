##	+----------------------------------------------------------------
##	|		 Synthesis and Optimization of Digital Systems			|
##	|				Politecnico di Torino - TO - Italy				|
##	|						DAUIN - EDA GROUP						|
##	+----------------------------------------------------------------
##	|	author: andrea calimera										|
##	|	mail:	andrea.calimera@polito.it							|
##	|	title:	synthesis.tcl										|
##	+----------------------------------------------------------------
##	| 	Copyright 2015 DAUIN - EDA GROUP							|
##	+----------------------------------------------------------------

######################################################################
##
## SPECIFY LIBRARIES
##
######################################################################

# SOURCE SETUP FILE
source "./tech/STcmos65/synopsys_dc.setup"

# SUPPRESS WARNING MESSAGES
suppress_message MWLIBP-319
suppress_message MWLIBP-324
suppress_message TFCHK-012
suppress_message TFCHK-014
suppress_message TFCHK-049
suppress_message TFCHK-072
suppress_message TFCHK-084
suppress_message PSYN-651
suppress_message PSYN-650
suppress_message UID-401
suppress_message LINK-14
suppress_message TIM-134
suppress_message VER-130
suppress_message UISN-40
suppress_message VO-4
suppress_message RTDC-126

######################################################################
##
## READ DESIGN
##
######################################################################

# DEFINE CIRCUITS and WORK DIRS
set blockName "aes_cipher_top"
set active_design $blockName

# DEFINE WORK DIRS
set dirname "./saved/${blockName}"
if {![file exists $dirname]} {
	file mkdir $dirname
}
set dirname "./saved/${blockName}/synthesis"
if {![file exists $dirname]} {
	file mkdir $dirname
}
set libDir "./saved/${blockName}/synthesis/synlib"
file mkdir $libDir
define_design_lib $blockName -path $libDir

# ANALYZE HDL SOURCES
set HdlFileList [glob -dir "./rtl/${blockName}/verilog" "*.v*"]
foreach hdlFile $HdlFileList {
	if {[file extension $hdlFile]==".v"} {
		analyze -format verilog  -library $blockName $hdlFile
   } elseif {[file extension $hdlFile]==".vhd"} {
		analyze -format vhdl -library $blockName $hdlFile
    }
}

# ELABORATE DESIGN
elaborate -lib $blockName $blockName

######################################################################
##
## DEFINE DESIGN ENVIRONMENT
##
######################################################################
set_operating_condition -library  "${target_library}:CORE65LPSVT" nom_1.20V_25C
set_wire_load_model -library "${target_library}:CORE65LPSVT" -name area_12Kto18K [find design *]
set_load 0.05 [all_outputs]

######################################################################
## SET DESIGN CONSTRAINTS
######################################################################
set clock_list [list "5.0"]
foreach element  $clock_list {
set sdc_version 1.3

set clockName "clk"
set rstName "rst"
set clockPeriod $element

;# Set-up Clock
create_clock -period $clockPeriod $clockName
set_clock_uncertainty 0.05 $clockName
set_clock_transition 0.05 $clockName
set_clock_latency 0.05 $clockName
set_dont_touch_network $clockName
set_ideal_network $clockName
set_dont_touch_network $rstName
set_ideal_network $rstName

;# fix hold constraints
set_min_delay 0.20 -from [all_inputs] -to [all_outputs]

;# Set-up IOs
set_driving_cell -library "CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT" -lib_cell "HS65_LS_BFX7" [all_inputs]

set_input_delay 0.25 -clock $clockName [all_inputs]
set_output_delay 0.15 -clock $clockName [all_outputs]
set_input_delay 0 -clock clk clk

set max_transition_time 0.1
set_max_transition $max_transition_time [all_outputs]

;# Set area constraint
set_max_area 0


######################################################################
## OPTIMIZE DESIGN
######################################################################
link
ungroup -all -flatten

compile

optimize_registers -clock $clockName -minimum_period_only
set_fix_hold $clockName
compile -incremental_mapping -map_effort high -ungroup_all
######################################################################
##
## SAVE DESIGN
##
######################################################################

write -format verilog -hierarchy -output "${dirname}/${blockName}_postsyn.v"
write_sdc -version 1.3 "${dirname}/${blockName}_postsyn.sdc"

######################################################################
##
## CLEAN & EXIT
##
######################################################################
##	+----------------------------------------------------------------
##	|		 Synthesis and Optimization of Digital Circuits			|
##	|				Politecnico di Torino - TO - Italy				|
##	|						DAUIN - EDA GROUP						|
##	+----------------------------------------------------------------
##	|	author: andrea calimera										|
##	|	mail:	andrea.calimera@polito.it							|
##	|	title:	pt_analysis.tcl										|
##	+----------------------------------------------------------------
##	| 	Copyright 2015 DAUIN - EDA GROUP							|
##	+----------------------------------------------------------------

######################################################################
##
## SPECIFY LIBRARIES
##
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
##
## READ DESIGN
##
######################################################################
# DEFINE CIRCUITS
set blockName "aes_cipher_top"

## DEFINE INPUT FILES
set dir "./saved/${blockName}/synthesis"
set in_verilog_filename "${dir}/${blockName}_postsyn.v"
set in_sdc_filename "${dir}/${blockName}_postsyn.sdc"

## READ
#read_verilog $in_verilog_filename
#read_sdc -version 1.3 $in_sdc_filename

#update_timing -full

######################################################################
##
## TIMING ANALYSIS
##
######################################################################
# SETUP TIME
#report_timing -delay_type max

# SLACK CONDITION
#report_timing -delay_type min -slack_lesser_than 0.1 -max_paths 2
#report_timing -delay_type max -slack_lesser_than 0.0 -max_paths 2

######################################################################
##
## POWER ANALYSIS
##
######################################################################

#report_power

######################################################################
##
## WRITE REPORTS
##
######################################################################

# SET REPORT FILE NAME
set timing_rpt "${dir}/${blockName}_postsyn_timing_$clockPeriod.rpt"
set power_rpt "${dir}/${blockName}_postsyn_power_$clockPeriod.rpt"

# TIMING REPORT
report_timing > $timing_rpt

# POWER REPORT
report_power > $power_rpt

}
#end loop
######################################################################
##
## EXIT
##
######################################################################

#exit
