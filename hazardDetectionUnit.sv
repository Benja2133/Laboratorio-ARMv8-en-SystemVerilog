
module HDU  (
    input logic ID_EX_memRead,
    input logic [4:0] IF_ID_RegRn1,IF_ID_RegRm2,ID_EX_RegRd,
    output logic data_hazard
);

  always_comb begin
    if (ID_EX_memRead 
	 && (IF_ID_RegRn1 === ID_EX_RegRd || IF_ID_RegRm2 === ID_EX_RegRd)) data_hazard = 1'b1;
    else data_hazard = 1'b0;
  end

endmodule