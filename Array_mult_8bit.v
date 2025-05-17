`timescale 1ns / 1ps

module Array_mult_8bit(
    input clk,
    input [7:0] a,b,
    output [15:0] p
    );
    
    wire [8:0] s;
    wire [8:0] s1;
    wire [8:0] s2;
    wire [8:0] s3;
    wire [8:0] s4;
    wire [8:0] s5;
    wire [8:0] s6;
    
    wire a0b1,a1b1,a2b1,a3b1,a4b1,a5b1,a6b1,a7b1
    ,a0b2,a1b2,a2b2,a3b2,a4b2,a5b2,a6b2,a7b2
    ,a0b3,a1b3,a2b3,a3b3,a4b3,a5b3,a6b3,a7b3,
    a0b4,a1b4,a2b4,a3b4,a4b4,a5b4,a6b4,a7b4,
    a0b5,a1b5,a2b5,a3b5,a4b5,a5b5,a6b5,a7b5,
    a0b6,a1b6,a2b6,a3b6,a4b6,a5b6,a6b6,a7b6,
    a0b7,a1b7,a2b7,a3b7,a4b7,a5b7,a6b7,a7b7;
    
    and a01(a0b0,a[0],b[0]);
    and a02(a1b0,a[1],b[0]);
    and a03(a2b0,a[2],b[0]);
    and a04(a3b0,a[3],b[0]);
    and a05(a4b0,a[4],b[0]);
    and a06(a5b0,a[5],b[0]);
    and a07(a6b0,a[6],b[0]);
    and a08(a7b0,a[7],b[0]);
    
    and a10(a0b1,a[0],b[1]);
    and a11(a1b1,a[1],b[1]);
    and a12(a2b1,a[2],b[1]);
    and a13(a3b1,a[3],b[1]);
    and a14(a4b1,a[4],b[1]);
    and a15(a5b1,a[5],b[1]);
    and a16(a6b1,a[6],b[1]);
    and a17(a7b1,a[7],b[1]);
    
    and a20(a0b2,a[0],b[2]);
    and a21(a1b2,a[1],b[2]);
    and a22(a2b2,a[2],b[2]);
    and a23(a3b2,a[3],b[2]);
    and a24(a4b2,a[4],b[2]);
    and a25(a5b2,a[5],b[2]);
    and a26(a6b2,a[6],b[2]);
    and a27(a7b2,a[7],b[2]);
    
    and a30(a0b3,a[0],b[3]);
    and a31(a1b3,a[1],b[3]);
    and a32(a2b3,a[2],b[3]);
    and a33(a3b3,a[3],b[3]);
    and a34(a4b3,a[4],b[3]);
    and a35(a5b3,a[5],b[3]);
    and a36(a6b3,a[6],b[3]);
    and a37(a7b3,a[7],b[3]);
    
    and a40(a0b4,a[0],b[4]);
    and a41(a1b4,a[1],b[4]);
    and a42(a2b4,a[2],b[4]);
    and a43(a3b4,a[3],b[4]);
    and a44(a4b4,a[4],b[4]);
    and a45(a5b4,a[5],b[4]);
    and a46(a6b4,a[6],b[4]);
    and a47(a7b4,a[7],b[4]);
    
    and a50(a0b5,a[0],b[5]);
    and a51(a1b5,a[1],b[5]);
    and a52(a2b5,a[2],b[5]);
    and a53(a3b5,a[3],b[5]);
    and a54(a4b5,a[4],b[5]);
    and a55(a5b5,a[5],b[5]);
    and a56(a6b5,a[6],b[5]);
    and a57(a7b5,a[7],b[5]);
    
    and a60(a0b6,a[0],b[6]);
    and a61(a1b6,a[1],b[6]);
    and a62(a2b6,a[2],b[6]);
    and a63(a3b6,a[3],b[6]);
    and a64(a4b6,a[4],b[6]);
    and a65(a5b6,a[5],b[6]);
    and a66(a6b6,a[6],b[6]);
    and a67(a7b6,a[7],b[6]);
    
    and a70(a0b7,a[0],b[7]);
    and a71(a1b7,a[1],b[7]);
    and a72(a2b7,a[2],b[7]);
    and a73(a3b7,a[3],b[7]);
    and a74(a4b7,a[4],b[7]);
    and a75(a5b7,a[5],b[7]);
    and a76(a6b7,a[6],b[7]);
    and a77(a7b7,a[7],b[7]);
    
    
kogge_stone k1({1'b0,a7b0,a6b0,a5b0,a4b0,a3b0,a2b0,a1b0},{a7b1,a6b1,a5b1,a4b1,a3b1,a2b1,a1b1,a0b1},s[8:0]);

kogge_stone k2(s0[8:1],{a7b2,a6b2,a5b2,a4b2,a3b2,a2b2,a1b2,a0b2},1'b0,s1[8:0]);

kogge_stone k3(s1[8:1],{a7b3,a6b3,a5b3,a4b3,a3b3,a2b3,a1b3,a0b3},1'b0,s2[8:0]);

kogge_stone k4(s2[8:1],{a7b4,a6b4,a5b4,a4b4,a3b4,a2b4,a1b4,a0b4},1'b0,s3[8:0]);

kogge_stone k5(s3[8:1],{a7b5,a6b5,a5b5,a4b5,a3b5,a2b5,a1b5,a0b5},1'b0,s4[8:0]);

kogge_stone k6(s4[8:1],{a7b6,a6b6,a5b6,a4b6,a3b6,a2b6,a1b6,a0b6},1'b0,s5[8:0]);

kogge_stone k7(s5[8:1],{a7b7,a6b7,a5b7,a4b7,a3b7,a2b7,a1b7,a0b7},1'b0,s6[8:0]);

buf b1(p[0],a0b0);
buf b2(p[1],s0[0]);
buf b3(p[2],s1[0]);
buf b4(p[3],s2[0]);
buf b5(p[4],s3[0]);
buf b6(p[5],s4[0]);
buf b7(p[6],s5[0]);
buf b8(p[7],s6[0]);
buf b10(p[8],s6[1]);
buf b11(p[9],s6[2]);
buf b12(p[10],s6[3]);
buf b13(p[11],s6[4]);
buf b14(p[12],s6[5]);
buf b15(p[13],s6[6]);
buf b16(p[14],s6[7]);
buf b17(p[15],s6[8]);


endmodule

