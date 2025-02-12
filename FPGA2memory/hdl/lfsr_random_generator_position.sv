module lfsr_random_generator_position(
    input logic clk,
    input logic reset,
    input logic stop, // Sinal de controle para parar o LFSR
    output logic [4:0] random_position
);

    logic [4:0] lfsr;

    // Bloco sequencial para o LFSR
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            lfsr <= 5'b00001;  // Estado inicial do LFSR
        end 
        else if (!stop) begin // Atualiza apenas se stop estiver baixo
            lfsr <= {lfsr[3:0],lfsr[4] ^ lfsr[1]};  // Feedback do LFSR
        end
        // Se stop estiver alto, mantém o estado atual do LFSR e do random_value_reg
    end

    // Atribuição do valor registrado para a saída
    assign random_position = lfsr;

endmodule
