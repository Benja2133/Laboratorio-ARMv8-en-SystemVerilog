
	.text//Bge
	.org 0x0000
    SUBS X1, X5, #1
    B.GE correcto
    ADD XZR,XZR,XZR //NOP
    ADD XZR,XZR,XZR //NOP
    ADD XZR,XZR,XZR //NOP
    STUR X2,[X0,#0]
    error: CBZ XZR , error
    ADD XZR,XZR,XZR //NOP
    ADD XZR,XZR,XZR //NOP
    ADD XZR,XZR,XZR //NOP

correcto: STUR X4,[X0,#0]
    finloop: CBZ XZR, finloop
    //si es correcto MEM[0] = 4 si no MEM[0] = 2

/*ROM [0:11] ='{32'hf10004a1,
32'h5400012a,
32'h8b1f03ff,
32'h8b1f03ff,
32'h8b1f03ff,
32'hf8000002,
32'hb400001f,
32'h8b1f03ff,
32'h8b1f03ff,
32'h8b1f03ff,
32'hf8000004,
32'hb400001f};*/