	.text //Blt
	.org 0x0000
    ADDS X9,X9,X10  //no hace nada pero setea flags
    SUBS X1, X1, #5
    B.LT correcto
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

/*ROM [0:12] ='{32'hab0a0129,
32'hf1001421,
32'h5400012b,
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