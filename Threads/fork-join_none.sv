module fork_join;
  initial begin
    $display("------------------------------------------------------------");
    fork
      //Process-1
      begin
        $display($time, "\tProcess-1 Started");
        #5;
        $display($time, "\tProcess-1 Finished");
      end
      
      //Process-2
      begin
        $display($time, "\tProcess-2 Started");
        #20;
        $display($time, "\tProcess-2 Finished");
      end
    join_none
    
    $display($time, "\tOutside Fork-Join");
    $display("------------------------------------------------------------");
  end
endmodule
