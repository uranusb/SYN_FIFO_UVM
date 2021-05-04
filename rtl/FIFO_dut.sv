module SYN_FIFO(clk, reset, data_in, wr, rd, full, empty, data_out);
  parameter ADDRESS = 4, WIDTH = 8, DEPTH = 16;
  
  input clk, reset, wr, rd;
  input [WIDTH-1:0] data_in;
  output reg full, empty;
  output reg [WIDTH-1:0] data_out;
  
  reg [ADDRESS-1:0] wr_ptr, rd_ptr;
  reg [WIDTH-1:0] memory [DEPTH-1:0];
  reg [ADDRESS-1:0] cur_ptr;
 
  assign full = (cur_ptr == 'b1111);
  assign empty = (cur_ptr == 'b0000);
  
  always@(posedge clk)begin
    if(reset == 1)begin
      wr_ptr <= 'b0;
      rd_ptr <= 'b0;
      data_out <= 'b0;
      foreach (memory[i,j])
        memory[i][j] <= 'b0;
    end
    else begin
      if(wr == 1 && full != 1)begin
        memory[wr_ptr] <= data_in;
        wr_ptr <= wr_ptr+1;
      end
      if(rd == 1 && empty!= 1)begin
        data_out <= memory[rd_ptr];
        rd_ptr <= rd_ptr + 1;
      end
      cur_ptr = wr_ptr - rd_ptr;
    end
  end
endmodule
