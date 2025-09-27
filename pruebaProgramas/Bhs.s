.text//Bhs
.org 0x0000
//------------
ADD X9,X0,-1
ADD XZR,XZR,XZR
ADD XZR,XZR,XZR
ADDS X9,X9,X1
B.HS carryset
ADD XZR, XZR, XZR    
ADD XZR,XZR,XZR  
ADD XZR,XZR,XZR   
CBZ XZR, finloop
ADD XZR, XZR, XZR    
ADD XZR,XZR,XZR  
ADD XZR,XZR,XZR  
carryset:STUR X15,[X0,#0]
//--------------
finloop: CBZ XZR, finloop
// lo correcto es MEM[0] = 15

/*ROM [0:13] ='{32'hd1000409,
32'h8b1f03ff,
32'h8b1f03ff,
32'hab010129,
32'h54000102,
32'h8b1f03ff,
32'h8b1f03ff,
32'h8b1f03ff,
32'hb40000bf,
32'h8b1f03ff,
32'h8b1f03ff,
32'h8b1f03ff,
32'hf800000f,
32'hb400001f};*/