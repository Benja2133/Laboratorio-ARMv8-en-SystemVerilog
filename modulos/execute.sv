module execute #(parameter N = 64)(
		input logic AluSrc,
		input logic [3:0] AluControl,
		input logic [N-1:0] PC_E, signImm_E, readData1_E, readData2_E,
		output logic [N-1:0] PCBranch_E, aluResult_E, writeData_E,
		output logic zero_E,
		output logic negative_E,
		output logic carry_E,
		output logic oVerflow_E,
		output logic write_flag_E,
		//---
		input logic[4:0] EX_MEM_Rd, MEM_WB_Rd,
								ID_EX_RegRn, ID_EX_RegRm,
		input logic EX_MEM_regWrite,MEM_WB_regWrite,
		input logic [N-1:0] EX_MEM_aluRes, MEM_WB_aluRes					
	);

	logic [N-1:0] MUX_out;
	logic [N-1:0] sl2_out;
	logic [N-1:0] MuxFwdA_out, MuxFwdB_out;
	logic [1:0] forwardA,forwardB;
	
	sl2 sl2(signImm_E, sl2_out);
	adder adder(PC_E, sl2_out, PCBranch_E);
	
	forwardingUnit forwardingUnit (
      .ID_EX_RegRn1(ID_EX_RegRn),
      .ID_EX_RegRm2(ID_EX_RegRm),
      .EX_MEM_Rd(EX_MEM_Rd),
      .MEM_WB_Rd(MEM_WB_Rd),
		.EX_MEM_regWrite(EX_MEM_regWrite),
      .MEM_WB_regWrite(MEM_WB_regWrite),
      .FWD_A(forwardA),
      .FWD_B(forwardB)
  );
	
	mux4 MUXfwdA (
      .d0(readData1_E),
      .d1(MEM_WB_aluRes),
      .d2(EX_MEM_aluRes),
      .d3({32'b0, 32'b0}),
      .s (forwardA),
      .y (MuxFwdA_out)
  );

  mux4 MUXfwdB (
      .d0(readData2_E),
      .d1(MEM_WB_aluRes),
      .d2(EX_MEM_aluRes),
      .d3({32'b0, 32'b0}),
      .s (forwardB),
      .y (MuxFwdB_out)
  );
	
	mux2 MUX(MuxFwdB_out, signImm_E, AluSrc, MUX_out);

	alu alu(MuxFwdA_out, MUX_out, AluControl, aluResult_E, zero_E, negative_E, carry_E, oVerflow_E,write_flag_E);

	assign writeData_E = MuxFwdB_out;

endmodule