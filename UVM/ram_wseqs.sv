class wseqs extends uvm_sequence#(ram_trans);
  `uvm_object_utils(wseqs)
  function new(string name= "wseqs");
    super.new(name);
  endfunction
  
  virtual task body();
    req = ram_trans::type_id::create("req");
    start_item(req); 
    assert(req. randomize() with {write_addr == 5; write_data == 100;});
    finish_item(req);   
  endtask
endclass