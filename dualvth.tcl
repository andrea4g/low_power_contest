proc dualVth {args} {
	parse_proc_arguments -args $args results
	set lvt $results(-lvt)
	set constraint $results(-constraint)

	#################################
	### INSERT YOUR COMMANDS HERE ###
	#################################

	return
}

define_proc_attributes dualVth \
-info "Post-Synthesis Dual-Vth cell assignment" \
-define_args \
{
	{-lvt "maximum % of LVT cells in range [0, 1]" lvt float required}
	{-constraint "optimization effort: soft or hard" constraint one_of_string {required {values {soft hard}}}}
}
