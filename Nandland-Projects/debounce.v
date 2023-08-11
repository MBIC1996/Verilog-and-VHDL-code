module debounce(

input bouncy,clk,
output debounced

);

reg [19:0] count = 20'b0;
reg temp = 1'b0;
reg [19:0] maxcount = 20'd1000000;

always @(posedge clk) begin
    if (temp != bouncy) begin
        if(count == maxcount) begin
            temp <= bouncy;
            count <= 20'b0;
        end
        else begin
           count <= count + 1'b1;
           temp <= temp; 
        end
    end 

    else begin
        count <= 20'b0;
        temp <= temp;
    end
end

assign debounced = temp;
endmodule

    
    