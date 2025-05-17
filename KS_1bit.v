`timescale 1ns / 1ps

module KS_1bit(
    input a,b,
    input cin,
    output s,cout
    );
    wire p,g;
    prop p0(p, a,b);
    gen g0(g, a, b);
    Gray_Cell gc0(g, p,cin,cout);
   
    xor x1(s,p,cin);
endmodule
