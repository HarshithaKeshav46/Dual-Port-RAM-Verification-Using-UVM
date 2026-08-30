class ram_trans extends uvm_sequence_item;
  `uvm_object_utils(ram_trans)
  
	function new(string name = "ram_trans");
		super.new(name);
	endfunction
  
	rand bit write_en;
	rand bit read_en;
	rand logic [31:0] write_data;
	logic [31:0] read_data;
	rand logic [7:0] write_addr;
	rand logic [7:0] read_addr;
  
	constraint valid_addr { write_addr != read_addr; }
	constraint valid_data { write_data inside {[1:409]}; }
	constraint valid_en { {write_en,read_en} != 2'b00; }
endclass