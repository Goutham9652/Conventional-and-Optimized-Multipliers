`timescale 1ns / 1ps

module BW_4bit_tb;
    reg [3:0] a,b;
    wire [7:0] p;
BW_mult_4bit b1(a,b,p);
integer i;
initial begin
  
        
        a = 4'b0000; b = 4'b0000; #10
        a = 4'b0100; b = 4'b1000; #10
        a = 4'b0101; b = 4'b1001; #10
        a = 4'b0011; b = 4'b1111; #10
         a = 4'b1111; b = 4'b1111; #10
        $stop;
end
endmodule
