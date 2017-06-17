set fID [open "../tech/STcmos65/CORE65LPSVT_bc_1.30V_m40C.lib" r]

while {[gets $fID line] >0 } {
    set scan_name_result [scan $line "cell(%s){" temp_ref]
    if {$scan_name_result == 1 && [llength temp_cap_list] > 0} {
        lappend cell_ref_list temp_ref
        lappend pin_cap_list temp_cap_list
        set temp_cap_list {}
        continue
    }
    set scan_cap_result [scan $line "capacitance: %s" temp_cap]
    if {$scan_cap_result == 1} {
        lappend temp_cap_list temp_cap
    }
}
