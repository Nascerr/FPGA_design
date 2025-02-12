`include "TBEC_RSC_encoder.sv"
`include "TBEC_RSC_decoder.sv"
`include "MRSC_encoder.sv"
`include "MRSC_decoder.sv"
//`include "EDACencoder.sv"
//`include "EDACdecoder.sv"

module ecc_design(input logic [0:15] data_in_left, // entrada FPGA pelo processador
                  output logic [0:15] data_out_right_up, // saída memória 1
                  output logic [0:15] data_out_right_down, // saída memória 2
                  input logic [0:15] data_in_right_up, // entrada memória 1
                  input logic [0:15] data_in_right_down, // entrada memória 2
                  output logic [0:15] data_out_left, // saida FPGA para o processador
                  input logic [1:0] sel,             // seletor ecc/bypass
                  input logic [2:0]	      random_values13,
                  input logic [6:0]       random_values17,
                  input logic [4:0]       random_positions,
                  output logic [0:2] flag);
 
  logic [0:15] decoder_output1;
  logic [0:31] encoder_output1;
  logic [0:15] decoder_output2;
  logic [0:31] encoder_output2;
  
  logic [0:15] decoder_output3;
  logic [0:31] encoder_output3;
  
  logic [0:15] decoder_output4;
  logic [0:31] encoder_output4;
  
 
  
  TBEC_RSC_encoder codificador1(.data_in(data_in_left),.data_out(encoder_output1));
  TBEC_RSC_decoder decodificador1 (.data_in( {data_in_right_up,data_in_right_down}), .data_out(decoder_output1),.flag(flag));
  
  MRSC_encoder codificador2(.data_in(data_in_left),.data_out(encoder_output2));
  MRSC_decoder decodificador2 (.data_in( {data_in_right_up,data_in_right_down}), .data_out(decoder_output2));
  
  
  TBEC_RSC_encoder13 codificador1_3(.data_in(data_in_left),.data_out(encoder_output3),.random_positions(random_positions),.random_values13(random_values13));
  TBEC_RSC_encoder17 codificador1_7(.data_in(data_in_left),.data_out(encoder_output4),.random_positions(random_positions),.random_values17(random_values17));

  
  always_comb begin
    case (sel)
        2'b00 : begin //BYPASS memória 1
            data_out_right_up =  data_in_left;
            data_out_left = data_in_right_up; 	   
                end
        2'b01 : begin //BYPASS memória 2
            data_out_right_down =  data_in_left;
            data_out_left  = data_in_right_down; 
                end
        2'b10 : begin //ECC1 TBEC_RSC
          	
            data_out_right_up = encoder_output1[0:15];
            data_out_right_down = encoder_output1[16:31];
          
            data_out_left =  decoder_output1;
                end
        2'b11 : begin //ECC1 TBEC_RSC 0-3 erros
            data_out_right_up = encoder_output3[0:15];
            data_out_right_down = encoder_output3[16:31];
          
            data_out_left =  decoder_output1;	   
      
      end
      //  3'b100 : begin //ECC1 TBEC_RSC 1-7 erros
      //      data_out_right_up = encoder_output4[0:15];
       //     data_out_right_down = encoder_output4[16:31];
          
      //      data_out_left =  decoder_output1;
      //          end
       // 3'b101 : begin  //BYPASS memoria1 1-7 erros
          	
      //    data_out_right_up =  data_in_left^random_values17;
       //   data_out_left = data_in_right_up; 	   
       //         end
       // default : begin //ECC2 MRSC
        //    data_out_right_up = encoder_output2[0:15];
        //    data_out_right_down = encoder_output2[16:31];
          
       //     data_out_left =  decoder_output2;
        //        end
        
    endcase
    
   
  end
  
  
    
  
endmodule