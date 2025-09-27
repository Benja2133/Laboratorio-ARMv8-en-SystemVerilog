// Etapa: MEMORY

module memory (
    input logic Branch_M, zero_M,               
    input logic CondBr,                    
    input logic [3:0] CPSR_flags,               
    input logic [4:0] CB_instruction,          
    output logic PCSrc_M                        
);

	logic branch_taken;                             // Señal que indica si la condición se cumple

    bCondCheck bCondCheck_inst (
        .CondBr(CondBr),
        .CPSR_flags(CPSR_flags),
        .CB_instr(CB_instruction),
        .branch_taken(branch_taken)
    );

    assign PCSrc_M = (branch_taken) || (Branch_M & zero_M);


endmodule