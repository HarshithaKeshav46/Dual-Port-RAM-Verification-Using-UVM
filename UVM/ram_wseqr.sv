class wseqr extends uvm_sequencer#(ram_trans);
  `uvm_component_utils(wseqr)
  
  function new(string name="wseqr", uvm_component parent);
    super.new(name,parent);   
  endfunction
endclass