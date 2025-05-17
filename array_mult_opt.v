
module array_mult_opt1(
    input clk,
    input [7:0] a,b,
    output [17:0] p
    );
    
    wire [8:0] s0;
    wire [9:0] s1;
    wire [9:0] s2;
    wire [9:0] s3;
    wire [16:0] s4;
    wire [16:0] s5;
    
    
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
    
    
kogge_stone k1({1'b0,a7b0,a6b0,a5b0,a4b0,a3b0,a2b0,a1b0},{a7b1,a6b1,a5b1,a4b1,a3b1,a2b1,a1b1,a0b1},s0[8:0]);
assign p[0] = a0b0;
kogge_stone k2({1'b0,a7b2,a6b2,a5b2,a4b2,a3b2,a2b2,a1b2},{a7b3,a6b3,a5b3,a4b3,a3b3,a2b3,a1b3,a0b3},s1[9:1]);
assign s1[0] = a0b2;
kogge_stone k3({1'b0,a7b4,a6b4,a5b4,a4b4,a3b4,a2b4,a1b4},{a7b5,a6b5,a5b5,a4b5,a3b5,a2b5,a1b5,a0b5},s2[9:1]);
assign s2[0] = a0b4;
kogge_stone k4({1'b0,a7b6,a6b6,a5b6,a4b6,a3b6,a2b6,a1b6},{a7b7,a6b7,a5b7,a4b7,a3b7,a2b7,a1b7,a0b7},s3[9:1]);
assign s3[0] = a0b6;

KS_adder_16bit k5({7'b0000000,s0[8:0]},{5'b00000,s1[9:0],1'b0},s4[16:0]);

KS_adder_16bit k6({3'b000,s2[9:0],3'b000},{3'b000,s3[9:0],5'b00000},s5[16:0]);

KS_adder_16bit k7(s4[15:0],s5[15:0],p[17:1]);






endmodule

