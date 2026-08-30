class rmon extends uvm_monitor;
  `uvm_component_utils(rmon)
  
  virtual ram_if.read_mon vif;
  uvm_analysis_port #(ram_trans) ap;
  my_config cfg;
  
  function new(string name="rmon", uvm_component parent);
    super.new(name,parent);
    ap = new("ap",this);
  endfunction
  
   virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
     if(!uvm_config_db#(my_config)::get(this,"","my_config",cfg))
      `uvm_fatal("ram_rmon","Failed to get cfg")
  endfunction

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    vif = cfg.vif;
  endfunction

  virtual task run_phase(uvm_phase phase);
    ram_trans txn;
    forever begin
      @(vif.r_mon_cb);
      if(vif.r_mon_cb.read_en) begin
        txn = ram_trans::type_id::create("txn",this);
        txn.read_addr = vif.r_mon_cb.read_addr;
        txn.read_data = vif.r_mon_cb.read_data;
        ap.write(txn);
      end
    end
  endtask
endclass