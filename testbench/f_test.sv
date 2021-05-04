`include "f_environment.sv"

class f_test extends uvm_test;
  f_sequence f_seq;
  f_environment f_env;
  `uvm_component_utils(f_test)
  
  function new(string name = "wrrd_test", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    f_seq = f_sequence::type_id::create("f_seq", this);
    f_env = f_environment::type_id::create("f_env", this);
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    f_seq.start(f_env.f_agt.f_seqr);
    phase.drop_objection(this);
    phase.phase_done.set_drain_time(this, 100);
  endtask
  
endclass
