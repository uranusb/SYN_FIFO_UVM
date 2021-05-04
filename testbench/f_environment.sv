`include "f_agent.sv"
`include "f_scoreboard.sv"

class f_environment extends uvm_env;
  f_agent f_agt;
  f_scoreboard f_scb;
  `uvm_component_utils(f_environment)
  
  function new(string name = "f_environment", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    f_agt = f_agent::type_id::create("f_agt", this);
    f_scb = f_scoreboard::type_id::create("f_scb", this);
  endfunction
  
  virtual function void connect_phase(uvm_phase phase);
    f_agt.f_mon.item_got_port.connect(f_scb.item_got_export);
  endfunction
  
endclass