`timescale 1ns/1ps
module sat_add_tb();
  reg signed [7:0] a;
  reg signed [7:0] b;
  wire signed [7:0] sum;
  saturating_adder #(8) u1 ( a,b,sum);
  
  
  initial begin 
    $monitor(" time = %t, a = %d, b = %d, sum = %d", $time, a, b, sum);
    #200;
    $finish;
  end
  
   initial begin
    $dumpfile("dump.vcd");
     $dumpvars(0,sat_add_tb);
   end
  
  
  initial begin
     a = 8'h11;
     b = 8'h23;
    #10;
     a = 8'hFA;
     b = 8'h08;
    #10;
    a = 8'h8A;
     b = 8'h8F;
    #10;
    
    a= 120;
    b= 8;
    #10;
    a = -120;
    b = -7;
    #10;
     a = 125;
     b = 5;
    #10;
    
   
  end
endmodule
