module first_counter (
	clock,
	reset,
	enable
	counter_out
);

//-------------Input Ports-----------------------------
input clock;
input reset;
input enable;

//-------------Output Ports----------------------------
output [3:0] counter_out;

//-------------Input ports Data Type------------------- 
wire clock ;
wire reset ;
wire enable ;

//-------------Output Ports Data Type------------------
reg [3:0] counter_out ;

//------------Code Starts Here-------------------------
always @ (posedge clock) begin
 	if (reset == 1'b1) begin
 		counter_out <=  #1  4'b0000;
 	end else if (enable == 1'b1) begin
		counter_out <=  #1  counter_out + 1;
	end
end

endmodule