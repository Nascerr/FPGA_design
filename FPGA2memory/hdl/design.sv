`include "ecc_design.sv"

module fpga_top_design( inout wire [15:0] mcu_fpga_io, 
                        inout wire [15:0] fpga_mem_io_up,
                        inout wire [15:0] fpga_mem_io_down,
                        input logic 	    write_en,
                        input logic       chip_sel,
                        output logic [1:0] chip_sel_out,
                        input logic [2:0]   ecc_sel,
                        output logic [0:2] flag_out,
                        input logic clk,
                        input logic output_en);

 
  logic [15:0] encoder_input;
  logic [15:0] decoder_output;
  logic [15:0] encoder_output_up;
  logic [15:0] decoder_input_up;
  logic [15:0] encoder_output_down;
  logic [15:0] decoder_input_down;
  logic [0:2] flag;
  
    
  //buffer tristate MCU-FPGA
    assign mcu_fpga_io = (write_en == 0 && (chip_sel_out [1] == 0 || chip_sel_out[0] == 0))? 16'bz: decoder_output;
    assign encoder_input = mcu_fpga_io;
    
    // buffer tristate FPGA-MEM脫RIA
    // quando chip_sel_out[1]==0, escreve na mem髍ia up
    assign fpga_mem_io_up   =
           (write_en==1'b0
            && chip_sel_out[1]==1'b0)
         ? encoder_output_up
         : 16'bz;

    // quando chip_sel_out[0]==0, escreve na mem髍ia down
    assign fpga_mem_io_down =
           (write_en==1'b0
            && chip_sel_out[0]==1'b0)
         ? encoder_output_down
         : 16'bz;

    assign decoder_input_up   =
           (write_en==1'b0 
           && chip_sel_out[1]==1'b0)
         ? 16'bz
         : fpga_mem_io_up;

    assign decoder_input_down =
           (write_en==1'b0 
           && chip_sel_out[0]==1'b0)
         ? 16'bz
         : fpga_mem_io_down;

always_ff @(posedge clk) begin
    if (write_en == 0 && (chip_sel_out [1] == 0 || chip_sel_out[0] == 0)) begin
        flag_out <= 3'b000; // Prioridade para escrita
    end else if (output_en == 0 && (chip_sel_out [1] == 0 || chip_sel_out[0] == 0)) begin
        flag_out <= flag; // Leitura
    end else begin
        flag_out <= flag_out; // Mant閙 o valor
    end
end



  
 ecc_design modulo(.data_in_left(encoder_input), // entrada FPGA pelo processador
                    .data_out_right_up(encoder_output_up), // sa铆da mem贸ria 1
                    .data_out_right_down(encoder_output_down), // sa铆da mem贸ria 2
                    .data_in_right_up(decoder_input_up), // entrada mem贸ria 1
                    .data_in_right_down(decoder_input_down), // entrada mem贸ria 2
                    .data_out_left(decoder_output), // saida FPGA para o processador
                    .sel(ecc_sel),
                    .flag(flag),
                    .chip_sel_out(chip_sel_out),
                    .chip_sel(chip_sel));  
   
                                                                             
    
   
endmodule