.text//Bhi
	.org 0x0000
    SUBS X1, X5, #4
    B.HI correcto
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




/*ROM [0:11] ='{32'hf10010a1,
32'h54000125,
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
