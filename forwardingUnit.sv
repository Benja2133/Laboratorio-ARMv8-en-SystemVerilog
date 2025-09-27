module forwardingUnit(input logic [4:0] ID_EX_RegRn1, ID_EX_RegRm2,
														EX_MEM_Rd, MEM_WB_Rd,
							input logic EX_MEM_regWrite,MEM_WB_regWrite,
							output logic[1:0] FWD_A,FWD_B);

							
 always_comb begin
    FWD_A = 2'b00;
    FWD_B = 2'b00;

// Fwd A (directo a la alu)
	 //EX hazard
    if (EX_MEM_regWrite 
	 && (EX_MEM_Rd !== 31) 
	 && (EX_MEM_Rd === ID_EX_RegRn1)) FWD_A = 2'b10;
	 //MEM hazard
    else if (MEM_WB_regWrite
			&& (MEM_WB_Rd !== 31) 
			&& (MEM_WB_Rd === ID_EX_RegRn1)) FWD_A = 2'b01;

			
 // Fwd B (va al mux con signImm)
	//EX hazard
    if (EX_MEM_regWrite 
	 && (EX_MEM_Rd !== 31) 
	 && (EX_MEM_Rd === ID_EX_RegRm2)) FWD_B = 2'b10;
	 //MEM hazard
    else if (MEM_WB_regWrite 
			&& (MEM_WB_Rd !== 31) 
			&& (MEM_WB_Rd === ID_EX_RegRm2)) FWD_B = 2'b01;
			
//01->MEM_WB_aluRes
//10->EX_MEM_aluRes

  end

endmodule