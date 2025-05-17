`timescale 1ns / 1ps

module BW_mult_4bit(
    input [3:0] a,b,
    output [7:0] p
    );
   
    wire [15:0] c;
    wire [11:0] s;
  
    white_cell w1(a[0],b[0],1'b0,1'b0,p[0],c[0]); //11
    white_cell w2(a[1],b[0],1'b0,1'b0,s[0],c[1]);//12
    white_cell w3(a[2],b[0],1'b0,1'b0,s[1],c[2]);//13
    gray1_cell g1(a[3],b[0],1'b0,1'b0,s[2],c[3]);//14
    
    white_cell w4(a[0],b[1],s[0],c[0],p[1],c[4]);//21
    white_cell w5(a[1],b[1],s[1],c[1],s[3],c[5]);//22
    white_cell w6(a[2],b[1],s[2],c[2],s[4],c[6]);//23
    gray1_cell g2(a[3],b[1],1'b0,c[3],s[5],c[7]);//24
    
    white_cell w7(a[0],b[2],s[3],c[4],p[2],c[8]);//31
    white_cell w8(a[1],b[2],s[4],c[5],s[6],c[9]);//32
    white_cell w9(a[2],b[2],s[5],c[6],s[7],c[10]);//33
    gray1_cell g3(a[3],b[2],1'b0,c[7],s[8],c[11]);//34
    
    gray1_cell g4(a[0],b[3],s[6],c[8],p[3],c[12]);//41
    gray1_cell g5(a[1],b[3],s[7],c[9],s[9],c[13]);//42
    gray1_cell g6(a[2],b[3],s[8],c[10],s[10],c[14]);//43
    white_cell w10(a[3],b[3],1'b0,c[11],s[11],c[15]);//44
    
  kogge_stone_4bit k({c[12],c[13],c[14],c[15]},{s[9],s[10],s[11],1'b1},1'b1,p[7:4]);
 
endmodule

module kogge_stone_4bit(
    input [3:0] a, b,
    input cin,
    output [4:0] s
);
    wire [3:0] c;
    wire [3:0] p, g;
    wire bf1, bf2, bf3, bf4;
    wire w1, w2, w3, w4;

    // Propagate signals
    prop x01(p[0], a[0], b[0]);
    prop x11(p[1], a[1], b[1]);
    prop x21(p[2], a[2], b[2]);
    prop x31(p[3], a[3], b[3]);
     
    // Generate signals
    gen g00(g[0], a[0], b[0]);
    gen g11(g[1], a[1], b[1]);
    gen g22(g[2], a[2], b[2]);
    gen g33(g[3], a[3], b[3]);

    // Initial carry
    Gray_Cell gc0(g[0], p[0], cin, bf1);
    buf  b1(c[0], bf1);
   
    // First carry
    Gray_Cell gc1(g[1], p[1], bf1, bf2);
    buf  b2(c[1], bf2);
   
    // Second carry
    Black_Cell bcl(p[2], p[1], g[2], g[1], w1, w2);
    Gray_Cell gc2(w2, w1, bf1, bf3);
    buf  b3(c[2], bf3);

    // Third carry
    Black_Cell bc2(p[3], p[2], g[3], g[2], w3, w4);
    Gray_Cell gc3(w4, w3, bf2, bf4);
    buf  b4(c[3], bf4);
   
    // Sum calculation
    xor x2(s[0], p[0], cin);
    xor x3(s[1], p[1], c[0]);
    xor x4(s[2], p[2], c[1]);
    xor x5(s[3], p[3], c[2]);
    buf  b5(s[4], bf4);

endmodule