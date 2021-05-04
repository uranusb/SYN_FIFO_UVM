interface f_interface(input clk, reset);
  bit wr;
  bit rd;
  bit [7:0] data_in;
  bit full;
  bit empty;
  bit [7:0] data_out;
  
  clocking d_cb @(posedge clk);
    default input #1 output #1;
    output wr;
    output rd;
    output data_in;
    input full;
    input empty;
    input data_out;
  endclocking
  
  clocking m_cb @(posedge clk);
    default input #1 output #1;
    input wr;
    input rd;
    input data_in;
    input full;
    input empty;
    input data_out;
  endclocking
  
  modport d_mp (input clk, reset, clocking d_cb);
  modport m_mp (input clk, reset, clocking m_cb);
    
endinterface