module events_ex;
  event ev_1;
  
  initial begin
    fork
      begin
        #40;
        $display($time,"\tTriggering the event");
        -> ev_1;
      end
      
      begin
        $display($time,"\tWaiting for the event to trigger");
        #60;
        @(ev_1.triggered);
        $display($time,"\tEvent triggered");
      end
    join
  end
  
  initial begin
    #100;
    $display($time,"\tEnding the Simulation");
    $finish;
  end
endmodule
