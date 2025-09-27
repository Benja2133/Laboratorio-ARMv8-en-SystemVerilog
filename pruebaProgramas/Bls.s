    .text//Bls
    .org 0x0000
    ADDS X1,X1,#-1
    B.LS correcto
    ADD XZR,XZR,XZR //NOP
    ADD XZR,XZR,XZR //NOP
    ADD XZR,XZR,XZR //NOP
    STUR X2,[X0,#0]
    error: CBZ XZR , error
    ADD XZR,XZR,XZR //NOP
    ADD XZR,XZR,XZR //NOP
    ADD XZR,XZR,XZR //NOP

correcto: STUR X7,[X0,#0]
    finloop: CBZ XZR, finloop
//si es correcto MEM[0] = 7 si no MEM[0] = 2
/*
ROM [0:11] ='{32'hf1000421,
32'h54000129,
32'h8b1f03ff,
32'h8b1f03ff,
32'h8b1f03ff,
32'hf8000002,
32'hb400001f,
32'h8b1f03ff,
32'h8b1f03ff,
32'h8b1f03ff,
32'hf8000007,
32'hb400001f};
*/