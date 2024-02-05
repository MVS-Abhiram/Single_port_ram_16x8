`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2023 11:56:54
// Design Name: 
// Module Name: single_port_ram_16x8_tb
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


module single_port_ram_16x8_tb();
reg write_en,read_en;
reg [3:0]addr;
reg [7:0] temp;
wire [7:0]data;
// Module Instantiation
single_port_ram_16x8 uut (write_en,read_en,addr,data);
// Defining the output for writing 
assign data = (write_en && !read_en) ? temp : 8'bz;
integer a;
// Task for initialize
task initializie();
begin
    {addr,write_en, read_en, temp} = 14'd0;
end
endtask
// Task for giving the stimulus
task stimulus(input [3:0]i, input [7:0]j);
begin
    addr = i;
    temp = j;    
end
endtask
// Task for writing
task write();
begin
    write_en =1'b1;
    read_en = 1'b0;
end
endtask
// Task for reading
task read();
begin
    write_en =1'b0;
    read_en = 1'b1;
end
endtask
// Applying Inputs
initial begin
    initializie();
    write();
    for(a=0;a<16;a=a+1)
    begin
        stimulus(a,a);
        #10;
    end
    initializie();
    read();
    for(a=0;a<16;a=a+1)
    begin
        addr = a;
        #10;
    end
end
endmodule
