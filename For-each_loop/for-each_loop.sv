module tb;
  int array[5] = '{1,2,3,4,5};
  int sum;
  
  initial begin
    foreach(array[i])
      $display("array[%0d]=%0d",i,array[i]);
    
    foreach(array[l_index]) begin
      sum += array[l_index];
      $display("array[%0d]=%0d, sum=%0d",l_index,array[l_index],sum);
    end
  end
endmodule
