`include "define.v"
module DataMem(
    output reg [31:0] dataOut,

    input wire clk,
    input wire ce,
    input wire we,
    input wire [31:0] addr,
    input wire [31:0] dataIn
);
 
reg [31:0] datamem [1023 : 0];

always@(*)   
begin
    if(ce == `RamDisable)
        dataOut = `Zero;
    else
        dataOut = datamem[addr[11 : 2]]; 
end

always@(posedge clk)
begin
    if(ce == `RamEnable && we == `RamWrite)
        datamem[addr[11 : 2]] = dataIn;
end

endmodule
