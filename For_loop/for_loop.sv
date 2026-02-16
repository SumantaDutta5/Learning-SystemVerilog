module tb;
  bit clk;
  
  always #10	clk = ~clk;
  initial begin
    bit [3:0] counter;
    
    $display("Counter=%0d", counter);
    for(counter = 2; counter < 14; counter = counter + 2) begin
      @(posedge clk)
      $display("Counter=%0d", counter);
    end
    
    $display("Counter=%0d", counter);
    $finish;
  end
endmodule
