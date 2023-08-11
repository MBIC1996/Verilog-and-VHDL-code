`timescale 1 ns / 1 ps

module bin_to_7_tb();

reg [3:0] bin_input;
wire [7:0] s7out;

integer i;

initial begin
for (i = 0; i <15; i = i + 1) begin
#10
bin_input <= i ;

end
end 
bin_to_7 DUT (.hexin(bin_input), .s7out(s7out));

endmodule
