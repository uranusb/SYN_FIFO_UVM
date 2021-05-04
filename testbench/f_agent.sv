`include "f_sequence_item.sv"
`include "f_sequence.sv"
`include "f_sequencer.sv"
`include "f_driver.sv"
`include "f_monitor.sv"

class f_agent extends uvm_agent;
  f_sequencer f_seqr;
  f_driver f_dri;
  f_monitor f_mon;
  `uvm_component_utils(f_agent)
  
  function new(string name = "f_agent", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(get_is_active() == UVM_ACTIVE) begin
      f_seqr = f_sequencer::type_id::create("f_seqr", this);
      f_dri = f_driver::type_id::create("f_dri", this);
    end
    f_mon = f_monitor::type_id::create("f_mon", this);
  endfunction
  
  virtual function void connect_phase(uvm_phase phase);
    if(get_is_active() == UVM_ACTIVE)
      f_dri.seq_item_port.connect(f_seqr.seq_item_export);
  endfunction
  
endclass
    
    