`include "define.v"
module HILO(
    output reg [31:0] HIO,
    output reg [31:0] LOO,

    input wire [31:0] HII,
    input wire [31:0] LOI,
    input wire        clk,
    input wire        rst
);
    always@(*)      
        if(rst ==`RstEnable)
          begin
            HIO = `Zero;
            LOO = `Zero;
          end
        else
          begin
            HIO = HII;
            LOO = LOI;
          end
        
endmodule
