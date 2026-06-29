open_project -project {C:\Users\Acacio\Documents\GitHub\FPGA_design\FPGA2memory\designer\prj_2_memory_sb\prj_2_memory_sb_fp\prj_2_memory_sb.pro}\
         -connect_programmers {FALSE}
load_programming_data \
    -name {M2S025T} \
    -fpga {C:\Users\Acacio\Documents\GitHub\FPGA_design\FPGA2memory\designer\prj_2_memory_sb\prj_2_memory_sb.map} \
    -header {C:\Users\Acacio\Documents\GitHub\FPGA_design\FPGA2memory\designer\prj_2_memory_sb\prj_2_memory_sb.hdr} \
    -spm {C:\Users\Acacio\Documents\GitHub\FPGA_design\FPGA2memory\designer\prj_2_memory_sb\prj_2_memory_sb.spm} \
    -dca {C:\Users\Acacio\Documents\GitHub\FPGA_design\FPGA2memory\designer\prj_2_memory_sb\prj_2_memory_sb.dca}
export_single_ppd \
    -name {M2S025T} \
    -file {C:\Users\Acacio\Documents\GitHub\FPGA_design\FPGA2memory\designer\prj_2_memory_sb\prj_2_memory_sb.ppd}

save_project
close_project
