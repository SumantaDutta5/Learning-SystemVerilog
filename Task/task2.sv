module tb;
  des u0();
  
  initial begin
    u0.display();	//Task is not visible in the module 'tb'
  end
endmodule

module des;
  initial begin
    display();	//Task definition is local to the module
  end
  
  task display();
    $display("Hello World");
  endtask
endmodule
