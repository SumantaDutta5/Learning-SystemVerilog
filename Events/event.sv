module events_ex;
  event ev_1;		//declaring event ev_1
  
  initial begin
    fork
      //process-1, triggers the event
      begin
        #40;
        $display($time,"\tTriggering the event");
        -> ev_1;
      end
      
      //process-2, wait for the event to trigger
      begin
        $display($time,"\tWaiting for the event to trigger");
        @(ev_1.triggered);
        $display($time,"\tEvent triggered");
      end
    join
  end		//Process-2 is waiting
endmodule	//During this #40 event-1 got triggered
