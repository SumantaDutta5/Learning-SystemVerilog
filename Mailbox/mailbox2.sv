module tb;
  mailbox mbx;
  int received_data;
  int received_data2;
  
  initial begin
    mbx = new();
  end
  
  initial begin
    mbx.put(5);
    $display("Data sent into mailbox");
  end
  
  initial begin
    //mbx.get(received_data);	Takes the data from the mailbox
    mbx.peek(received_data);	//Only copies the data from the mailbox
    $display("Data received is %d", received_data);
    
    //mbx.get(received_data);		Blocking method
    //Won't work unless used with mbx.peek()
    mbx.try_get(received_data2);	//Non-blocking method
    
    $display("Data received again is %d", received_data2);
  end
  
endmodule
