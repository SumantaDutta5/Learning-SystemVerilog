module tb;
  byte stack [2][4];	//2 rows, 4 columns
  
  initial begin
    //Assign random values to each slot of the stack
    foreach(stack[i])
      foreach(stack[i][j]) begin
        stack[i][j] = $random;
        $display("stack[%0d][%0d] = 0x%0h",i,j,stack[i][j]);
      end
    
    //Print contents of the stack
    $display("stack = %p", stack);
  end
endmodule
