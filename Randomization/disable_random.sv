class packet;
  rand byte addr;
  rand byte data;
endclass

module rand_methods;
  initial begin
    packet pkt;
    pkt = new();
    
    //disable rand mode of addr variable of pkt
    pkt.addr.rand_mode(0);
    
    //calling randomize method
    pkt.randomize();
    
    $display("\taddr = %0d \t data = %0d",pkt.addr,pkt.data);
    
    $display("\taddr.rand_mode() = %0d \t data.rand_mode() = %0d",pkt.addr.rand_mode(),pkt.data.rand_mode());
  end
endmodule
