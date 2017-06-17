proc proc1 {} {
  set name "report_analisys_coverage"
  set blockName "c432"
  set dirname "./saved/${blockName}"
  if {![file exists $dirname]} {
    file mkdir $dirname
  }
  set filename "${dirname}/${blockName}_${name}.rpt"
  set fileId [open $filename "w"]
  puts -nonewline $fileId [get_object_name [get_cells]]
  close $fileId
}

