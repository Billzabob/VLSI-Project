module seven_segment (
	number,
	tens_digit,
	ones_digit
);

//-------------Input Ports-----------------------------
input [4:0] number;

//-------------Output Ports----------------------------
output [6:0] tens_digit;
output [6:0] ones_digit;

//-------------Input ports Data Type------------------- 
wire [4:0] number;

//-------------Output Ports Data Type------------------
reg [6:0] tens_digit;
reg [6:0] ones_digit;

//-------------Internal Wires and Regs-----------------
reg [3:0] ones_value;

//------------Code Starts Here-------------------------
always @ (number) begin
	if (number < 5'd10) begin
	    tens_digit <= 7'b0000000;
	    ones_value <= number;
    end else if (number < 5'd20) begin
		tens_digit <= 7'b0110000;
	    ones_value <= number - 5'd10;
    end else if (number < 5'd30) begin
		tens_digit <= 7'b1101101;
	    ones_value <= number - 5'd20;
	end else begin
		tens_digit <= 7'b1111001;
	    ones_value <= 4'd0;
	end
end

always @ (ones_value) begin
	case(ones_value)
		4'd0 : ones_digit <= 7'b1111110;
		4'd1 : ones_digit <= 7'b0110000;
		4'd2 : ones_digit <= 7'b1101101;
		4'd3 : ones_digit <= 7'b1111001;
		4'd4 : ones_digit <= 7'b0110011;
		4'd5 : ones_digit <= 7'b1011011;
		4'd6 : ones_digit <= 7'b1011111;
		4'd7 : ones_digit <= 7'b1110000;
		4'd8 : ones_digit <= 7'b1111111;
		4'd9 : ones_digit <= 7'b1110011;
	endcase
end

endmodule

