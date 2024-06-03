`include "define.v"
module MEM(
	  output wire [31:0] HIO,
	  output wire [31:0] LOO,
	  output wire [4:0]  regAddr,
	  output wire        regWr,
	  output wire [31:0] regData,	
  	output wire [31:0] memAddr,
  	output reg  [31:0] wtData,
  	output reg         memWr,	
	  output reg         memCe,
	
	  input wire         rst,		
  	input wire  [5:0]  op,
	  input wire  [31:0] regcData,
	  input wire  [4:0]  regcAddr,
	  input wire         regcWr,
  	input wire  [31:0] memAddr_i,
  	input wire  [31:0] memData,	
	  input  wire [31:0] rdData,
	  input wire  [31:0] HII,
    input wire  [31:0] LOI
);

assign regAddr = regcAddr;    
assign regWr   = regcWr;    
assign regData = (op == `Lw) ? rdData : regcData;    
assign memAddr = memAddr_i;
assign HIO     = HII;
assign LOO     = LOI;

always @ (*)   
begin     
    if(rst == `RstEnable)          
      begin            
          wtData = `Zero;            
          memWr  = `RamUnWrite;            
          memCe  = `RamDisable;          
      end        
    else
      begin
           case(op)                
           `Lw:                  
             begin                    
                 wtData = `Zero;                        
                 memWr  = `RamUnWrite;                     
                 memCe  = `RamEnable;                    
             end                
           `Sw:                  
             begin                    
                 wtData = memData;                    
                 memWr  = `RamWrite;                      
                 memCe  = `RamEnable;                   
             end
           default:                  
             begin                    
                 wtData = `Zero;                    
                 memWr  = `RamUnWrite;
                 memCe  = `RamDisable;
             end            
           endcase
      end
end

endmodule
