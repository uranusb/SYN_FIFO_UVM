class f_sequence_item extends uvm_sequence_item;
  rand bit wr;
  rand bit rd;
  rand bit [7:0] data_in;
  bit full;
  bit empty;
  bit [7:0] data_out;
  
  `uvm_object_utils_begin(f_sequence_item)
  `uvm_field_int(wr, UVM_ALL_ON)
  `uvm_field_int(rd, UVM_ALL_ON)
  `uvm_field_int(data_in, UVM_ALL_ON)
  `uvm_object_utils_end
  constraint wr_rd2 {wr != rd;}
  
  function new(string name = "f_sequence_item");
    super.new(name);
  endfunction

endclass
