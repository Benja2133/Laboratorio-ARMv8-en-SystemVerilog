module execute_tb();

	logic AluSrc;
	logic [3:0] AluControl;
	logic [63:0] PC_E, signImm_E, readData1_E, readData2_E;
	logic [63:0] PCBranch_E, aluResult_E, writeData_E;
	logic zero_E;
	
	execute dut(AluSrc, AluControl, PC_E, signImm_E, readData1_E, readData2_E,
					PCBranch_E, aluResult_E, writeData_E, zero_E);
	
	initial
		begin
			PC_E = 64'd8; signImm_E = 64'd2; readData1_E = 64'd3;
			readData2_E = 64'd5; AluSrc = 1'b0; AluControl = 4'b0010; #10;
			if(PCBranch_E !== 64'd16 || zero_E !== 1'b0 
				|| aluResult_E !== 64'd8 || writeData_E !== readData2_E) 
				$display("Test 1 failed");
			else $display("Test 1 passed");
			
			PC_E = 64'd8; signImm_E = 64'd2; readData1_E = 64'd3;
			readData2_E = 64'd5; AluSrc = 1'b1; AluControl = 4'b0010; #10;
			if(PCBranch_E !== 64'd16 || zero_E !== 1'b0 
				|| aluResult_E !== 64'd5 || writeData_E !== readData2_E) 
				$display("Test 2 failed");
			else $display("Test 2 passed");
			
			PC_E = 64'd8; signImm_E = 64'd2; readData1_E = 64'd3;
			readData2_E = -64'd3; AluSrc = 1'b0; AluControl = 4'b0010; #10;
			if(PCBranch_E !== 64'd16 || zero_E !== 1'b1 
				|| aluResult_E !== 64'd0 || writeData_E !== readData2_E) 
				$display("Test 3 failed");
			else $display("Test 3 passed");
			
		end

endmodule