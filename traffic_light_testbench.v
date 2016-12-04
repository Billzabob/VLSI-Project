`include "traffic_light.v"
module traffic_light_tb();

reg       enable;
reg [6:0] master_timer;
reg       green_light;
reg       yellow_light;
reg       red_light;

// Initialize all variables
initial begin        
	master_timer = 120; // start the timer at 120 seconds
	enable = 0;                // initial value of enable

	$display("----Starting traffic light test bench----");

	#10
	// master_timer is at 111

	// The traffic light is not enabled so the light should be red
	if(!(!green_light && !yellow_light && red_light)) begin
		$display("Only the red light should be on when the light is disabled");
	end else begin
		$display("Disabled passed");
	end

	enable = 1;

	#1
	// master_timer is at 110

	// The traffic light should be green when enabled and the master_timer
	// is in the green range (120 ... 15)
	if(!(green_light && !yellow_light && !red_light)) begin
		$display("Green Light: %b, Yellow Light: %b, Red Light: %b", green_light, yellow_light, red_light);
		$display("Master Timer: %d", master_timer);
		$display("Only the green light should be on when the light is in the green range.");
	end else begin
		$display("Green light passed");
	end

	#100
	// master_timer is at 10

	// The traffic light should be yellow when enabled and the master_timer
	// is in the yellow range (15 ... 0)
	if(!(!green_light && yellow_light && !red_light)) begin
		$display("Green Light: %b, Yellow Light: %b, Red Light: %b", green_light, yellow_light, red_light);
		$display("Master Timer: %d", master_timer);
		$display("Only the yellow light should be on when the light is in the yellow range.");
	end else begin
		$display("Yellow light passed");
	end

	#10
	// master_timer is at 0

	// The traffic light should be red when the master timer is at 0
	if(!(!green_light && !yellow_light && red_light)) begin
		$display("Green Light: %b, Yellow Light: %b, Red Light: %b", green_light, yellow_light, red_light);
		$display("Master Timer: %d", master_timer);
		$display("Only the red light should be on when the light is in the red range.");
	end else begin
		$display("Red light passed");
	end

	$display("----End traffic light test bench----");

	$finish;      // Terminate simulation
end

// Clock generator
always begin
	#1

	if(master_timer > 0) begin
		master_timer = master_timer - 1;
	end

	master_timer = master_timer;
end

// Connect DUT to test bench
traffic_light traffic_light_dut(
	.enable(enable),
	.master_timer(master_timer),
	.green_light(green_light),
	.yellow_light(yellow_light),
	.red_light(red_light)
);

endmodule
