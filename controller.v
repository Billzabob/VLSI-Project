`timescale 1ms/1ps
`include "pedestrian_light.v"
`include "traffic_light.v"

//-------------States----------------------------------
`define STRAIGHT_STREET_STRAIGHT_LANE 0
`define STRAIGHT_STREET_TURN_LANE 1
`define CROSS_STREET_STRAIGHT_LANE 2
`define CROSS_STREET_TURN_LANE 3

module controller (
	clk,
	
// Pedestrian buttons inputs
	straight_street_pedestrian_button,
	cross_street_pedestrian_button,

// Car Sensors inputs
	straight_street_straight_lane_car_sensor,
	straight_street_turn_lane_car_sensor,
	cross_street_straight_lane_car_sensor,
	cross_street_turn_lane_car_sensor,

// Individual traffic light outputs
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

//-------------Input Ports-----------------------------
input clk;

// Pedestrian buttons
input straight_street_pedestrian_button;
input cross_street_pedestrian_button;

// Car Sensors
input straight_street_straight_lane_car_sensor;
input straight_street_turn_lane_car_sensor;
input cross_street_straight_lane_car_sensor;
input cross_street_turn_lane_car_sensor;

// Individual traffic light outputs
output       straight_street_straight_lane_green_light;
output       straight_street_straight_lane_yellow_light;
output       straight_street_straight_lane_red_light;
output       straight_street_turn_lane_green_light;
output       straight_street_turn_lane_yellow_light;
output       straight_street_turn_lane_red_light;
output       cross_street_straight_lane_green_light;
output       cross_street_straight_lane_yellow_light;
output       cross_street_straight_lane_red_light;
output       cross_street_turn_lane_green_light;
output       cross_street_turn_lane_yellow_light;
output       cross_street_turn_lane_red_light;
output       straight_street_hand_light;
output       cross_street_hand_light;
output       straight_street_walk_light;
output       cross_street_walk_light;
output [6:0] straight_street_tens_digit;
output [6:0] straight_street_ones_digit;
output [6:0] cross_street_tens_digit;
output [6:0] cross_street_ones_digit;

//-------------Input ports Data Type------------------- 
wire clk;

// Pedestrian buttons
wire straight_street_pedestrian_button;
wire cross_street_pedestrian_button;

// Car Sensors
wire straight_street_straight_lane_car_sensor;
wire straight_street_turn_lane_car_sensor;
wire cross_street_straight_lane_car_sensor;
wire cross_street_turn_lane_car_sensor;

// Individual traffic light outputs
reg       straight_street_straight_lane_green_light;
reg       straight_street_straight_lane_yellow_light;
reg       straight_street_straight_lane_red_light;
reg       straight_street_turn_lane_green_light;
reg       straight_street_turn_lane_yellow_light;
reg       straight_street_turn_lane_red_light;
reg       cross_street_straight_lane_green_light;
reg       cross_street_straight_lane_yellow_light;
reg       cross_street_straight_lane_red_light;
reg       cross_street_turn_lane_green_light;
reg       cross_street_turn_lane_yellow_light;
reg       cross_street_turn_lane_red_light;
reg       straight_street_hand_light;
reg       cross_street_hand_light;
reg       straight_street_walk_light;
reg       cross_street_walk_light;
reg [6:0] straight_street_tens_digit;
reg [6:0] straight_street_ones_digit;
reg [6:0] cross_street_tens_digit;
reg [6:0] cross_street_ones_digit;

//-------------Registers-------------------------------
reg [9:0] seconds_timer;
reg [6:0] master_timer;
reg [1:0] state;
reg       straight_street_straight_lane_enable;
reg       straight_street_turn_lane_enable;
reg       cross_street_straight_lane_enable;
reg       cross_street_turn_lane_enable;
reg       straight_street_pedestrian_light_enable;
reg       cross_street_pedestrian_light_enable;
reg       master_timer_speed_up;

//-------------Modules---------------------------------

// Pedestrian Lights
pedestrian_light straight_steet_pedestrian_light(
	.enable(straight_street_pedestrian_light_enable),
	.master_timer(master_timer),
	.tens_digit(straight_street_tens_digit),
	.ones_digit(straight_street_ones_digit),
	.hand_light(straight_street_hand_light),
	.walk_light(straight_street_walk_light)
);

pedestrian_light cross_steet_pedestrian_light(
	.enable(cross_street_pedestrian_light_enable),
	.master_timer(master_timer),
	.tens_digit(cross_street_tens_digit),
	.ones_digit(cross_street_ones_digit),
	.hand_light(cross_street_hand_light),
	.walk_light(cross_street_walk_light)
);

// Traffic Lights
traffic_light straight_street_straight_lane_traffic_light(
	straight_street_straight_lane_enable,
	master_timer,
	straight_street_straight_lane_green_light,
	straight_street_straight_lane_yellow_light,
	straight_street_straight_lane_red_light
);

traffic_light straight_street_turn_lane_traffic_light(
	straight_street_turn_lane_enable,
	master_timer,
	straight_street_turn_lane_green_light,
	straight_street_turn_lane_yellow_light,
	straight_street_turn_lane_red_light
);

traffic_light cross_street_straight_lane_traffic_light(
	cross_street_straight_lane_enable,
	master_timer,
	cross_street_straight_lane_green_light,
	cross_street_straight_lane_yellow_light,
	cross_street_straight_lane_red_light
);

traffic_light cross_street_turn_lane_traffic_light(
	cross_street_turn_lane_enable,
	master_timer,
	cross_street_turn_lane_green_light,
	cross_street_turn_lane_yellow_light,
	cross_street_turn_lane_red_light
);

//-------------FSM-------------------------------------

always @ (state) begin
	case(state)
		`STRAIGHT_STREET_STRAIGHT_LANE:
		begin
			// straight street straight lanes are green
			// straight street turn lanes are red
			// straight street pedestrian crossings are on
			//
			// cross street straight lanes are red
			// cross street turn lanes are red
			// cross street pedestrian crossings are off


			// Enable the appropriate traffic light
			straight_street_straight_lane_enable <= 1;
			straight_street_turn_lane_enable <= 0;
			cross_street_straight_lane_enable <= 0;
			cross_street_turn_lane_enable <= 0;

			// Enable the appropriate pedestrian light
			straight_street_pedestrian_light_enable <= 1;
			cross_street_pedestrian_light_enable <= 0;
		end
		`STRAIGHT_STREET_TURN_LANE:
		begin
			// straight street straight lanes are red
			// straight street turn lanes are green
			// straight street pedestrian crossings are off
			//
			// cross street straight lanes are red
			// cross street turn lanes are red
			// cross street pedestrian crossings are off


			// Enable the appropriate traffic light
			straight_street_straight_lane_enable <= 0;
			straight_street_turn_lane_enable <= 1;
			cross_street_straight_lane_enable <= 0;
			cross_street_turn_lane_enable <= 0;

			// Enable the appropriate pedestrian light
			straight_street_pedestrian_light_enable <= 0;
			cross_street_pedestrian_light_enable <= 0;
		end
		`CROSS_STREET_STRAIGHT_LANE:
		begin
			// straight street straight lanes are red
			// straight street turn lanes are red
			// straight street pedestrian crossings are off
			//
			// cross street straight lanes are green
			// cross street turn lanes are red
			// cross street pedestrian crossings are on


			// Enable the appropriate traffic light
			straight_street_straight_lane_enable <= 0;
			straight_street_turn_lane_enable <= 0;
			cross_street_straight_lane_enable <= 1;
			cross_street_turn_lane_enable <= 0;

			// Enable the appropriate pedestrian light
			straight_street_pedestrian_light_enable <= 0;
			cross_street_pedestrian_light_enable <= 1;
		end
		`CROSS_STREET_TURN_LANE:
		begin
			// straight street straight lanes are red
			// straight street turn lanes are red
			// straight street pedestrian crossings are off
			//
			// cross street straight lanes are red
			// cross street turn lanes are green
			// cross street pedestrian crossings are off


			// Enable the appropriate traffic light
			straight_street_straight_lane_enable <= 0;
			straight_street_turn_lane_enable <= 0;
			cross_street_straight_lane_enable <= 0;
			cross_street_turn_lane_enable <= 1;

			// Enable the appropriate pedestrian light
			straight_street_pedestrian_light_enable <= 0;
			cross_street_pedestrian_light_enable <= 0;
		end
		default:
		begin
			// straight street straight lanes are red
			// straight street turn lanes are red
			// straight street pedestrian crossings are off
			//
			// cross street straight lanes are red
			// cross street turn lanes are red
			// cross street pedestrian crossings are off


			// Enable the appropriate traffic light
			straight_street_straight_lane_enable <= 0;
			straight_street_turn_lane_enable <= 0;
			cross_street_straight_lane_enable <= 0;
			cross_street_turn_lane_enable <= 0;
			
			// Enable the appropriate pedestrian light
			straight_street_pedestrian_light_enable <= 0;
			cross_street_pedestrian_light_enable <= 0;
		end
	endcase
end

//------------Clock/Timing-------------------------

// We are assuming a 1kHz Clock if the clock is anything other than 1kHz
// then the seconds_timer comparison below will need to be updated to 
// whatever the clock rate is.

always @ (posedge clk, posedge master_timer_speed_up) begin
	if(master_timer_speed_up == 1) begin
		seconds_timer <= 0;
		master_timer <= 30;
		state <= state;
	end
	else if(seconds_timer >= 1000) begin
		seconds_timer <= 0;
		master_timer <= master_timer - 1;

		if((state == `STRAIGHT_STREET_STRAIGHT_LANE) && (master_timer == 0)) begin
			state <= `STRAIGHT_STREET_TURN_LANE;
			master_timer <= 60;
		end

		if((state == `STRAIGHT_STREET_TURN_LANE) && (master_timer == 0)) begin
			state <= `CROSS_STREET_STRAIGHT_LANE;
			master_timer <= 120;
		end

		if((state == `CROSS_STREET_STRAIGHT_LANE) && (master_timer == 0)) begin
			state <= `CROSS_STREET_TURN_LANE;
			master_timer <= 60;
		end

		if((state == `CROSS_STREET_TURN_LANE) && (master_timer == 0)) begin
			state <= `STRAIGHT_STREET_STRAIGHT_LANE;
			master_timer <= 120;
		end
	end
	else begin
		seconds_timer <= seconds_timer + 1;
		master_timer <= master_timer;
		state <= state;
	end
end

always @ (straight_street_pedestrian_button, cross_street_pedestrian_button, straight_street_straight_lane_car_sensor,
	straight_street_turn_lane_car_sensor, cross_street_straight_lane_car_sensor, cross_street_turn_lane_car_sensor,
	state, master_timer) begin
	if(straight_street_pedestrian_button == 1 && master_timer > 30 && state != `STRAIGHT_STREET_STRAIGHT_LANE) begin
		master_timer_speed_up <= 1;
	end
	else if(cross_street_pedestrian_button == 1 && master_timer > 30 && state != `CROSS_STREET_STRAIGHT_LANE) begin
		master_timer_speed_up <= 1;
	end
	else if(straight_street_straight_lane_car_sensor == 1 && master_timer > 30 && state != `STRAIGHT_STREET_STRAIGHT_LANE) begin
		master_timer_speed_up <= 1;
	end
	else if(straight_street_turn_lane_car_sensor == 1 && master_timer > 30 && state != `STRAIGHT_STREET_TURN_LANE) begin
		master_timer_speed_up <= 1;
	end
	else if(cross_street_straight_lane_car_sensor == 1 && master_timer > 30 && state != `CROSS_STREET_STRAIGHT_LANE) begin
		master_timer_speed_up <= 1;
	end
	else if(cross_street_turn_lane_car_sensor == 1 && master_timer > 30 && state != `CROSS_STREET_TURN_LANE) begin
		master_timer_speed_up <= 1;
	end
	else begin
		master_timer_speed_up <= 0;
	end
end

endmodule
