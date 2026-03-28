class Packet;
  rand bit [7:0] addr;
  constraint c_addr {addr>5;addr<3;}
endclass

module tb;
  initial
    begin
      Packet m_pkt = new();
      assert(m_pkt.randomize());
    end
endmodule
