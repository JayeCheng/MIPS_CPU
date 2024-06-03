`include "define.v"
module MIPS(
    output wire [31:0] wtData,	
	  output wire [31:0] memAddr,
    output wire [31:0] instAddr,
	  output wire        memCe,
    output wire        memWr,
    output wire        romCe,

    input  wire        clk,
    input  wire        rst,
    input  wire [31:0] instruction,
    input  wire [31:0] rdData
);
    wire [31:0] regaData_regFile, regbData_regFile;
    wire [31:0] regaData_id, regbData_id; 
    wire [31:0] regcData_ex;
    wire [5:0]  op;    
    wire        regaRead, regbRead;
    wire [4:0]  regaAddr, regbAddr;
    wire        regcWrite_id, regcWrite_ex;
    wire [4:0]  regcAddr_id, regcAddr_ex;
    wire [31:0] jAddr;
    wire        jCe;
    wire [5:0]  op_2;
    wire [31:0] memData_i;
    wire [31:0] memAddr_i;
    wire [31:0] regdata_mem;
    wire        regcWrite_mem;
    wire [4:0]  regcAddr_mem;
    wire [31:0] hi;
    wire [31:0] lo;
    wire [31:0] hio;
    wire [31:0] loo;
    wire [31:0] hi_ex;
    wire [31:0] lo_ex;
    IF pc0(
        .clk  (clk),
        .rst  (rst),
        .ce   (romCe), 
        .pc   (instAddr),
        .jAddr(jAddr),
        .jCe  (jCe)
    );
    ID id0(
        .rst       (rst),        
        .inst      (instruction),
        .regaData_i(regaData_regFile),
        .regbData_i(regbData_regFile),
        .op(op),
        .regaData  (regaData_id),
        .regbData  (regbData_id),
        .regaRead  (regaRead),
        .regbRead  (regbRead),
        .regaAddr  (regaAddr),
        .regbAddr  (regbAddr),
        .regcWrite (regcWrite_id),
        .regcAddr  (regcAddr_id),
        .pc        (instAddr),
        .jAddr     (jAddr),
        .jCe       (jCe)
    );
    EX ex0(
        .rst        (rst),
        .op_i       (op),        
        .regaData   (regaData_id),
        .regbData   (regbData_id),
        .regcWrite_i(regcWrite_id),
        .regcAddr_i (regcAddr_id),
        .regcData   (regcData_ex),
        .regcWrite  (regcWrite_ex),
        .regcAddr   (regcAddr_ex),
        .op         (op_2),
        .memAddr    (memAddr_i),
        .memData    (memData_i),
        .HI         (hi),
        .LO         (lo),
        .HII        (hi_ex),
        .LOI        (lo_ex)
    );    
    RegFile regfile0(
        .clk     (clk),
        .rst     (rst),
        .we      (regcWrite_mem),
        .waddr   (regcAddr_mem),
        .wdata   (regdata_mem),
        .regaRead(regaRead),
        .regbRead(regbRead),
        .regaAddr(regaAddr),
        .regbAddr(regbAddr),
        .regaData(regaData_regFile),
        .regbData(regbData_regFile)
    );
    MEM mem0(
      .rst(rst),	
	    .op(op_2),
	    .regcData (regcData_ex),
	    .regcAddr (regcAddr_ex),
	    .regcWr   (regcWrite_ex),
	    .memAddr_i(memAddr_i),
	    .memData  (memData_i),
      .rdData   (rdData),
	    .regAddr  (regcAddr_mem),
	    .regWr    (regcWrite_mem),
	    .regData  (regdata_mem),
	    .memAddr  (memAddr),
	    .wtData   (wtData),
	    .memWr    (memWr),	
	    .memCe    (memCe),
	    .HII      (hi),
	    .LOI      (lo),
	    .HIO      (hio),
	    .LOO      (loo)
    );
    HILO hilo0(
      .HII      (hio),
      .LOI      (loo),
      .HIO      (hi_ex),
      .LOO      (lo_ex),
      .clk      (clk),
      .rst      (rst)
    );
endmodule

