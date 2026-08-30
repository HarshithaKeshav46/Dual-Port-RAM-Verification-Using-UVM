class my_config extends uvm_object;
  `uvm_object_utils(my_config)
  uvm_active_passive_enum is_active;
  virtual ram_if vif;
endclass