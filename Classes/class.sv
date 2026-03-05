class sv_class;
  //class properties
  int x;
 
  //method-1
  task set(int i);
    x = i;
  endtask
 
  //method-2
  function int get();
    return x;
  endfunction;
endclass


module sv_class_ex;
  sv_class class_1;	//creating handle
 
  initial begin
    sv_class class_2 = new();	//creating handle and object
    class_1 = new();	//creating object for the handle
 
    //Accessing class methods
    class_1.set(10);
    class_2.set(20);
 
    $display("\tclass_1 :: value of x = %0d",class_1.get());
    $display("\tclass_2 :: value of x = %0d",class_2.get());
  end
endmodule
