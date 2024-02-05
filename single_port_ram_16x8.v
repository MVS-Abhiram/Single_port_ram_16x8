`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2023 11:31:03
// Design Name: 
// Module Name: single_port_ram_16x8
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


module single_port_ram_16x8(write_en,read_en,addr,data);
input write_en,read_en;
input [3:0]addr;
inout [7:0]data;
// Memory declerations
reg [7:0] mem [15:0];
// Writing data into the memory
always@(*)
begin
    if(write_en && !read_en)
        mem[addr] = data;
end
// reading data from memory
assign data = (read_en && !write_en) ? mem[addr] : 8'bz;
endmodule
