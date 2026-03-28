module tb;
  event event_a;
  
  initial begin
    #20	-> event_a;
    $display("[%0t] Thread-1: triggered event_a",$time);
  end
  
  initial begin
    $display("[%0t] Thread-2: waiting for trigger",$time);
    @(event_a);
    $display("[%0t] Thread-2: received event_a trigger",$time);
  end
  
  initial begin
    $display("[%0t] Thread-3: waiting for trigger",$time);
    wait(event_a.triggered);
    $display("[%0t] Thread-3: received event_a trigger",$time);
  end
endmodule
