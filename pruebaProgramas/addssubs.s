	.text//adds
	.org 0x0000
    ADD X10, XZR,XZR
    ADD XZR, XZR, XZR //nop
    ADD XZR, XZR, XZR //nop 
    ADDS X10,X10,X1 //<-adds
    ADD XZR, XZR, XZR //nop
    ADD XZR, XZR, XZR //nop 
    STUR X10, [X0,#0]
    SUBS X11,X11,X9
    ADD XZR, XZR, XZR //nop
    ADD XZR, XZR, XZR //nop 
    STUR X11,[X0,#8]
    finloop: CBZ XZR,finloop
    //prueba simple de adds y subs (debe imprimir 1 en MEM[0] y 2 en MEM[1] )

 /*   ROM [0:11] ='{32'h8b1f03ea,
32'h8b1f03ff,
32'h8b1f03ff,
32'hab01014a,
32'h8b1f03ff,
32'h8b1f03ff,
32'hf800000a,
32'heb09016b,
32'h8b1f03ff,
32'h8b1f03ff,
32'hf800800b,
32'hb400001f};*/
