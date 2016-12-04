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
	straight_street_straight_lane_red_light
	straight_street_turn_lane_green_light,
	straight_street_turn_lane_yellow_light,
	straight_street_turn_lane_red_light
	cross_street_straight_lane_green_light,
	cross_street_straight_lane_yellow_light,
	cross_street_straight_lane_red_light
	cross_street_turn_lane_green_light,
	cross_street_turn_lane_yellow_light,
	cross_street_turn_lane_red_light
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

//-------------Output Ports----------------------------
output [9:0] seconds_timer;

// Individual traffic light outputs
output       straight_street_straight_lane_green_light,
output       straight_street_straight_lane_yellow_light,
output       straight_street_straight_lane_red_light
output       straight_street_turn_lane_green_light,
output       straight_street_turn_lane_yellow_light,
output       straight_street_turn_lane_red_light
output       cross_street_straight_lane_green_light,
output       cross_street_straight_lane_yellow_light,
output       cross_street_straight_lane_red_light
output       cross_street_turn_lane_green_light,
output       cross_street_turn_lane_yellow_light,
output       cross_street_turn_lane_red_light

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

//-------------Output Ports Data Type------------------
reg [9:0] seconds_timer;

// Individual traffic light outputs
reg       straight_street_straight_lane_green_light,
reg       straight_street_straight_lane_yellow_light,
reg       straight_street_straight_lane_red_light
reg       straight_street_turn_lane_green_light,
reg       straight_street_turn_lane_yellow_light,
reg       straight_street_turn_lane_red_light
reg       cross_street_straight_lane_green_light,
reg       cross_street_straight_lane_yellow_light,
reg       cross_street_straight_lane_red_light
reg       cross_street_turn_lane_green_light,
reg       cross_street_turn_lane_yellow_light,
reg       cross_street_turn_lane_red_light

//-------------Registers-------------------------------
reg [6:0] master_timer;
reg       straight_street_straight_lane_enable;
reg       straight_street_turn_lane_enable;
reg       cross_street_straight_lane_enable;
reg       cross_street_turn_lane_enable;
reg       straight_street_pedestrian_light_enable;
reg       cross_street_pedestrian_light_enable;

//-------------Modules---------------------------------

// Pedestrian Lights
pedestrian_light straight_steet_pedestrian_light(
	.enable(straight_street_pedestrian_light_enable),
);

pedestrian_light cross_steet_pedestrian_light(
	.enable(cross_street_pedestrian_light_enable),
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
		1: 
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
		2:
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
		3:
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
		4:
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
		default:
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
	endcase
end

//------------Clock/Timing-------------------------

// We are assuming a 1kHz Clock if the clock is anything other than 1kHz
// then the seconds_timer comparison below will need to be updated to 
// whatever the clock rate is.
always @ (posedge clock) begin
	if(seconds_timer >= 1000) begin
		seconds_timer <= 0;
		master_timer <= master_timer + 1;

		if((state == 1) && (master_timer == 120)) begin
			state <= 2;
			master_timer <= 0;
		end

		if(state == 2) && (master_timer == 60)) begin
			state <= 3;
			master_timer <= 0;
		end

		if(state == 3) && (master_timer == 120)) begin
			state <= 4;
			master_timer <= 0;
		end

		if(state == 4) && (master_timer == 60)) begin
			state <= 1;
			master_timer <= 0;
		end

	else begin
		seconds_timer <= seconds_timer + 1;
		master_time <= master_timer;
	end
end

endmodule
