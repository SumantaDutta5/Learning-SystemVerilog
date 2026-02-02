module tb;
  bit [3:0] [7:0] m_data;
  
  initial begin
  //1. Assign a value to the MDA 8
  m_data = 32'hface_cafe;
  $display("m_data=0x%0h", m_data);
    
  //2. Iterate through each bit of the vector and print the values
  for(int i = 0; i < $size(m_data); i++) begin
    $display("m_data[%d]=%b (0x%0h)",i,m_data[i], m_data[i]);
  end
end
endmodule
