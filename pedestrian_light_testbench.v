include "pedestrian_light.v"
module pedestrian_light_testbench();

reg        enable;
reg  [6:0] master_timer;
wire [6:0] tens_digit;
wire [6:0] ones_digit;
wire       hand_light;
wire       walk_light;

pedestrian_light pedestrian_light0 (
	.enable(enable),
	.master_timer(master_timer),
	.tens_digit(tens_digit),
	.ones_digit(ones_digit),
	.hand_light(hand_light),
	.walk_light(walk_light)
);

// Initialize all variables
initial begin        
	$display("----Starting pedestrian light test bench----");
	$monitor("Time left: %d, Tens: %b, Ones: %b, Hand: %b, Walk: %b", master_timer, tens_digit, ones_digit, hand_light, walk_light);
	master_timer = 120;
	enable = 1;
end

// Clock generator
always begin
	#5
	master_timer = master_timer - 1;
	if(master_timer == 127)
		$finish;
end

endmodule

