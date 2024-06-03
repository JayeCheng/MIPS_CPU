`include "define.v"
module RegFile(
    output reg [31:0] regaData,
    output reg [31:0] regbData,

    input wire        clk,
    input wire        rst,
    input wire        we,
    input wire [4:0]  waddr,
    input wire [31:0] wdata,
    input wire        regaRead,
    input wire        regbRead,
    input wire [4:0]  regaAddr,
    input wire [4:0]  regbAddr
);

reg [31:0] reg32 [31 : 0];

initial
begin
    reg32[30]=32'hffffffff;
    reg32[31]=32'b00000000_00000000_00000000_00000001;
end

always@(*)
begin
    if(rst == `RstEnable)
        regaData = `Zero;
    else if(regaAddr == `Zero)
        regaData = `Zero;
    else
        regaData = reg32[regaAddr];
end            

always@(*)
begin
    if(rst == `RstEnable)
        regbData = `Zero;
    else if(regbAddr == `Zero)
        regbData = `Zero;
    else
        regbData = reg32[regbAddr];
end

always@(posedge clk)
begin
    if(rst == `RstDisable)
        if((we == `WriteEnable) && (waddr != `Zero))
            reg32[waddr] = wdata;
end
          
endmodule

