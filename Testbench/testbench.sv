`include "uvm_macros.svh"
import uvm_pkg::*;
`include "ram_if.sv"
`include "ram_trans.sv"
`include "ram_config.sv"
`include "ram_wseqs.sv"
`include "ram_rseqs.sv"
`include "ram_rseqr.sv"
`include "ram_wseqr.sv"
`include "ram_rdrv.sv"
`include "ram_wdrv.sv"
`include "ram_rmon.sv"
`include "ram_wmon.sv"
`include "ram_wagent.sv"
`include "ram_ragent.sv"
`include "ram_sb.sv"
`include "ram_env.sv"
`include "ram_test.sv"

module top;
	bit clock;
	ram_if intf(clock);
	dual_port_ram DUT(.clock(clock),.write_en(intf.write_en),.write_addr(intf.write_addr),.write_data(intf.write_data),
						.read_en(intf.read_en),
						.read_addr(intf.read_addr),
						.read_data(intf.read_data)
				);
  
		initial begin
			clock = 0;
			forever #5 clock = ~clock;
		end
  
		initial begin
			uvm_config_db#(virtual ram_if)::set(null,"*","ram_if",intf);
          	run_test("ram_test");
		end
endmodule