class wagent extends uvm_agent;
  `uvm_component_utils(wagent)
  
  wseqr w_sqr;
  wdrv w_drv;
  wmon w_mon;  
  my_config cfg;
  
  function new(string name="wagent", uvm_component parent);
    super.new(name,parent);    
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(my_config)::get(this,"","my_config",cfg))
      `uvm_fatal("wagent","Unable to get the config. Have you set it?")   
      w_mon = wmon::type_id::create("w_mon",this);  
    
    if(cfg.is_active) begin
      w_sqr = wseqr::type_id::create("w_sqr",this);
      w_drv = wdrv::type_id::create("w_drv",this);
    end	   
  endfunction
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    if(cfg.is_active == UVM_ACTIVE)
     w_drv.seq_item_port.connect(w_sqr.seq_item_export);
  endfunction
endclass