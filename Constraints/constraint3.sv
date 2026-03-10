class packet;
  rand bit [3:0] start_addr;
  rand bit [3:0] end_addr;
  rand bit [3:0] addr;
  
  constraint addr_range {addr inside {[start_addr:end_addr]};}
endclass

module constr_inside;
  initial begin
    packet pkt;
    pkt = new();
    repeat(3) begin
      pkt.randomize();
      $display("Start Address: %0d, End Address: %0d",pkt.start_addr,pkt.end_addr);
      $display("Address: %0d",pkt.addr);
    end
  end
endmodule
