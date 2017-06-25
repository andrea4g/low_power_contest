2.  Synopsys Commands                                        Command Reference
                        report_threshold_voltage_group

NAME
       report_threshold_voltage_group
              Reports  the  number, leakage power, and percentage of cells for
              each threshold voltage group in the design, including the  user-
              specified low threshold voltage groups.

SYNTAX
       string report_threshold_voltage_group
              [-lvth_groups groups]
              [-pattern_priority pattern_list]
              [-attribute attribute_name_for_cell_pattern]
              [-nosplit]
              [-verbose]
              [-area]
              cell_list_or_current_design

   Data Types
       groups                                list
       cell_list_or_current_design           list
       pattern_list                          list
       fIattribute_name_for_cell_pattern     string

ARGUMENTS
       -lvth_groups groups
              Specifies  the list of threshold voltage groups to considered as
              low threshold voltage groups. The value of the  groups  argument
              is  a  list of threshold voltage group identifiers. Each identi-
              fier is a nonempty string that consists of alphanumeric  charac-
              ters  and  the  underscore character ("_"). If the option is not
              specified, the low threshold voltage groups are not reported.

       -pattern_priority
              Specifies the list of patterns of cell name  (or  its  attribute
              value)  to  process  for  generating the threshold voltage group
              leakage report.

       -attribute
              Specifies the name of the cell attribute where the value is used
              to  match  the  name  patterns supplied with '-pattern_priority'
              option.

       -nosplit
              Prevents line splitting when the information exceeds the  speci-
              fied  column width.  Most of the design information is listed in
              fixed-width columns.  If  the  information  for  a  given  field
              exceeds  its column's width, the next field begins on a new line
              beginning with the correct column.

       -verbose
              Lists all the cells belonging to each threshold  voltage  group.
              If the option is not specified, the default summary report shows
              only the number and percentage of cells.

       -area  Lists all the cell area  belonging  to  each  threshold  voltage
              group.   If  the  option  is  specified it reports the cell area
              according to the threshold voltage groups.

       cell_list_or_current_design
              Specifies a list  of  cells  to  report  as  threshold   voltage
              groups.  If the option is not specified, the report is generated
              for the current design.

DESCRIPTION
       Use the report_threshold_voltage_group command to report the  threshold
       voltage  group for the given list of cells or design (cell_list_or_cur-
       rent_design). If no list is provided, a report  is  generated  for  the
       current design. This command identifies the threshold voltage groups to
       which the cells can  be  categorized  depending  on  the  library-level
       default_threshold_voltage_group  attribute  or  the  cell-level thresh-
       old_voltage_group attribute. The cell-level attribute takes  precedence
       over the library-level attribute in the grouping process.

       When  you  use  the report_threshold_voltage_group -leakage command, it
       also reports the leakage  power  according  to  the  threshold  voltage
       groups.  Specify  the  update_power  command  before the report_thresh-
       old_voltage_group command. Otherwise, during the leakage-only mode, the
       tool  runs  the  update_power command within the report_threshold_volt-
       age_group command.

EXAMPLES
       In the following example, library-level attribute is set and  then  the
       report_threshold_voltage_group  -lvth_groups command is specified. This
       command groups LVT and SVT as low-threshold voltage groups.

         pt_shell> define_user_attribute -type string -class lib default_threshold_voltage_group
         pt_shell> set_user_attribute [get_libs agl90g_od_svt_ss] default_threshold_voltage_group SVT
         pt_shell> set_user_attribute [get_libs agl90g_od_lvt_ss] default_threshold_voltage_group LVT
         pt_shell> report_threshold_voltage_group -lvth_groups {lvt svt}
         ----------------------------------------------------------------------------------------------------
                                 Threshold Voltage Group Report

         Attributes :
         ------------
                  u -> user-defined power group
                  L -> user-defined low Vth group

         Power Group         ABCD         LVT(L)       XYZK(L)     SVT
         Name                cell (%)     cell (%)     cell (%)    cell (%)  Attribute
         ---------------------------------------------------------------------------------
         io_pad              0 (0.00%)    0 (0.00%)    0 (0.00%)   0 (0.00%)
         memory              0 (0.00%)    0 (0.00%)    0 (0.00%)   0 (0.00%)
         clock_network       0 (0.00%)    0 (0.00%)    0 (0.00%)   0 (0.00%)
         black_box           0 (0.00%)    0 (0.00%)    0 (0.00%)   0 (0.00%)
         register            0 (0.00%)    0 (0.00%)    1 (25.00%)  3 (75.00%)
         combinational       1 (3.33%)   13 (43.33%)   0 (0.00%)  16 (53.33%)
         sequential          0 (0.00%)    4 (100.00%)  0 (0.00%)   0 (0.00%)
         ---------------------------------------------------------------------------------
         Total               1 (2.63%)   17 (44.74%)   1 (2.63%)  19 (50.00%)
         ---------------------------------------------------------------------------------
         SUMMARY :

                   Low Vth cell (%) = 18 (47.37%)
                   Total cell (%) =   38 (100.00%)
         --------------------------------------------------------------------------------

         1

SEE ALSO
       define_user_attribute(2)
       report_power(2)
       set_user_attribute(2)

                            Version J-2014.12
            Copyright (c) 2014 Synopsys, Inc. All rights reserved.
