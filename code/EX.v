`include "define.v"
module EX(
    output reg  [31:0] regcData,
    output reg         regcWrite,
    output reg  [4:0]  regcAddr,
    output reg  [5:0]  op,
    output wire [31:0] memAddr,
    output wire [31:0] memData,
    output reg  [31:0] HI,
    output reg  [31:0] LO,

    input wire         rst,
    input wire  [5:0]  op_i,
    input wire  [31:0] regaData,
    input wire  [31:0] regbData,
    input wire         regcWrite_i,
    input wire  [4:0]  regcAddr_i,
    input wire  [31:0] HII,
    input wire  [31:0] LOI
);

//reg [31:0] HI;
//reg [31:0] LO;
reg [63:0] tempmul;
reg [30:0] temprega;
reg [30:0] tempregb;
reg [61:0] tempmul_61;
reg z63;

always@(op_i)

    op=op_i;


assign memAddr = regaData;
assign memData = regbData;

always@(*)
begin
    if(rst == `RstEnable)
        regcData = `Zero;
    else
      begin
          case(op)
          `add:
              regcData = regaData + regbData;
          `sub:
              regcData = regaData - regbData;
          `or:
              regcData = regaData | regbData;
          `and:
              regcData = regaData & regbData;
          `sll:
              regcData = regbData << regaData;
          `srl:
              regcData = regbData >> regaData;
          `sra:
              regcData = ($signed(regbData)) >>> regaData;
          `lui:
              regcData = regaData;
          `xor:
              regcData = regaData ^ regbData;
          `jal:
              regcData = regaData;
          `jalr:
              regcData = regaData;
          `slt:
              begin
                  if(regaData < regbData)
                      regcData = 1'b1;
                  else
                      regcData = 1'b0;
              end
          `multu:
              begin
                  tempmul= regaData*regbData;
                  HI  = tempmul[31:0];
                  LO  =tempmul[63:32];
              end
                /*`mult:
                  begin
                    z63=regaData[31] ^ regbData[31];
                    temprega =(regaData[31]==1'b1)? (~(regaData[30:0])+1'b1):regaData[30:0];
                    tempregb =(regbData[31]==1'b1)? (~regbData[30:0]+1'b1):regbData[30:0];
                    tempmul_61=temprega * tempregb;
                    begin
                    case(z63)
                      1'b0:
                        begin
                          tempmul={1'b0,tempmul_61};
                          HI  = tempmul[31:0];
                          LO  =tempmul[63:32];
                        end
                      1'b1:
                        begin
                         // tempmul_61 = ;
                          tempmul={1'b1,~tempmul_61+1};
                          HI  = tempmul[31:0];
                          LO  =tempmul[63:32];  
                        end
                    endcase
                  
  end
                  end
                */
          `mult:
              begin
                  tempmul = ($signed(regaData)) * ($signed(regbData));
                  HI      = tempmul[31:0];
                  LO      = tempmul[63:32];
              end
          `div:
              begin
                  HI = ($signed(regaData)) % ($signed(regbData));
                  LO = ($signed(regaData)) / ($signed(regbData));
              end

          `divu:
              begin
                  HI = regaData % regbData;
                  LO = regaData / regbData;
              end
          `mfhi:
              regcData = HI;
          `mflo:
              regcData = LO;
          `mthi:
              HI       = regaData;
          `mtlo:
              LO       = regaData;
          default:
              regcData = `Zero;
          endcase
      end
end

always@(*)
begin
    begin
        regcWrite = regcWrite_i;
        regcAddr  = regcAddr_i;
    end    
end
    
endmodule


