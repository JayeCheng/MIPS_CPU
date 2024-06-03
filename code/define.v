`define RamDisable   1'b0
`define RamEnable    1'b1
`define RamWrite     1'b1
`define RamUnWrite   1'b1
`define RstEnable    1'b1               
`define RstDisable   1'b0             
`define RomEnable    1'b1 
`define RomDisable   1'b0
`define Zero         32'h00000000       
`define WriteEnable  1'b1               
`define WriteDisable 1'b0              
`define ReadEnable   1'b1               
`define ReadDisable  1'b0              
`define AluOpBus     7:0               
`define AluSelBus    2:0                
`define Valid        1'b0              
`define Invalid      1'b1               
`define True_v       1'b1             
`define False_v      1'b0               
`define ChipEnable   1'b1              
`define ChipDisable  1'b0     
`define Branch       1'b1
`define NotBranch    1'b0          
`define nop          6'b001101
`define Inst_or      6'b100101
`define Inst_and     6'b100100
`define Inst_sll     6'b000000
`define Inst_srl     6'b000010
`define Inst_sra     6'b000011
`define Inst_andi    6'b001100
`define Inst_ori     6'b001101
`define Inst_lui     6'b001111
`define Inst_xori    6'b001110
`define Inst_xor     6'b100110
`define Inst_jal     6'b000011
`define Inst_j       6'b000010
`define Inst_lw      6'b100011
`define Inst_sw      6'b101011
`define Inst_add     6'b100000
`define Inst_sub     6'b100010
`define Inst_jr      6'b001000
`define Inst_addi    6'b001000
`define Inst_beq     6'b000100
`define Inst_bne     6'b000101
`define Inst_multu   6'b011001
`define Inst_div     6'b011010
`define Inst_mult    6'b011000
`define Inst_slt     6'b101010
`define Inst_bgtz    6'b000111
`define Inst_bltz    6'b000001
`define Inst_jalr    6'b001001
`define Inst_mtlo    6'b010011
`define Inst_divu    6'b011011
`define Inst_mthi    6'b010001
`define Inst_mflo    6'b010010
`define Inst_mfhi    6'b010000


`define or           6'b000001
`define and          6'b000010
`define sll          6'b000011
`define srl          6'b000100
`define sra          6'b000101
`define lui          6'b000110
`define xor          6'b000111
`define jal          6'b111000
`define j            6'b001001
`define Lw           6'b001010
`define Sw           6'b001011
`define flag         6'b00000
`define add          6'b001100
`define sub          6'b001101
`define jr           6'b001110
`define beq          6'b001111
`define bne          6'b010000
`define slt          6'b010001
`define bgtz         6'b010010
`define bltz         6'b010011
`define jalr         6'b010100
`define mtlo         6'b011000
`define mthi         6'b011001
`define mflo         6'b011010
`define mfhi         6'b011011
`define divu         6'b011100
`define mult         6'b011101
`define div          6'b011110
`define multu        6'b011111

