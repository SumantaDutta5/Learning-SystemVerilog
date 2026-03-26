module semaphore_ex;
  semaphore sema;  //declaring semaphore sema
  initial begin
    sema = new(1);  //creating sema with '1' key
    fork
      display();  //process-1
      display();  //process-2
    join
  end

  //display method
  task automatic display();
    sema.get();  //get '1' key from sema
    $display($time,"\tCurrent Simulation Time");
    #30;
    sema.put();  //putting '1' key to sema
  endtask
endmodule
