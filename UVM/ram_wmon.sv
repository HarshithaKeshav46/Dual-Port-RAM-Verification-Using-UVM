class wmon extends uvm_monitor;
  `uvm_component_utils(wmon)
  
  virtual ram_if.write_mon vif;
  uvm_analysis_port #(ram_trans) ap;
  my_config cfg;
  
  function new(string name="wmon", uvm_component parent);
    super.new(name,parent);
     ap = new("ap",this);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if(!uvm_config_db#(my_config)::get(this,"","my_config",cfg))
      `uvm_fatal("ram_wmon","Failed to get cfg")
  endfunction

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    vif = cfg.vif;
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    ram_trans txn;

    forever begin
      @(vif.w_mon_cb);

      if(vif.w_mon_cb.write_en) begin
        txn = ram_trans::type_id::create("txn",this);
        txn.write_addr = vif.w_mon_cb.write_addr;
        txn.write_data = vif.w_mon_cb.write_data;
        ap.write(txn);
      end
    end
  endtask
endclass