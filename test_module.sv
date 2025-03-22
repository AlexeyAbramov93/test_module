module test_module
#(
parameter DATA_W = 8
)
(
input logic clk_in,
input logic reset_in,
input logic [(DATA_W - 1) : 0] data_in,

output logic [(DATA_W - 1) : 0] out_0, 
output logic out_valid_0, 
output logic [(DATA_W - 1) : 0] out_1, 
output logic out_valid_1, 
output logic [(DATA_W - 1) : 0] out_2, 
output logic out_valid_2, 
output logic [(DATA_W - 1) : 0] out_3, 
output logic out_valid_3 
);

reg [DATA_W-1:0] out_reg [0:3];
reg [3:0]        out_valid_reg;

// check data_in in out subsequence
// out_valid_* for case when data_in=0 on e.g. the first/second clock.
wire is_present_0 = out_valid_reg[0] && (data_in == out_reg[0]);
wire is_present_1 = out_valid_reg[1] && (data_in == out_reg[1]);
wire is_present_2 = out_valid_reg[2] && (data_in == out_reg[2]);
wire is_present_3 = out_valid_reg[3] && (data_in == out_reg[3]);
				
reg [DATA_W-1:0]	temp [0:3]; // auxiliary register for sorting out_reg
reg [3:0]			temp_valid; // auxiliary register for sorting out_valid_reg

always @(posedge clk_in) begin
	if(reset_in) begin	
		out_reg[0] <= 0;
		out_valid_reg[0] <= 0;
		out_reg[1] <= 0;
		out_valid_reg[1] <= 0;
		out_reg[2] <= 0;
		out_valid_reg[2] <= 0;
		out_reg[3] <= 0;	
		out_valid_reg[3] <= 0;
		temp[0] <= 0;
		temp[1] <= 0;
		temp[2] <= 0;
		temp[3] <= 0;
		temp_valid[0] <= 0;
		temp_valid[1] <= 0;
		temp_valid[2] <= 0;
		temp_valid[3] <= 0;
	end
	else begin		
		if (is_present_0) begin 

		end
		else if (is_present_1) begin
			// Sort out reg
			temp[1] = out_reg[1];
			out_reg[1] <= out_reg[0];
			out_reg[0] <= temp[1];
			// Also sort the correspond valid flags
			temp_valid[1] = out_valid_reg[1];
			out_valid_reg[1] <= out_valid_reg[0];
			out_valid_reg[0] <= temp_valid[1];
		end
		else if (is_present_2) begin
			// Sort out reg
			temp[2] = out_reg[2];
			out_reg[2] <= out_reg[1];
			out_reg[1] <= out_reg[0];
			out_reg[0] <= temp[2];
			// Also sort the correspond valid flags
			temp_valid[2] = out_valid_reg[2];
			out_valid_reg[2] <= out_valid_reg[1];
			out_valid_reg[1] <= out_valid_reg[0];
			out_valid_reg[0] <= temp_valid[2];
		end
		else if (is_present_3) begin
			// Sort out reg
			temp[3] = out_reg[3];				
			out_reg[3] <= out_reg[2];
			out_reg[2] <= out_reg[1];
			out_reg[1] <= out_reg[0];
			out_reg[0] <= temp[3];
			// Also sort the correspond valid flags
			temp_valid[3]   = out_valid_reg[3];
			out_valid_reg[3]  <= out_valid_reg[2];
			out_valid_reg[2]  <= out_valid_reg[1];
			out_valid_reg[1]  <= out_valid_reg[0];
			out_valid_reg[0]  <= temp_valid[3];
		end
		else begin	// if data_in not in out subsequence
			// Also new number and shift reg
			out_reg[3] <= out_reg[2];
			out_reg[2] <= out_reg[1];
			out_reg[1] <= out_reg[0];
			out_reg[0] <= data_in;
			// Also add valid flag and shift reg
			out_valid_reg[3] <= out_valid_reg[2];
			out_valid_reg[2] <= out_valid_reg[1];
			out_valid_reg[1] <= out_valid_reg[0];
			out_valid_reg[0] <= 1'b1;		
		end
	end
end

// According to the task outputs must be updated on the second clock
always @(posedge clk_in) begin
	if (reset_in) begin
		out_0 <= 0; out_valid_0 <= 0;
		out_1 <= 0; out_valid_1 <= 0;
		out_2 <= 0; out_valid_2 <= 0;
		out_3 <= 0; out_valid_3 <= 0;
	end
	else begin
		out_0 <= out_reg[0]; out_valid_0 <= out_valid_reg[0];
		out_1 <= out_reg[1]; out_valid_1 <= out_valid_reg[1];
		out_2 <= out_reg[2]; out_valid_2 <= out_valid_reg[2];
		out_3 <= out_reg[3]; out_valid_3 <= out_valid_reg[3];
	end
end

endmodule
