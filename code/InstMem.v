`include "define.v"
module InstMem(
    output reg [31:0] data,

    input wire ce,
    input wire [31:0] addr
);

reg [31:0] instmem [1023 : 0];    

always@(*)
begin      
    if(ce == `RomDisable)
        data = `Zero;
    else
        data = instmem[addr[11 : 2]];   
end
    initial
      begin
        instmem [0]  = 32'b001101_00000_00001_0000000000000100;              //imm|0=1;4
        instmem [1]  = 32'b000000_00000_00001_00010_00000_100000;            //add 1+0=2;4
        //instmem [2]  = 32'b000100_00001_00010_00000_00000_000010;          //beq 5
        //instmem [3]  = 32'b000101_00001_00000_0000000000000010;            //bne 6
        instmem [2]  = 32'b000000_00010_00001_00011_00000_100010;            //sub 2-1=3;0
        instmem [3]  = 32'b000000_00010_00010_00100_00000_100100;            //and 2&2=4;4
        //instmem [4]  = 32'b000111_00001_00000_00000_00000_000010;          //bgtz 9
        instmem [4]  = 32'b000000_00000_00001_00101_00000_100101;            //or 0|1=5;4
        instmem [5]  = 32'b000000_00001_00010_00110_00000_100110;            //xor 1^2=6;0
        instmem [6]  = 32'b001111_00000_00111_1100_0000_0000_0010;           //lui 7H
        instmem [7]  = 32'b001101_00111_00111_1000000000001000;              //ori 7L
        
        //instmem [8]  = 32'b000000_00001_00000_11111_00000_001001;          //jalr 4
        
        instmem [8]  = 32'b000000_00000_00111_01000_00010_000000;            //sll 7<<2=8
        instmem [9]  = 32'b000000_00000_00111_01001_00010_000010;            //srl 7>>2=9
        instmem [10] = 32'b000000_00001_00000_00000_00000_010011;            //mtlo 1-> LO;4
        instmem [11] = 32'b000000_00001_00000_00000_00000_010001;            //mtlo 1-> HI;4
        instmem [12] = 32'b000000_00000_00111_01010_00011_000011;            //sra 7>>>3=10
        instmem [13] = 32'b001000_00001_01011_0000000000000010;              //addi imm+1=11;6
        instmem [14] = 32'b001100_00001_01100_0000000000000100;              //andi imm&1=12;4
        instmem [15] = 32'b001110_00001_01101_0000000000000010;              //xori imm^1=13;6
        instmem [16] = 32'b000000_00000_00000_01110_00000_010000;            //mtlo HI->14;4
        instmem [17] = 32'b000000_00000_00000_01111_00000_010010;            //mtlo LO->15;4
        instmem [18] = 32'b101011_00001_00001_0000_0000_0000_0100;           //sw
        instmem [19] = 32'b100011_00001_10000_0000_0000_0000_0100;           //lw 16
        instmem [20] = 32'b000000_00100_00001_10001_00000_101010;            //slt 4<1?1:0 17;1
        instmem [21] = 32'b000000_00001_01011_10010_00000_100000;            //add 1+11=18;5
        
        //instmem [18] = 32'h08000004;                                       //j 4
        //instmem [20] = 32'b000000_10000_00000_0000000000001000;            //jr 4
        //instmem [18] = 32'h0c000004;                                       //jal 4

        instmem [22] = 32'b000000_00001_00010_00000_00000_011001;            //1*2;16
        instmem [23] = 32'b000000_00001_00010_00000_00000_011010;            //1/2;1
        instmem [24] = 32'b000000_11111_11110_00000_00000_011000;            //30*31;-1
        instmem [25] = 32'b000000_11111_11110_00000_00000_011010;            //30/31;-1
      end

endmodule

