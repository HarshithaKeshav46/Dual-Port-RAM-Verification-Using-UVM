class ram_sb extends uvm_scoreboard;
  `uvm_component_utils(ram_sb)

  uvm_analysis_imp #(ram_trans,ram_sb) awi;
  uvm_tlm_analysis_fifo #(ram_trans) af;
  bit [31:0] mem [bit[7:0]];

  function new(string name="ram_sb",uvm_component parent=null);
    super.new(name,parent);
    awi = new("awi",this);
    af  = new("af",this);
  endfunction

  // Write from write monitor
  virtual function void write(ram_trans txn);
    mem[txn.write_addr] = txn.write_data;
  endfunction

  virtual task run_phase(uvm_phase phase);
    ram_trans t;
    forever begin
      af.get(t);
      if(!mem.exists(t.read_addr))
        `uvm_error("SB","Address Mismatch")
      else if(t.read_data != mem[t.read_addr])
        `uvm_error("SB","Data Mismatch")
      else
        `uvm_info("SB","DATA MATCHED SUCCESSFULLY",UVM_LOW)
    end
  endtask
endclass