set_component prj_2_memory_sb_sb_MSS
# Microchip Technology Inc.
# Date: 2025-Jul-24 13:20:55
#

create_clock -period 80 [ get_pins { MSS_ADLIB_INST/CLK_CONFIG_APB } ]
set_false_path -ignore_errors -through [ get_pins { MSS_ADLIB_INST/CONFIG_PRESET_N } ]
