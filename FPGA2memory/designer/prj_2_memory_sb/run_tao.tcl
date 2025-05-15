set_device -family {SmartFusion2} -die {M2S025T} -speed {STD}
read_verilog -mode system_verilog {C:\Users\Jmano\Projetos_LESC\FPGA_design\FPGA2memory\component\work\OSC_C0\OSC_C0_0\OSC_C0_OSC_C0_0_OSC.v}
read_verilog -mode system_verilog {C:\Users\Jmano\Projetos_LESC\FPGA_design\FPGA2memory\component\work\OSC_C0\OSC_C0.v}
read_verilog -mode system_verilog {C:\Users\Jmano\Projetos_LESC\FPGA_design\FPGA2memory\hdl\MRSC_decoder.sv}
read_verilog -mode system_verilog {C:\Users\Jmano\Projetos_LESC\FPGA_design\FPGA2memory\hdl\MRSC_encoder.sv}
read_verilog -mode system_verilog {C:\Users\Jmano\Projetos_LESC\FPGA_design\FPGA2memory\hdl\TBEC_RSC_decoder.sv}
read_verilog -mode system_verilog {C:\Users\Jmano\Projetos_LESC\FPGA_design\FPGA2memory\hdl\TBEC_RSC_encoder.sv}
 add_include_path  {C:\Users\Jmano\Projetos_LESC\FPGA_design\FPGA2memory\hdl}
 add_include_path  {C:\Users\Jmano\Projetos_LESC\FPGA_design\FPGA2memory\hdl}
 add_include_path  {C:\Users\Jmano\Projetos_LESC\FPGA_design\FPGA2memory\hdl}
 add_include_path  {C:\Users\Jmano\Projetos_LESC\FPGA_design\FPGA2memory\hdl}
read_verilog -mode system_verilog {C:\Users\Jmano\Projetos_LESC\FPGA_design\FPGA2memory\hdl\ecc_design.sv}
 add_include_path  {C:\Users\Jmano\Projetos_LESC\FPGA_design\FPGA2memory\hdl}
read_verilog -mode system_verilog {C:\Users\Jmano\Projetos_LESC\FPGA_design\FPGA2memory\hdl\design.sv}
read_verilog -mode system_verilog {C:\Users\Jmano\Projetos_LESC\FPGA_design\FPGA2memory\component\work\prj_2_memory_sb\prj_2_memory_sb.v}
set_top_level {prj_2_memory_sb}
map_netlist
check_constraints {C:\Users\Jmano\Projetos_LESC\FPGA_design\FPGA2memory\constraint\synthesis_sdc_errors.log}
write_fdc {C:\Users\Jmano\Projetos_LESC\FPGA_design\FPGA2memory\designer\prj_2_memory_sb\synthesis.fdc}
