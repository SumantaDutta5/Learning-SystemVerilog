// Code your testbench here
// or browse Examples

module tb;
  int array[];  // Create a dynamic array that can hold elements
  
  initial begin
    //Create a size for the dynamic array --> size here is 5
    
    array = new [5];
    array = '[31, 67, 10, 4, 99);
              
    foreach (array[i])
      $display("array [%d]=%0d", i, array[i]);
  end
endmodule
