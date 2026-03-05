class packet;
  //class properties
  bit [31:0] addr;
  bit [31:0] data;
  bit write;
  string pkt_type;
  
  //constructor
  function new();
    addr = 32'h10;
    data = 32'hFF;
    write = 1;
    pkt_type = "GOOD_PKT";
  endfunction
  
  //method to display class properties
  function void display();
    $display("-----------------------------------");
    $display("\t addr = %0d", addr);
    $display("\t data = %0h", data);
    $display("\t write = %0d", write);
    $display("\t pkt_type = %0s", pkt_type);
    $display("-----------------------------------");
  endfunction
endclass


module class_assignment;
  packet pkt_1;
  packet pkt_2;
  
  initial begin
    pkt_1 = new();
    $display("\t**** calling pkt_1 display ****");
    pkt_1.display();
    
    //assigning pkt_1 to pkt_2
    pkt_2 = pkt_1;
    $display("\t**** calling pkt_2 display ****");
    pkt_2.display();
    
    //changing values with pkt_2 handle
    pkt_2.addr = 32'hAB;
    pkt_2.pkt_type = "BAD_PKT";
    
    //changes made with pkt_2 handle will reflect on pkt_1
    $display("\t**** calling pkt_1 display ****");
    pkt_1.display();
  end
endmodule
