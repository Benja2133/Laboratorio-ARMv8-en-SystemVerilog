	.text //Bne
	.org 0x0000
    ADDS X1, X1, #5
    B.NE correcto
    ADD XZR,XZR,XZR //NOP
    ADD XZR,XZR,XZR //NOP
    ADD XZR,XZR,XZR //NOP
    STUR X2,[X0,#0]
    error: CBZ XZR , error
    ADD XZR,XZR,XZR //NOP
    ADD XZR,XZR,XZR //NOP
    ADD XZR,XZR,XZR //NOP

correcto: STUR X3,[X0,#0]
    finloop: CBZ XZR, finloop
//si es correcto MEM[0] = 3 si no MEM[0] = 2

/*
ROM [0:11] ='{32'hb1001421,
32'h54000121,
32'h8b1f03ff,
32'h8b1f03ff,
32'h8b1f03ff,
32'hf8000002,
32'hb400001f,
32'h8b1f03ff,
32'h8b1f03ff,
32'h8b1f03ff,
32'hf8000003,
32'hb400001f};
*/