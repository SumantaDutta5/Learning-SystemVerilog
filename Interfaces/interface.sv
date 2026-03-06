interface ha_if;
  logic a,b;
  logic sum,cout;
endinterface

module half_adder (ha_if inf);
  assign inf.sum = inf.a ^ inf.b;
  assign inf.cout = inf.a & inf.b;
endmodule


module tb;
  
  ha_if inf();
  half_adder ha(inf);
  
  initial
    begin
      inf.a = 1'b1;
      inf.b = 1'b0;
      
      #1
      $display("The value of sum is %d", inf.sum);
      
    end
endmodule
