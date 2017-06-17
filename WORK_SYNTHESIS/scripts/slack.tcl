proc create_environment {blockName name} {
  set active_design $blockName
  set dirname "./saved/${blockName}"
  if {![file exists $dirname]} {
    file mkdir $dirname
  }
  set filename "${dirname}/${blockName}_/${name}.rpt"
}

proc custom_report_worst_paths_per_group {numberOfPaths} {
  set blockName "c1908"
  set dirname "./saved/${blockName}"
  set filename "${dirname}/${blockName}_critical_paths.rpt"
  set fileId [open $filename "w"]

  foreach_in_collection path [get_timing_paths -nworst $numberOfPaths] {
    set slack [get_attribute $path slack]
    set points [get_attribute $path points]
    puts -nonewline $fileId "\n\nPath slack: "
    puts $fileId $slack
    foreach_in_collection point $points {
      puts -nonewline $fileId "\n\nObject name: "
      puts -nonewline $fileId [get_object_name $point]
      puts -nonewline $fileId "\tobject: "
      puts -nonewline $fileId [get_attribute $point object]
      puts -nonewline $fileId "\tFullName: "
      puts -nonewline $fileId [get_attribute $point full_name]
      puts -nonewline $fileId "\tRefName: "
      puts -nonewline $fileId [get_attribute $point ref_name]
    }
  }
  close $fileId
}

proc custom_get_cells {} {
  set blockName "c1908"
  set name "cells"
  set active_design $blockName
  set dirname "./saved/${blockName}"
  if {![file exists $dirname]} {
    file mkdir $dirname
  }
  set filename "${dirname}/${blockName}_${name}.rpt"
  set fileId [open $filename "w"]
  puts -nonewline $fileId [get_object_name [get_cells]]
  close $fileId
}

proc custom_get_timing_path {} {
  set blockName "c1908"
  set name "timing_path"
  set active_design $blockName
  set dirname "./saved/${blockName}"
  if {![file exists $dirname]} {
    file mkdir $dirname
  }
  set filename "${dirname}/${blockName}_${name}.rpt"
  set fileId [open $filename "w"]
  puts -nonewline $fileId [get_object_name [get_timing_path]]
  close $fileId
}

