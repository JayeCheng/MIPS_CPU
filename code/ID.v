`include "define.v"
module  ID (
    output reg [5:0]  op,
    output reg [31:0] regaData,
    output reg [31:0] regbData,
    output reg        regaRead,
    output reg        regbRead,
    output reg        regcWrite,
    output reg [4:0]  regaAddr,
    output reg [4:0]  regbAddr,    
    output reg [4:0]  regcAddr,
    output reg [31:0] jAddr,	
    output reg        jCe,

    input wire        rst,    
    input wire [31:0] inst,
    input wire [31:0] regaData_i,
    input wire [31:0] regbData_i,
    input wire [31:0] pc
);

wire [5:0]  inst_op  = inst[31:26];
wire [5:0]  inst_opl = inst[5:0];
wire [31:0] npc      = pc+4;
reg  [31:0] imm;

always@(*)
begin
    if(rst == `RstEnable)
        begin
            op        = `nop;
            regaRead  = `ReadDisable;
            regbRead  = `ReadDisable;
            regcWrite = `WriteDisable;
            regaAddr  = `Zero;
            regbAddr  = `Zero;
            regcAddr  = `Zero;
            imm       = `Zero;
            jCe       = `NotBranch;
            jAddr     = `Zero;

        end
    else
        begin
            jCe   = `NotBranch;
            jAddr = `Zero;
            case(inst_op)
            `flag:
             begin
               case(inst_opl)
                  `Inst_multu:                   
                    begin
                     op        = `multu;
                     regaRead  = `ReadEnable ;
                     regbRead  = `ReadEnable;
                     regcWrite = `WriteDisable;
                     regaAddr  = inst[25:21];
                     regbAddr  = inst[20:16];
                     regcAddr  = `Zero;
                    end
                  `Inst_mult:
                    begin
                     op        = `mult;
                     regaRead  = `ReadEnable;
                     regbRead  = `ReadEnable;
                     regcWrite = `WriteDisable;
                     regaAddr  = inst[25:21];
                     regbAddr  = inst[20:16];
                     regcAddr  = `Zero;
                    end
                  `Inst_div:
                    begin
                     op        = `div;
                     regaRead  = `ReadEnable;
                     regbRead  = `ReadEnable;
                     regcWrite = `WriteDisable;
                     regaAddr  = inst[25:21];
                     regbAddr  = inst[20:16];
                     regcAddr  = `Zero;
                    end
                  `Inst_divu:
                    begin
                     op        = `divu;
                     regaRead  = `ReadEnable;
                     regbRead  = `ReadEnable;
                     regcWrite = `WriteDisable;
                     regaAddr  = inst[25:21];
                     regbAddr  = inst[20:16];
                     regcAddr  = `Zero;
                    end
                  `Inst_add:
                    begin
                     op        = `add;
                     regaRead  = `ReadEnable;
                     regbRead  = `ReadEnable;
                     regcWrite = `WriteEnable;
                     regaAddr  = inst[25:21];
                     regbAddr  = inst[20:16];
                     regcAddr  = inst[15:11];
                    end
                  `Inst_sub:
                    begin
                     op        = `sub;
                     regaRead  = `ReadEnable;
                     regbRead  = `ReadEnable;
                     regcWrite = `WriteEnable;
                     regaAddr  = inst[25:21];
                     regbAddr  = inst[20:16];
                     regcAddr  = inst[15:11];
                    end
                  `Inst_or:
                    begin
                     op        = `or;
                     regaRead  = `ReadEnable;
                     regbRead  = `ReadEnable;
                     regcWrite = `WriteEnable;
                     regaAddr  = inst[25:21];
                     regbAddr  = inst[20:16];
                     regcAddr  = inst[15:11];
                    end
                  `Inst_xor:
                    begin
                     op        = `xor;
                     regaRead  = `ReadEnable;
                     regbRead  = `ReadEnable;
                     regcWrite = `WriteEnable;
                     regaAddr  = inst[25:21];
                     regbAddr  = inst[20:16];
                     regcAddr  = inst[15:11];
                    end
                  `Inst_sll:
                    begin
                     op        = `sll;
                     regaRead  = `ReadDisable;
                     regbRead  = `ReadEnable;
                     regcWrite = `WriteEnable;
                     regaAddr  =`Zero ;
                     regbAddr  = inst[20:16];
                     regcAddr  = inst[15:11];
                     imm       = {27'h0, inst[10:6]};
                    end
                  `Inst_srl:
                    begin
                     op        = `srl;
                     regaRead  = `ReadDisable;
                     regbRead  = `ReadEnable;
                     regcWrite = `WriteEnable;
                     regaAddr  = `Zero;
                     regbAddr  = inst[20:16];
                     regcAddr  = inst[15:11];
                     imm       = {27'h0, inst[10:6]};
                    end
                  `Inst_sra:
                    begin
                     op        = `sra;
                     regaRead  = `ReadDisable;
                     regbRead  = `ReadEnable;
                     regcWrite = `WriteEnable;
                     regaAddr  = `Zero ;
                     regbAddr  = inst[20:16];
                     regcAddr  = inst[15:11];
                     imm       = {27'h0, inst[10:6]};
                    end
                  `Inst_and:
                     begin
                     op        = `and;
                     regaRead  = `ReadEnable;
                     regbRead  = `ReadEnable;
                     regcWrite = `WriteEnable;
                     regaAddr  = inst[25:21];
                     regbAddr  = inst[20:16];
                     regcAddr  = inst[15:11];
                     end
                   `Inst_slt:
                     begin
                     op        = `slt;
                     regaRead  = `ReadEnable;
                     regbRead  = `ReadEnable;
                     regcWrite = `WriteEnable;
                     regaAddr  = inst[25:21];
                     regbAddr  = inst[20:16];
                     regcAddr  = inst[15:11];
                     end
                  `Inst_jalr:
				            begin
				             op        = `jalr;
				             regaRead  = `ReadEnable;
				             regbRead  = `ReadDisable;
				             regcWrite = `WriteEnable;
				             regaAddr  = inst[25:21];
				             regbAddr  = `Zero;
				             regcAddr  = inst[15:11];
				             jAddr     = regaData;
			               jCe       = `Branch;
				             imm       = npc;
				            end
                  `Inst_jr:
                     begin
                     op        = `jr;
                     regaRead  = `ReadEnable;
                     regbRead  = `ReadDisable;
                     regcWrite = `WriteDisable;
                     regaAddr  = inst[25:21];
                     regbAddr  = `Zero;
                     regcAddr  = `Zero;
                     jCe       = `Branch;
                     jAddr     = regaData;
                     end
                   `Inst_mfhi:
                     begin
                     op        = `mfhi;
                     regaRead  = `ReadDisable;
                     regbRead  = `ReadDisable;
                     regcWrite = `WriteEnable;
                     regaAddr  = `Zero;
                     regbAddr  = `Zero;
                     regcAddr  = inst[15:11];
                     end
                   `Inst_mflo: 
                     begin
                     op        = `mflo;
                     regaRead  = `ReadDisable;
                     regbRead  = `ReadDisable;
                     regcWrite = `WriteEnable;
                     regaAddr  = `Zero;
                     regbAddr  = `Zero;
                     regcAddr  = inst[15:11];
                     end
                   `Inst_mthi:
                     begin
                     op        = `mthi;
                     regaRead  = `ReadEnable;
                     regbRead  = `ReadDisable;
                     regcWrite = `WriteDisable;
                     regaAddr  = inst[25:21];
                     regbAddr  = `Zero;
                     regcAddr  = `Zero;
                     end
                  `Inst_mtlo:
                     begin
                     op        = `mtlo;
                     regaRead  = `ReadEnable;
                     regbRead  = `ReadDisable;
                     regcWrite = `WriteDisable;
                     regaAddr  = inst[25:21];
                     regbAddr  = `Zero;
                     regcAddr  = `Zero;
                     end
                  default:
                     begin
                     op        = `nop;
                     regaRead  = `ReadDisable;
                     regbRead  = `ReadDisable;
                     regcWrite = `WriteDisable;
                     regaAddr  = `Zero;
                     regbAddr  = `Zero;
                     regcAddr  = `Zero;
                     end
               endcase
             end
            `Inst_ori:
              begin
                op        = `or;
                regaRead  = `ReadEnable;
                regbRead  = `ReadDisable;
                regcWrite = `WriteEnable;
                regaAddr  = inst[25:21];
                regbAddr  = `Zero;
                regcAddr  = inst[20:16];
                imm       = {16'h0, inst[15:0]};
              end
           ` Inst_lui:
              begin
                op        = `lui;
                regaRead  = `ReadDisable;
                regbRead  = `ReadDisable;
                regcWrite = `WriteEnable;
                regaAddr  = `Zero ;
                regbAddr  = `Zero;
                regcAddr  = inst[20:16];
                imm       = {inst[15:0],16'h0};
              end
           ` Inst_andi:
              begin
                op        = `and;
                regaRead  = `ReadEnable;
                regbRead  = `ReadDisable;
                regcWrite = `WriteEnable;
                regaAddr  = inst[25:21];
                regbAddr  = `Zero;
                regcAddr  = inst[20:16];
                imm       = {16'h0, inst[15:0]};
              end
           ` Inst_xori:
              begin
                op        = `xor;
                regaRead  = `ReadEnable;
                regbRead  = `ReadDisable;
                regcWrite = `WriteEnable;
                regaAddr  = inst[25:21];
                regbAddr  = `Zero;
                regcAddr  = inst[20:16];
                imm       = {16'h0, inst[15:0]};
              end
           ` Inst_addi:
              begin
                op        = `add;
                regaRead  = `ReadEnable;
                regbRead  = `ReadDisable;
                regcWrite = `WriteEnable;
                regaAddr  = inst[25:21];
                regbAddr  = `Zero;
                regcAddr  = inst[20:16];
                imm       = {16'h0, inst[15:0]};
              end
            `Inst_jal:
				      begin
				        op        = `jal;
				        regaRead  = `ReadDisable;
				        regbRead  = `ReadDisable;
				        regcWrite =  `WriteEnable;
				        regaAddr  = `Zero;
				        regbAddr  = `Zero;
				        regcAddr  = 5'b11111;
				        jAddr     = {npc[31:28], inst[25:0], 2'b00};
			          jCe       = `Branch;
				        imm       = npc;
				      end
				    `Inst_j:
				      begin
				        op        = `j;
				        regaRead  = `ReadDisable;
				        regbRead  = `ReadDisable;
				        regcWrite = `WriteDisable;
				        regaAddr  = `Zero;
				        regbAddr  = `Zero;
				        regcAddr  = `Zero;
				        jAddr     = {npc[31:28], inst[25:0], 2'b00};
			          jCe       = `Branch;
				      end
				    `Inst_lw:
              begin
		            op        = `Lw;
		            regaRead  = `ReadEnable;
		            regbRead  = `ReadDisable;
		            regcWrite = `WriteEnable;
		            regaAddr  = inst[25:21];
		            regbAddr  = `Zero;
		            regcAddr  = inst[20:16];
		            imm       = {{16{inst[15]}},inst[15:0]};
		          end
		        `Inst_sw:
		          begin
		            op        = `Sw;
	              regaRead  = `ReadEnable;
		            regbRead  = `ReadEnable;
		            regcWrite = `WriteDisable;
		            regaAddr  = inst[25:21];
		            regbAddr  = inst[20:16];
		            regcAddr  = `Zero;
		            imm       = {{16{inst[15]}},inst[15:0]};
		          end
		        `Inst_beq:
		          begin
		            op        = `beq;
	              regaRead  = `ReadEnable;
		            regbRead  = `ReadEnable;
		            regcWrite = `WriteDisable;
		            regaAddr  = inst[25:21];
		            regbAddr  = inst[20:16];
		            regcAddr  = `Zero;
		            jAddr     = npc + {{14{inst[16]}}, inst[15:0], 2'b00};
		            jCe       = (regaData == regbData) ? `Branch :`NotBranch;
		          end
		        `Inst_bne:
		          begin
		            op        = `bne;
	              regaRead  = `ReadEnable;
		            regbRead  = `ReadEnable;
		            regcWrite = `WriteDisable;
		            regaAddr  = inst[25:21];
		            regbAddr  = inst[20:16];
		            regcAddr  = `Zero;
		            jAddr     = npc + {{14{inst[16]}}, inst[15:0], 2'b00};
		            jCe       = (regaData != regbData) ? `Branch :`NotBranch;
		          end
		        `Inst_bgtz:
		          begin
		            op        = `bgtz;
	              regaRead  = `ReadEnable;
		            regbRead  = `ReadDisable;
		            regcWrite = `WriteDisable;
		            regaAddr  = inst[25:21];
		            regbAddr  = `Zero;
		            regcAddr  = `Zero;
		            jCe       = (regaData > 0) ? `Branch :`NotBranch;
		            jAddr     = npc + {{14{inst[16]}}, inst[15:0], 2'b00};
		          end
		        `Inst_bltz:
		          begin
		            op        = `bltz;
	              regaRead  = `ReadEnable;
		            regbRead  = `ReadDisable;
		            regcWrite = `WriteDisable;
		            regaAddr  = inst[25:21];
		            regbAddr  = `Zero;
		            regcAddr  = `Zero;
		            jCe       =  (regaData < 0) ? `Branch :`NotBranch;
		            jAddr     = npc + {{14{inst[16]}}, inst[15:0], 2'b00};
		          end
            default:
              begin
                op        = `nop;
                regaRead  = `ReadDisable;
                regbRead  = `ReadDisable;
                regcWrite = `WriteDisable;
                regaAddr  = `Zero;
                regbAddr  = `Zero;
                regcAddr  = `Zero;
                imm       = `Zero;
              end
            endcase 
        end
end
      
always@(*)
begin
    if(rst == `RstEnable)
        regaData = `Zero;
    else if(op == `Lw || op == `Sw)
        regaData = regaData_i + imm;
    else if(regaRead == `ReadEnable)
        regaData = regaData_i;
    else
        regaData = imm;
end

always@(*)
begin
    if(rst == `RstEnable)
        regbData = `Zero;
    else if(regbRead == `ReadEnable)
        regbData = regbData_i;
    else
        regbData = imm;
end

endmodule


