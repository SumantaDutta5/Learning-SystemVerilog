// Code your testbench here
// or browse Examples

class trans;        //Creating a transaction class
  reg [7:0] data;
  reg [3:0] addr;
endclass


class c1;          //The sender class
  trans t1;
  mailbox #(trans) mbox_c1;
  
  function new(mailbox #(trans) mbox_c1);
    this.mbox_c1 = mbox_c1;
    t1 = new();
  endfunction
  
  function void display();
    $display("From class c1");
  endfunction
  
  task run_c1;
    t1.data = 10;
    t1.addr = 5;
    mbox_c1.put(t1);
    $display("The value of data sent by c1 to c2 is %d",t1.data);
    $display("The value of addr sent by c1 to c2 is %d",t1.addr);
  endtask
    
endclass


class c2;            //The receiver class
  trans t2;
  mailbox #(trans) mbox_c2;
  
  function new(mailbox #(trans) mbox_c2);
    this.mbox_c2 = mbox_c2;
    t2 = new();
  endfunction
  
  function void display();
    $display("From class c2");
  endfunction
  
  task run_c2;
    mbox_c2.get(t2);
    $display("The value of data received by c2 from c1 is %d",t2.data);
    $display("The value of addr received by c2 from c1  is %d",t2.addr);
    
  endtask
  
endclass


module top;    //the top module
  c1 c1_h;
  c2 c2_h;
  trans t1_h;
  
  mailbox #(trans) mbox_top = new();
  
  initial begin
    c1_h = new(mbox_top);
    c2_h = new(mbox_top);
    
    c1_h.display();
    c1_h.run_c1();
    
    c2_h.display();
    c2_h.run_c2();
    
  end
endmodule
