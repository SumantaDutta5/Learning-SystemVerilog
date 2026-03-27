class transaction;
  randc bit [7:0] a;
  randc bit [7:0] b;
  bit [8:0] sum;
endclass





class generator;
  mailbox mbx;
  event done;
  transaction t;
  integer i;
  
  function new (mailbox mbx);
    this.mbx = mbx;
  endfunction
  
  task main();
    t = new();
    
    for(i=0;i<25;i++) begin
      t.randomize();
      mbx.put(t);
      $display("[GEN]: Data sent to Driver");
      @(done);
      #10;
    end
  endtask
endclass





interface add_intf();
  logic [7:0] a;
  logic [7:0] b;
  logic [8:0] sum;
endinterface





class driver;
  mailbox mbx;
  transaction t;
  event done;
  virtual add_intf vif;
  
  function new (mailbox mbx);
    this.mbx = mbx;
  endfunction
  
  task main();
    t = new();
    forever begin
      mbx.get(t);
      vif.a = t.a;
      vif.b = t.b;
      $display("[DRV]: Interface is triggered");
      -> done;
      #10;
    end
  endtask
endclass





class monitor;
  virtual add_intf vif;
  mailbox mbx;
  transaction t;
  
  function new (mailbox mbx);
    this.mbx = mbx;
  endfunction
  
  task main();
    t = new();
    forever begin
      t.a = vif.a;
      t.b = vif.b;
      t.sum = vif.sum;
      mbx.put(t);
      $display("[MON]: Data sent to Scoreboard");
      #10;
    end
  endtask
endclass





class scoreboard;
  mailbox mbx;
  transaction t;
  bit [8:0] temp;
  
  function new (mailbox mbx);
    this.mbx = mbx;
  endfunction
  
  task main();
    t = new();
    forever begin
      mbx.get(t);
      temp = t.a + t.b;
      if(t.sum == temp)
        $display("[SCO]: Test Passed");
      else
        $display("[SCO]: Test Failed");
      #10;
    end
  endtask
endclass





class environment;
  generator gen;
  driver drv;
  monitor mon;
  scoreboard sco;
  
  mailbox gdmbx, msmbx;
  
  virtual add_intf vif;
  event gddone;
  
  function new(mailbox gdmbx, mailbox msmbx);
    this.gdmbx = gdmbx;
    this.msmbx = msmbx;
    gen = new(gdmbx);
    drv = new(gdmbx);
    mon = new(msmbx);
    sco = new(msmbx);
  endfunction
  
  task main();
    drv.vif = vif();
    mon.vif = vif();
    
    gen.done = gddone;
    drv.done = gddone;
    
    fork
      gen.main();
      drv.main();
      mon.main();
      sco.main();
    join_any
    
  endtask
endclass





module tb;
  environment e;
  mailbox gdmbx, msmbx;
  
  add_intf vif();
  
  add dut (vif.a, vif.b, vif.sum);
  
  initial begin
    gdmbx = new();
    msmbx = new();
    e = new(gdmbx, msmbx);
    e.vif = vif;
    e.main();
    #500;
    $finish;
  end
  
endmodule
