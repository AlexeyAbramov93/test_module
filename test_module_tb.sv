`timescale 1 ns/ 10 ps
module test_module_tb;

	parameter DATA_W = 8;

	logic clk_in;
	logic reset_in;
	logic [DATA_W-1:0] data_in;

	logic [DATA_W-1:0] out_0;
	logic              out_valid_0;
	logic [DATA_W-1:0] out_1;
	logic              out_valid_1;
	logic [DATA_W-1:0] out_2;
	logic              out_valid_2;
	logic [DATA_W-1:0] out_3;
	logic              out_valid_3;

	test_module #(.DATA_W(DATA_W)) test_module_inst (
    .clk_in(clk_in),
    .reset_in(reset_in),
    .data_in(data_in),
    .out_0(out_0),
    .out_valid_0(out_valid_0),
    .out_1(out_1),
    .out_valid_1(out_valid_1),
    .out_2(out_2),
    .out_valid_2(out_valid_2),
    .out_3(out_3),
    .out_valid_3(out_valid_3)
  );
  
	initial begin
		clk_in = 0;
		forever #5 clk_in = ~clk_in;
	end


	initial begin
		reset_in = 1;
		data_in  = 0;
		#20;
		reset_in = 0;
		/*	
				data_in = 8'd1;
		#10	data_in = 8'd2;
		#10	data_in = 8'd1;
		#10	data_in = 8'd2;
		#10	data_in = 8'd1;
		#10	data_in = 8'd2;
		#10	data_in = 8'd1;
		*/
                     
				data_in = 8'd1;
		#10	data_in = 8'd2;
		#10	data_in = 8'd3;
		#10	data_in = 8'd4;
		#10	data_in = 8'd3;
		#10	data_in = 8'd2;
		#10	data_in = 8'd3;
		#10	data_in = 8'd4;
		#10	data_in = 8'd3;
		#10	data_in = 8'd4;

		#100	$stop;
	end

endmodule
