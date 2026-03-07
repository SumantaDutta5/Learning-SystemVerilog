interface intf;
  logic ready,valid;
  logic mast_done,slave_done;
  
  modport mast_mp(input ready, output valid, output mast_done);
  modport slave_mp(output ready, input valid, output slave_done);
endinterface

module master(intf.mast_mp mast_intf);
  
  initial
    begin
      mast_intf.valid = 1;
      //mast_intf.ready = 1;
      if(mast_intf.ready)
        mast_intf.mast_done = 1;
    end
endmodule

module slave(intf.slave_mp slave_intf);
  
  initial
    begin
      if(slave_intf.valid)
        slave_intf.ready = 1;
    end
endmodule


module top;
  
  intf inf();
  
  master m(inf);
  slave s(inf);
  
endmodule
