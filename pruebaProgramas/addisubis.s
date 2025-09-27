	.text //addis
	.org 0x0000
    ADD X10, XZR,XZR
    ADD XZR, XZR, XZR //nop
    ADD XZR, XZR, XZR //nop 
    ADDS X10,X10,#1 //<-addi
    ADD XZR, XZR, XZR //nop
    ADD XZR, XZR, XZR //nop 
    STUR X10, [X0,#0]
    SUBS X11,X11,#9
    ADD XZR, XZR, XZR //nop
    ADD XZR, XZR, XZR //nop 
    STUR X11,[X0,#8]
    finloop: CBZ XZR,finloop
    //prueba simple de addis y subis (debe imprimir 1 en MEM[0] y 2 en MEM[1] )

    /*
   ROM [0:11] ='{32'h8b1f03ea,
32'h8b1f03ff,
32'h8b1f03ff,
32'hb100054a,
32'h8b1f03ff,
32'h8b1f03ff,
32'hf800000a,
32'hf100256b,
32'h8b1f03ff,
32'h8b1f03ff,
32'hf800800b,
32'hb400001f};*/