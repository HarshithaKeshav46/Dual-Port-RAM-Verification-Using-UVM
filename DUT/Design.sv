module dual_port_ram #(
parameter ADDR_WIDTH = 8, // Change as required
parameter DATA_WIDTH = 32
)(
	input logic clock, // Write Port
	input logic write_en, input logic [ADDR_WIDTH-1:0] write_addr, input logic 		[DATA_WIDTH-1:0] write_data, // Read Port
	input logic read_en, input logic [ADDR_WIDTH-1:0] read_addr, output logic 	[DATA_WIDTH-1:0] read_data
);
  
	// Memory Declaration
	logic [DATA_WIDTH-1:0] mem [0:(1<<ADDR_WIDTH)-1];
  
	// WRITE LOGIC
	always_ff @(posedge clock) begin
		if (write_en) begin
			mem[write_addr] <= write_data;
		end
	end
  
	// READ LOGIC (Synchronous Read)
	always_ff @(posedge clock) begin
		if (read_en) begin
			read_data <= mem[read_addr];
		end
	end
endmodule