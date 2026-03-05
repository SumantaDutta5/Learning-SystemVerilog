class packet;
  rand bit [3:0] addr;
  
  constraint addr_range {addr > 5;}
endclass

module constr_blocks;
  initial begin
    packet pkt;
    pkt = new();
    repeat(10)	begin
      pkt.randomize();
      $display("\taddr = %0d",pkt.addr);
    end
  end
endmodule
