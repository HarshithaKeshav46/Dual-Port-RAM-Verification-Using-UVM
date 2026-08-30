class ram_test extends uvm_test;
  `uvm_component_utils(ram_test)
  
  my_config cfg;
  ram_env env;
  wseqs ws;
  rseqs rs;
  
  function new(string name="ram_test", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    cfg = my_config::type_id::create("cfg");
    ws = wseqs::type_id::create("ws");
    rs = rseqs::type_id::create("rs");
    
    if(!uvm_config_db#(virtual ram_if)::get(this,"","ram_if",cfg.vif))
      `uvm_fatal("test","Interface not set")
    cfg.is_active = UVM_ACTIVE;
    
    uvm_config_db#(my_config)::set(this,"*","my_config",cfg);
    env = ram_env::type_id::create("env",this);
  endfunction
  
  function void end_of_elaboration_phase(uvm_phase phase);
    uvm_top.print_topology();
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase); 
    phase.raise_objection(this);
      fork
        ws.start(env.w_agt.w_sqr);
        rs.start(env.r_agt.r_sqr);
      join  
    phase.drop_objection(this);  
  endtask
endclass