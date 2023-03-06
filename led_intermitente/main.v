`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2023 11:41:57
// Design Name: 
// Module Name: main
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module main(
//entradas
    input wire clk,
    input  [7:0] sw,
//salidas 
    output [7:0] led
    
    );

localparam div_value = 49999999;
integer counter_value = 0;



reg  [8-1 :0] count = 7'b00000000;
always @(posedge clk)
begin
    if(counter_value == div_value)
        counter_value <= 0; //reset value 
    else
        counter_value <= counter_value+1; // count up
end

always@(posedge clk)
begin
    if(counter_value == div_value)
        count <= ~count; // flip the signal
    else
        count <= count;
end

assign led = count;
endmodule
