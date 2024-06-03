`include "define.v"
module IF(
    output reg        ce,
    output reg [31:0] pc,

    input wire        clk,
    input wire        rst,
    input wire [31:0] jAddr,
    input wire        jCe
);

always@(*)
begin
    if(rst == `RstEnable)
        ce = `RomDisable;
    else
        ce = `RomEnable;
end    
    
always@(posedge clk)
begin
    if(ce == `RomDisable)
        pc = `Zero;
    else if(jCe == `Branch)
        pc = jAddr;
    else
        pc = pc + 4;
end

endmodule


