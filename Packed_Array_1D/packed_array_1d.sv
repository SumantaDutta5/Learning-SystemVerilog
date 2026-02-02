module tb;
 bit [7:0] m_data;

 initial begin
 //1. Assign a value to the vector
 m_data = 8'hA2;

 //2. Iterate through each bit of the vector and print the values
 for(int i = 0; i < $size(m_data); i++) begin
 $display("m_data[%d]=%b",i,m_data[i]);
 end
 end
 endmodule
