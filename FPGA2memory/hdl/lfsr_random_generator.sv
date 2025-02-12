module lfsr_random_generator(
    input logic clk,
    input logic reset,
    input logic stop, // Sinal de controle para parar o LFSR
    output logic [6:0] random_value
);

    logic [2:0] lfsr;
    logic [6:0] random_value_reg;

    // Bloco sequencial para o LFSR
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            lfsr <= 3'b001;  // Estado inicial do LFSR
            random_value_reg <= 7'b0000001; // Inicializa o random_value
        end 
        else if (!stop) begin // Atualiza apenas se stop estiver baixo
            lfsr <= {lfsr[2]^lfsr[0], lfsr[2:1]};  // Feedback do LFSR
            case (lfsr)
                3'b001: random_value_reg <= 7'b0000001;  // Saída 1
                3'b010: random_value_reg <= 7'b0000011;  // Saída 11
                3'b011: random_value_reg <= 7'b0000111;  // Saída 111
                3'b100: random_value_reg <= 7'b0001111;  // Saída 1111
                3'b101: random_value_reg <= 7'b0011111;  // Saída 11111
                3'b110: random_value_reg <= 7'b0111111;  // Saída 111111
                3'b111: random_value_reg <= 7'b1111111;  // Saída 1111111
                
                default: random_value_reg <= 7'b0000000;  // Estado inválido
            endcase
        end
        // Se stop estiver alto, mantém o estado atual do LFSR e do random_value_reg
    end

    // Atribuição do valor registrado para a saída
    assign random_value = random_value_reg;

endmodule
