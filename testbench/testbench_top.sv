import uvm_pkg::*;
`include "uvm_macros.svh"
`include "f_interface.sv"
`include "f_test.sv"

module tb;
  bit clk;
  bit reset;
  
  always #5 clk = ~clk;
  
  initial begin
    clk = 1;
    reset = 1;
    #5;
    reset = 0;
  end
  
  f_interface tif(clk, reset);
  
  SYN_FIFO dut(.clk(tif.clk),
               .reset(tif.reset),
               .data_in(tif.data_in),
               .wr(tif.wr),
               .rd(tif.rd),
               .full(tif.full),
               .empty(tif.empty),
               .data_out(tif.data_out));
  
  initial begin
    uvm_config_db#(virtual f_interface)::set(null, "", "vif", tif);
    $dumpfile("dump.vcd"); 
    $dumpvars;
    run_test("f_test");
  end
  
endmodule