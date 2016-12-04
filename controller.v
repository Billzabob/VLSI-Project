module controller (
	clk
);

//-------------Input Ports-----------------------------
input clk;

//-------------Output Ports----------------------------
output [9:0] second_timer;

//-------------Input ports Data Type------------------- 
wire clk;

//-------------Output Ports Data Type------------------
reg [9:0] second_timer;
reg [6:0] master_timer;
reg       active_street; // 0 means the active street is the straight street
                         // 1 means the active street is the cross street

//-------------Modules---------------------------------

//-------------Pedestrian Lights
pedestrian_light straight_steet_pedestrian_light(
);

pedestrian_light cross_steet_pedestrian_light(
);

//-------------Pedestrian buttons
pedestrian_button straight_steet_pedestrian_button(
);

pedestrian_button cross_street_pedestrian_button(
);

//-------------Car Sensors
car_sensor straight_street_straight_lane_car_sensor(
);

car_sensor straight_street_turn_lane_car_sensor(
);

car_sensor cross_street_straight_lane_car_sensor(
);

car_sensor cross_street_turn_lane_car_sensor(
);

//-------------Traffic Lights
traffic_light straight_street_straight_lane_traffic_light(
);

traffic_light straight_street_turn_lane_traffic_light(
);

traffic_light cross_street_straight_lane_traffic_light(
);

traffic_light cross_street_turn_lane_traffic_light(
);

//-------------FSM-------------------------------------

always @ (master_timer) begin
	case(state)
		// State 1 and state 3 will both be 120 seconds
		1:
		3:

		// State 2 and state 4 will both be 60 seconds
		2:
		4:

		default:

end

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
		2:
			// straight street straight lanes are red
			// straight street turn lanes are green
			// straight street pedestrian crossings are off
			//
			// cross street straight lanes are red
			// cross street turn lanes are red
			// cross street pedestrian crossings are off
		3:
			// straight street straight lanes are red
			// straight street turn lanes are red
			// straight street pedestrian crossings are off
			//
			// cross street straight lanes are green
			// cross street turn lanes are red
			// cross street pedestrian crossings are on
		4:
			// straight street straight lanes are red
			// straight street turn lanes are red
			// straight street pedestrian crossings are off
			//
			// cross street straight lanes are red
			// cross street turn lanes are green
			// cross street pedestrian crossings are off
		default:
			// straight street straight lanes are red
			// straight street turn lanes are red
			// straight street pedestrian crossings are off
			//
			// cross street straight lanes are red
			// cross street turn lanes are red
			// cross street pedestrian crossings are off
	endcase
end

//------------Clock/Timing-------------------------

// We are assuming a 1kHz Clock
always @ (posedge clock) begin
	if(second_timer >= 1000) begin
		second_timer <= 0;
		master_timer <= master_timer + 1;
	else begin
		second_timer <= second_timer + 1;
		master_time <= master_timer;
	end
end

endmodule
