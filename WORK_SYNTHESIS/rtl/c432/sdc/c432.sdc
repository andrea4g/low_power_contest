set sdc_version 1.3

set clockName "clk"
set clockPeriod "1.25"

;# Set-up Clock
create_clock -name $clockName -period $clockPeriod

;# fix hold constraints
set_min_delay 0.20 -from [all_inputs] -to [all_outputs]

;# Set-up IOs
set_driving_cell -library "CORE65LPLVT_nom_1.20V_25C.db:CORE65LPLVT" -lib_cell "HS65_LL_BFX7" [all_inputs]
#set_driving_cell -library "CORE65LPHVT_nom_1.20V_25C.db:CORE65LPHVT" -lib_cell "HS65_LH_BFX7" [all_inputs]

set_input_delay 0.15 -clock $clockName [all_inputs]
set_output_delay 0.15 -clock $clockName [all_outputs]

set max_transition_time 0.1
set_max_transition $max_transition_time [all_outputs]

;# Set area constraint
set_max_area 0
