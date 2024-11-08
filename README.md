# FPGA_design
Este diretório contém o arquivo do LiberoSoC que configura a FPGA SmartFusion M2S025-VFG256 para comunicação de um processador STM32 com 2 memórias externas.
No circuito combinacional utilizado, temos 4 opções de escrita a serem escolhidas pelo seletor na respectiva ordem:: 

1) direto na memória 1; 
2) direto na memória 2;
3) utilizando o ECC TBEC_RSC simultaneamente nas 2 memórias;
4)  utilizando o ECC MRSC simultaneamente nas 2 memórias;


# 1) a numeração dos pinos tanto da FPGA quanto do STM32 são encontrados nessa planilha: 
https://docs.google.com/spreadsheets/d/1cdMez78ylQfuv5xlLMwsjoWFlxy-AshtDHLN853JNF0/edit?usp=sharing

# Funcionamento

Ao gravar na FPGA o projeto, algumas coisas devem ser feitas no STM32 para o adequado funcionamento:

1) Todos os GPIO's estão no modo OUTPUT com Pull Down.
2) De acordo com a planilha, existem 2 GPIO's que devem ser alterados os seus valores para utilizar o seletor.
3) O barrameto utilizado para a memória é o FMC. 

# Arquiteruta utilizada no circuito combinacional

O sistema constitui de uma FPGA entre 2 memórias e um processador. A utilização de 2 memórias serve para aplicar redundância nos dados que o processador escreve na forma de bits de paridade gerados pelo código corretor de erro. Ou seja quando o processador escreve com o ECC é como se estivesse escrevendo em apenas uma memória, mas de fato está escrevendo nas 2, o que demonstra a transparência da redundância.

![esquemático lógico](https://github.com/Nascerr/FPGA_design/blob/main/Diagrama%201%20mem%C3%B3ria.drawio%20(1).png)

# Fluxo

Dado de escrita no processador dever ser 16 bits.Caso o ECC esteja habilitado, esse dado passa pelo codificador do ECC e é gerada uma palavra de 32 bits na qual cada metade vai para uma das 2 memórias.
Na operação de leitura, o dados de 16 bits de cada memória são unidos novamente e passam pelo decodificador, que por sua vez pode corrigir ou não eventuais erros, gerando uma palavra de 16 bits a ser recebida pelo processador.




