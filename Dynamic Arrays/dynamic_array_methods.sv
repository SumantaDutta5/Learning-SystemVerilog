// Code your testbench here
// or browse Examples

module tb;
  string fruits[];

  initial begin
    fruits = new [3];
    fruits = '["apple","orange", "mango"};
    
    $display("fruits.size() = %0d", fruits.size());

    fruits.delete();
    $display("fruits.size() = %0d", fruits.size());
  end
endmodule
