module timer_tb;
    reg clk,rst,trig;
    wire out_pulse;
    reg [4:0] load;
  
  timer #(.N(5)) t1(
    .clk(clk),
    .rst(rst),
    .trig(trig),
    .out_pulse(out_pulse),
    .load(load)
  );
  initial begin 
    $dumpfile("d.vcd");
    $dumpvars();
  end
  initial begin 
    clk = 1'b0;
    trig = 0;
    load = 0;
    rst = 1'b1;
    #22;
    rst = 1'b0;
    @(negedge clk ) load <= 5'd4;
    #22 trig = 1;
    #22 trig = 0;
    #100;
    @(negedge clk ) load <= 5'd7;
    #22 trig = 1;
    #15; 
    @(negedge clk ) load <= 5'd9;
    #155;
    trig = 0;
    #150;
    trig = 1;
    #270;
    trig = 0;
    #255;
    $finish;
  end

  always begin 
  	#10 clk = ~clk;
  end
endmodule