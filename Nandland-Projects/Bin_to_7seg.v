module bin_to_7(
    input [3:0] hexin,
    output [7:0] s7out
);
reg [7:0] temp;
always @(*)begin
case (hexin)
    4'b0000 : temp <= 8'b00111111; // 0
    4'b0001 : temp <= 8'b00000110; // 1
    4'b0010 : temp <= 8'b01011011; // 2
    4'b0011 : temp <= 8'b01001111; // 3
    4'b0100 : temp <= 8'b01100110; // 4
    4'b0101 : temp <= 8'b01101101; // 5
    4'b0110 : temp <= 8'b01111101; // 6
    4'b0111 : temp <= 8'b00000111; // 7
    4'b1000 : temp <= 8'b01111111; // 8
    4'b1001 : temp <= 8'b01101111; // 9
    4'b1010 : temp <= 8'b01110111; // A
    4'b1011 : temp <= 8'b01111100; // b
    4'b1100 : temp <= 8'b00111001; // C
    4'b1101 : temp <= 8'b01011110; // d
    4'b1110 : temp <= 8'b01111001; // E
    4'b1111 : temp <= 8'b01110001; // F
    default : temp <= 8'b00000000; // default to blank 
endcase
end 

assign s7out = ~temp;

endmodule 
