module semaphore_ex;
  semaphore sema;
  initial begin
    sema = new(4);
    fork
      display();
      display();
    join
  end
  
  task automatic display();
    sema.get(2);
    $display($time,"\tCurrent Simulation Time");
    #30;
    sema.put();
  endtask
endmodule
