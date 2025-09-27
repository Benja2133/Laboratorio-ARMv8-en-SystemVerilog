module flopr_tb();
	logic clk,reset;
	logic [63:0]d, qexpected;
	logic [63:0]q;
	logic [31:0] vectornum, errors; // bookkeeping variables
	logic [127:0] testvectors [0:9] = { // arrray: 10 nums p. prueba con sus corresp. qexpected
	// son 128 bits, 64 de d y 64 de q_expected 128/4 = 32 digitos en hexa
		128'h8b0200218b020021_0000000000000000,
		128'h8b0000008b000000_0000000000000000,
		128'h8b0a00008b0a0000_0000000000000000,
		128'hf8008001f8008001_0000000000000000,
		128'h9100046191000461_0000000000000000,
		128'hffffffffffffffff_9100046191000461, // aca el reset se pone en 0
		128'h0000000000000001_ffffffffffffffff,
		128'h0000000000000002_0000000000000001,
		128'h0000000000000003_0000000000000002,
		128'h0000000000000004_0000000000000003
	// (16 digitos hex de d)_(16 digitos hex de qexpected) 
	};
flopr dut(clk,reset,d,q);
always // no sensitivity list, so it always executes
	begin
		clk = 1; #5ns; clk = 0; #5ns;
	end

initial //start of test pulse
	begin
		vectornum = 0; errors = 0; reset = 1; #47ns;
		reset = 0;
	end
	
always @(posedge clk)
	begin
		#1; {d, qexpected} = testvectors[vectornum];
	end

always @(negedge clk)
	begin
		if(q!==qexpected)
			begin
			$display("Error: inputs = %h", {d});
			$display("outputs = %h (%h expected)",q,qexpected);
			errors = errors + 1;
		end
					
			//increment arrayindex and read next testvector
			vectornum = vectornum + 1;
		if(testvectors[vectornum] === 128'bx)
			begin
				$display("%d tests completed with %d errors",vectornum,errors);
				$stop;
		end
		
end	
endmodule