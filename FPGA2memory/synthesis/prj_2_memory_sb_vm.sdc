# Written by Synplify Pro version map202309act, Build 044R. Synopsys Run ID: sid1739384541 
# Top Level Design Parameters 

# Clocks 
create_clock -period 10.000 -waveform {0.000 5.000} -name {ecc_design|un1_sel_2_inferred_clock} [get_pins {fpga_top_design_0/modulo/un1_sel_2_inferred_clock_RNO/Y}] 
create_clock -period 10.000 -waveform {0.000 5.000} -name {ecc_design|data_out_right_up9_inferred_clock} [get_pins {fpga_top_design_0/modulo/data_out_right_up9_inferred_clock_RNO/Y}] 
create_clock -period 10.000 -waveform {0.000 5.000} -name {TBEC_RSC_decoder|quad117_inferred_clock} [get_pins {fpga_top_design_0/modulo/decodificador1/quad117_m7_i_m2/Y}] 

# Virtual Clocks 

# Generated Clocks 

# Paths Between Clocks 

# Multicycle Constraints 

# Point-to-point Delay Constraints 

# False Path Constraints 

# Output Load Constraints 

# Driving Cell Constraints 

# Input Delay Constraints 

# Output Delay Constraints 

# Wire Loads 

# Other Constraints 

# syn_hier Attributes 

# set_case Attributes 

# Clock Delay Constraints 
set Inferred_clkgroup_1 [list ecc_design|un1_sel_2_inferred_clock]
set Inferred_clkgroup_2 [list ecc_design|data_out_right_up9_inferred_clock]
set Inferred_clkgroup_3 [list TBEC_RSC_decoder|quad117_inferred_clock]
set_clock_groups -asynchronous -group $Inferred_clkgroup_1
set_clock_groups -asynchronous -group $Inferred_clkgroup_2
set_clock_groups -asynchronous -group $Inferred_clkgroup_3

set_clock_groups -asynchronous -group [get_clocks {OSC_C0_OSC_C0_0_OSC|N_RCOSC_25_50MHZ_CLKOUT_inferred_clock}]
set_clock_groups -asynchronous -group [get_clocks {ecc_design|un1_sel_2_inferred_clock}]
set_clock_groups -asynchronous -group [get_clocks {ecc_design|data_out_right_up9_inferred_clock}]
set_clock_groups -asynchronous -group [get_clocks {TBEC_RSC_decoder|quad117_inferred_clock}]

# syn_mode Attributes 

# Cells 

# Port DRC Rules 

# Input Transition Constraints 

# Unused constraints (intentionally commented out) 


# Non-forward-annotatable constraints (intentionally commented out) 

# Block Path constraints 

