module bCondCheck (
    input logic CondBr,                  
    input logic [3:0] CPSR_flags,             
    input logic [4:0] CB_instr,               
    output logic branch_taken                 // Señal de salida: 1 si la condición de salto se cumple
);

    logic Z, C,N, V;
    assign {Z, C, N, V} = CPSR_flags; // Asignamos cada bit del registro CPSR_flags

    always_comb begin
        // Por defecto, asumimos que no se toma el salto
        branch_taken = 0;

        if (CondBr) begin
            case (CB_instr)
                5'b00000: branch_taken = (Z == 1);                     // B.EQ 
                5'b00001: branch_taken = (Z == 0);                     // B.NE
                5'b00010: branch_taken = (C == 1);                     // B.HS
                5'b00011: branch_taken = (C == 0);                     // B.LO
                5'b00100: branch_taken = (N == 1);                     // B.MI
                5'b00101: branch_taken = (N == 0);                     // B.PL
                5'b00110: branch_taken = (V == 1);                     // B.VS
                5'b00111: branch_taken = (V == 0);                     // B.VC
                5'b01000: branch_taken = (Z == 0) && (C == 1);         // B.HI
                5'b01001: branch_taken = ~((Z == 0) && (C == 1));      // B.LS
                5'b01010: branch_taken = (N == V);                     // B.GE
                5'b01011: branch_taken = (N != V);                     // B.LT
                5'b01100: branch_taken = (Z == 0) && (N == V);         // B.GT
                5'b01101: branch_taken = ~((Z == 0) && (N == V));      // B.LE
                default: branch_taken = 0;                             // Condición desconocida, no salta
            endcase
        end
    end
endmodule
