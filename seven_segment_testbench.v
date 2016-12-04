`include "seven_segment.v"
module seven_segment_testbench();

reg  [4:0] number;
wire [6:0] tens_digit;
wire [6:0] ones_digit;

seven_segment seven_segment1 (
	.number(number),
	.tens_digit(tens_digit),
	.ones_digit(ones_digit)
);

// Initialize all variables
initial begin
	$display("----Starting seven segment test bench----");
	$monitor("Number: %d, Tens: %b, Ones: %b", number, tens_digit, ones_digit);
	number = 0;
end

always begin
	#5
  	number = number + 1;
	if(number > 30)
		$finish;
end

endmodule

