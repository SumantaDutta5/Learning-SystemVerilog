module tb;
  byte stack[8];
  
  initial begin
    //1. Assign random values to each slot of the stack
    foreach(stack[i]) begin
      stack[i] = $random;	//any random integer from -128 to 127
      $display("Assign 0x%0h to index %0d", stack[i],i);
    end
    
    //Print the contents of the stack
    $display("Stack=%p", stack);
  end
endmodule
