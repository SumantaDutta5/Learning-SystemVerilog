`timescale 1ns/1ps

module add(
  input [7:0] a,b,
  output [8:0] sum
);
  
  assign sum = a + b;
  
endmodule
