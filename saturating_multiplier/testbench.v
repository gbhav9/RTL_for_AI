
`timescale 1ns/1ps
module sat_mult_tb();
  
  reg signed [7:0] a;             
  reg signed [7:0] b;
  wire signed [7:0] product;
  
  saturating_multiplier #(8) u1 ( a,b, product);
  
  initial begin 
    $monitor(" time = %t, a = %d, b = %d, product = %d", $time, a, b, product);
    #200;
    $finish;
  end
  
   initial begin
    $dumpfile("dump.vcd");
     $dumpvars(0,sat_mult_tb);
   end
  
  
  initial begin
     a = 100;
     b = 2;
    #10;
     a = -50;
     b = 3;
    #10;
    a = 10;
     b = 12;
    #10;
    
    a= 5;
    b= -6;
    #10;
    
  end
endmodule
