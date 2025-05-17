`timescale 1ns / 1ps

module Array_mult_8bit_tb;
 
    reg clk;
    reg [7:0] a,b;
    wire [15:0] p;
   
    
    Dadda_mult_8bit uut(clk,a,b,p);
    integer i;
    initial begin
     a=8'b00000000;
        b=8'b00000000;#0.1 
        a=8'b11111111;
        b=8'b11111111; #0.1;
        a=8'b10111001;
        b=8'b11100111; #0.1;
        for(i=1;i<65536;i=i+1)
            #0.1 {a,b}=i;
            
            #0.1 $finish;
    end
endmodule

