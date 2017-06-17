proc custom {} {
  set blockName "c432"
  set dirname "./saved/${blockName}"
  
  set paths [get_timing_paths -nworst 10]
  # Get the paths
  foreach_in_collection path $paths {
    # Get the cells
    foreach_in_collection mycell [$path] {
      #mycell >>  ${dirname}/${blockName}_critical_paths.rpt
      get_at
    }
  }
}
