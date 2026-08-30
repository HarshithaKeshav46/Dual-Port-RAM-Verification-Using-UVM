class rseqs extends uvm_sequence#(ram_trans);
  `uvm_object_utils(rseqs)
  function new(string name= "rseqs");
    super.new(name);
  endfunction
  
  virtual task body(); 
    req = ram_trans::type_id::create("req");
    start_item(req); 
    assert(req. randomize() with {read_addr == 5;}); 
    finish_item(req);   
  endtask 
endclass