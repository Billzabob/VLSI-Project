module traffic_light(
	enable,
	master_timer,
	green_light,
	yellow_light,
	red_light
);

//-------------Input Ports-----------------------------
input enable;
input [6:0] master_timer;

//-------------Output Ports----------------------------
output green_light;
output yellow_light;
output red_light;

//-------------Input ports Data Type------------------- 
reg [6:0] master_timer;
wire      enable;

//-------------Output Ports Data Type------------------
reg green_light;
reg yellow_light;
reg red_light;

//------------Output Statments-------------------------
always @ (enable or master_timer) begin
	// If a traffic light is not enabled then it is red
	if(!enable) begin
		green_light  <= 0;
		yellow_light <= 0;
		red_light    <= 1;
	end

	// While the master timer is above 15 seconds it is green
	if(enable && (master_timer >= 15)) begin
		green_light  <= 1;
		yellow_light <= 0;
		red_light    <= 0;
	end

	// While the master timer is between 1 and 15 seconds the
	// light is green
	if(enable && (master_timer > 0) && (master_timer < 15)) begin
		green_light  <= 0;
		yellow_light <= 1;
		red_light    <= 0;
	end

	// While the master time is 0 then the light is red
	if(enable && (master_timer == 0)) begin
		green_light  <= 0;
		yellow_light <= 0;
		red_light    <= 1;
	end
end

endmodule
