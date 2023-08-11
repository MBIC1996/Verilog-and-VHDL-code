
`timescale 1 ps / 1 ps

module debounce_tb();



reg clk; 
reg unbounced_in;
wire debounced_out;

initial begin
clk <= 1'b0;

unbounced_in <= 1'b0;
#10 
unbounced_in <= 1'b1;
#100
unbounced_in <= 1'b0;
#100 
unbounced_in <= 1'b1;

end 


always begin
#10
clk <= ~clk;
end 



debounce inst1 (.bouncy(unbounced_in), .clk(clk), .debounced(debounced_out));

endmodule




