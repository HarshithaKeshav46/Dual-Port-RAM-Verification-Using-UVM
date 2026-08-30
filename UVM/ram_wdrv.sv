class wdrv extends uvm_driver#(ram_trans);
  `uvm_component_utils(wdrv)
  
  virtual ram_if.write_drv vif;
  my_config cfg;
  
  function new(string name="wdrv", uvm_component parent);
    super.new(name,parent);   
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(my_config)::get(this,"","my_config",cfg))
      `uvm_fatal("ram_wdrv","Failed to get cfg")
  endfunction

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    vif = cfg.vif;
  endfunction

  virtual task run_phase(uvm_phase phase);
    vif.w_drv_cb.write_en <= 0;
    forever begin
      seq_item_port.get_next_item(req);
      @(vif.w_drv_cb);
      vif.w_drv_cb.write_en   <= 1;
      vif.w_drv_cb.write_addr <= req.write_addr;
      vif.w_drv_cb.write_data <= req.write_data;

      @(vif.w_drv_cb);
      vif.w_drv_cb.write_en <= 0;

      seq_item_port.item_done();
    end
  endtask 
endclass