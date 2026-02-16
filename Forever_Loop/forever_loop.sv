module tb;
  initial begin
    forever begin
      #5	$display("Hello World!");
    end
  end
  
  initial
    #50	$finish;
endmodule
