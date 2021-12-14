module test_module #( 
             parameter DATA_W = 8 
)(
             input							clk_in, 
             input							reset_in, 
             input		[(DATA_W-1):0]	data_in, 

             output reg	[(DATA_W-1):0]	out_0, 
             output reg						out_valid_0, 
             output reg	[(DATA_W-1):0]	out_1, 
             output reg						out_valid_1, 
             output reg	[(DATA_W-1):0]	out_2, 
             output reg						out_valid_2, 
             output reg	[(DATA_W-1):0]	out_3, 
             output reg						out_valid_3 
); 

reg	[(DATA_W-1):0]	temp;

always @(posedge clk_in) begin
	if(reset_in) begin
		out_valid_0 <= 0;
		out_valid_1 <= 0;
		out_valid_2 <= 0;
		out_valid_3 <= 0;
		out_0 <= 0;
		out_1	<= 0;
		out_2 <= 0;
		out_3	<= 0;
		temp <= 0;
	end
	else begin
		temp <= data_in;		
	
		case (temp)		
			out_0	:		begin
									out_0 <= temp;
									out_1 <= out_1;
									out_2 <= out_2;
									out_3 <= out_3;
							end
			out_1	:		begin
									out_0 <= temp;
									out_1 <= out_0;
									out_2 <= out_2;
									out_3 <= out_3;
							end
			out_2	:		begin
									out_0 <= temp;
									out_1 <= out_0;
									out_2 <= out_1;
									out_3 <= out_3;
							end
			out_3	:		begin
									out_0 <= temp;
									out_1 <= out_0;
									out_2 <= out_1;
									out_3 <= out_2;
							end
        
			default	:	begin	
									out_0 <= temp;
									out_1 <= out_0;
									out_2 <= out_1;
									out_3 <= out_2;

									out_valid_0 <= 1'b1;
									out_valid_1 <= out_valid_0;
									out_valid_2 <= out_valid_1;
									out_valid_3 <= out_valid_2;
							end
		endcase
	end
end

endmodule
	


