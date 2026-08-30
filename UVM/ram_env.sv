class ram_env extends uvm_env;
  `uvm_component_utils(ram_env)
  
  wagent w_agt;
  ragent r_agt;
  ram_sb sb;
  
  function new(string name="ram_env", uvm_component parent);
    super.new(name,parent);    
  endfunction
  
  function void build_phase(uvm_phase phase);   
    w_agt = wagent::type_id::create("w_agt",this);
    r_agt = ragent::type_id::create("r_agt",this);
    sb    = ram_sb::type_id::create("sb",this);
  endfunction
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    r_agt.r_mon.ap.connect(sb.af.analysis_export);
    w_agt.w_mon.ap.connect(sb.awi);
  endfunction
endclass