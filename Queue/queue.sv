// Code your testbench here
// or browse Examples

module tb;
  string fruits [$] = {"orange", "apple", "kiwi"};
  
  initial begin
    foreach (fruits [i])
      $display("fruits [%0d]=%s", i, fruits [i]);
    
    $display("fruits=%p", fruits);
    
    fruits = {};
    $display("After deletion, fruits=%p", fruits);
  end
endmodule
