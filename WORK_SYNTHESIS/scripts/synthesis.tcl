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
# set blockName "aes_cipher_top"
set blockName "c5315"
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
## DEFINE DESIGN ENVIRONMENT
######################################################################
set_operating_condition -library  "[lindex ${target_library} 0]:CORE65LPLVT" nom_1.20V_25C
set_wire_load_model -library "[lindex ${target_library} 0]:CORE65LPLVT" -name area_12Kto18K [find design *]
set_load 0.05 [all_outputs]

######################################################################
## SET DESIGN CONSTRAINTS
######################################################################
source "./rtl/${blockName}/sdc/${blockName}.sdc"

#######################################################################
## OPTIMIZE DESIGN
######################################################################
link
ungroup -all -flatten

source "./scripts/power_features.tcl"

compile_ultra

#optimize_registers -clock $clockName -minimum_period_only
#set_fix_hold $clockName
#compile -incremental_mapping -map_effort high -ungroup_all

#######################################################################
## SAVE DESIGN
######################################################################

write -format verilog -hierarchy -output "${dirname}/${blockName}_postsyn.v" 
write_sdc -version 1.3 "${dirname}/${blockName}_postsyn.sdc"
report_threshold_voltage_group
#report_threshold_voltage_group > ${dirname}/${blockName}_report_vth.rpt
# set paths [get_timing_paths -nworst 10]
# 
# foreach_in_collection path $paths {
#   foreach_in_collection i $path {
#     get_cell   >>  ${dirname}/${blockName}_critical_paths.rpt
#   }
#   "i"  >> ${dirname}/${blockName}_critical_paths.rpt
# }

#####################################################################
## CLEAN & EXIT
######################################################################

# exec rm -rf $libDir
# source "./scripts/pt_analysis.tcl"
# 
# exit
