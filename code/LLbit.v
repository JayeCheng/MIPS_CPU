`include "define.v"
module LLbit(
    output reg rLLbit,
    output reg excpt,

    input wire clk,
    input wire rst,
    input wire wLLbit,
    input wire wbit
);

always @ (posedge clk) 
begin
    if (rst ==`RstEnable) 
      begin
          rLLbit <= 1'b0;
      end 
    else if(excpt == 1'b1) 
      begin 
          rLLbit <= 1'b0;
      end  
    else if(wbit == `WriteEnable)
      begin
          rLLbit <= wLLbit;
      end
end

endmodule
