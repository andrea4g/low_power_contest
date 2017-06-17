list cell_list_name
list cell_list_ref
list cell_list_area
list cell_list_leakage
list cell_list_dynamic

set total_area 0
set total_leakage 0
set total_dynamic 0

foreach_in_collection point_cell [get_cells] {
    set cell_name [get_attribute $point_cell full_name]
    set cell_type [get_attribute $point_cell is_combinational]
    set cell_ref [get_attribute $point_cell ref_name]
    set cell_area [get_attribute $point_cell area]
    set cell_leakage [get_attribute $point_cell leakage_power]
    set cell_dynamic [get_attribute $point_cell dynamic_power]


    if {$cell_type == true} {
        lappend cell_list_name $cell_name
        lappend cell_list_ref $cell_ref
        lappend cell_list_area $cell_area
        lappend cell_list_leakage $cell_leakage
        lappend cell_list_dynamic $cell_dynamic

        set total_area [expr {$total_area+$cell_area}]
        set total_leakage [expr {$total_leakage+$cell_leakage}]
        set total_dynamic [expr {$total_dynamic+$cell_dynamic}]
    }
}

lsort -real $cell_list_dynamic
