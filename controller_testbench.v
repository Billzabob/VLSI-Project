`include "controller.v"
module controller_testbench();

reg   clk;
reg straight_street_pedestrian_button;
reg cross_street_pedestrian_button;
reg straight_street_straight_lane_car_sensor;
reg straight_street_turn_lane_car_sensor;
reg cross_street_straight_lane_car_sensor;
reg cross_street_turn_lane_car_sensor;
wire straight_street_straight_lane_green_light;
wire straight_street_straight_lane_yellow_light;
wire straight_street_straight_lane_red_light;
wire straight_street_turn_lane_green_light;
wire straight_street_turn_lane_yellow_light;
wire straight_street_turn_lane_red_ligh;
wire cross_street_straight_lane_green_light;
wire cross_street_straight_lane_yellow_light;
wire cross_street_straight_lane_red_light;
wire cross_street_turn_lane_green_light;
wire cross_street_turn_lane_yellow_light;
wire cross_street_turn_lane_red_light;
wire straight_street_hand_light;
wire cross_street_hand_light;
wire straight_street_walk_light;
wire cross_street_walk_light;
wire [6:0] straight_street_tens_digit;
wire [6:0] straight_street_ones_digit;
wire [6:0] cross_street_tens_digit;
wire [6:0] cross_street_ones_digit;

controller controller0 (
	clk,
	straight_street_pedestrian_button,
	cross_street_pedestrian_button,
	straight_street_straight_lane_car_sensor,
	straight_street_turn_lane_car_sensor,
	cross_street_straight_lane_car_sensor,
	cross_street_turn_lane_car_sensor,
	straight_street_straight_lane_green_light,
	straight_street_straight_lane_yellow_light,
	straight_street_straight_lane_red_light,
	straight_street_turn_lane_green_light,
	straight_street_turn_lane_yellow_light,
	straight_street_turn_lane_red_light,
	cross_street_straight_lane_green_light,
	cross_street_straight_lane_yellow_light,
	cross_street_straight_lane_red_light,
	cross_street_turn_lane_green_light,
	cross_street_turn_lane_yellow_light,
	cross_street_turn_lane_red_light,
	straight_street_hand_light,
	cross_street_hand_light,
	straight_street_walk_light,
	cross_street_walk_light,
	straight_street_tens_digit,
	straight_street_ones_digit,
	cross_street_tens_digit,
	cross_street_ones_digit
);

// Initialize all variables
initial begin        
	$display ("----Starting controller test bench----");	
	$monitor ("Main street straight lane lights: G: %b, Y: %b, R: %b\nMain street turn lane lights: G: %b, Y: %b, R: %b\nCross street straight lane lights: G: %b, Y: %b, R: %b\nCross street turn lane lights: G: %b, Y: %b, R: %b\nMain street hand light: %b\nMain street walk light: %b\nMain street tens digit: %b\nMain street ones digit: %b\nCross street hand light: %b\nCross street walk light: %b\nCross street tens digit: %b\nCross street ones digit: %b\n-----------------------------------------------------------------\n",
	straight_street_straight_lane_green_light,
	straight_street_straight_lane_yellow_light,
	straight_street_straight_lane_red_light,
	straight_street_turn_lane_green_light,
	straight_street_turn_lane_yellow_light,
	straight_street_turn_lane_red_light,
	cross_street_straight_lane_green_light,
	cross_street_straight_lane_yellow_light,
	cross_street_straight_lane_red_light,
	cross_street_turn_lane_green_light,
	cross_street_turn_lane_yellow_light,
	cross_street_turn_lane_red_light,
	straight_street_hand_light,
	straight_street_walk_light,
	straight_street_tens_digit,
	straight_street_ones_digit,
	cross_street_hand_light,
	cross_street_walk_light,
	cross_street_tens_digit,
	cross_street_ones_digit,
	);	
	straight_street_pedestrian_button = 0;
	cross_street_pedestrian_button = 0;
	straight_street_straight_lane_car_sensor = 0;
	straight_street_turn_lane_car_sensor = 0;
	cross_street_straight_lane_car_sensor = 0;
	cross_street_turn_lane_car_sensor = 0;
	clk = 0;
	#1600000
	$finish;
end

// Clock generator
always begin
	#1
	clk = ~clk;
end

endmodule

