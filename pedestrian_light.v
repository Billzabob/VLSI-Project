`include "seven_segment.v"
module pedestrian_light (
	enable,
	master_timer,
	tens_digit,
	ones_digit,
	hand_light,
	walk_light
);

//-------------Input Ports-----------------------------
input       enable;
input [6:0] master_timer;

//-------------Output Ports----------------------------
output [6:0] tens_digit;
output [6:0] ones_digit;
output       hand_light;
output       walk_light;

//-------------Input ports Data Type------------------- 
wire       enable;
wire [6:0] master_timer;

//-------------Output Ports Data Type------------------
reg [6:0] tens_digit;
reg [6:0] ones_digit;
reg       hand_light;
reg       walk_light;

//-------------Internal Wires and Regs-----------------
reg  [4:0] number;
wire [6:0] tens_digit_output;
wire [6:0] ones_digit_output;

seven_segment seven_segment0 (
	.number(master_timer [4:0]),
	.tens_digit(tens_digit_output),
	.ones_digit(ones_digit_output)
);

//------------Code Starts Here-------------------------
assign tens_digit = (master_timer > 7'd30) ? 7'b0000000 : tens_digit_output;
assign ones_digit = (master_timer > 7'd30) ? 7'b0000000 : ones_digit_output;
assign hand_light = (enable == 1'b1)       ? 1'b0       : 1'b1;
assign walk_light = (enable == 1'b1)       ? 1'b1       : 1'b0;

endmodule

