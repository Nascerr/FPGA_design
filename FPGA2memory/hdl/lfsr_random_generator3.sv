module lfsr_random_generator3(
    input logic clk,
    input logic reset,
    input logic stop, // Sinal de controle para parar o LFSR
    output logic [2:0] random_value
);

    logic [1:0] lfsr;
    logic [2:0] random_value_reg;

    // Bloco sequencial para o LFSR
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            lfsr <= 2'b01;  // Estado inicial do LFSR
            random_value_reg <= 3'b001; // Inicializa o random_value
        end 
        else if (!stop) begin // Atualiza apenas se stop estiver baixo
            lfsr <= {lfsr[0], lfsr[1] ^ lfsr[0]};  // Feedback do LFSR
            case (lfsr)
                2'b01: random_value_reg <= 3'b001;  // Saída 1
                2'b10: random_value_reg <= 3'b011;  // Saída 11
                2'b11: random_value_reg <= 3'b111;  // Saída 111
                default: random_value_reg <= 3'b000;  // Estado inválido
            endcase
        end
        // Se stop estiver alto, mantém o estado atual do LFSR e do random_value_reg
    end

    // Atribuição do valor registrado para a saída
    assign random_value = random_value_reg;

endmodule
