`timescale 1ns / 1ps
module fir_filter_tb;
reg clk;
reg rst;
reg [7:0]x_in;
wire [7:0]y_out;
fir_filter uut(.clk(clk),.rst(rst),.x_in(x_in),.y_out(y_out));

initial begin //clock generation
clk=0;
forever #5 clk=~clk;
end

initial begin
rst=0;
x_in=0;
#20;
rst=1;

//step input
x_in=8'd100;
#40;
x_in=8'd0;
#40;

//impulse input
x_in=8'd255;#10;
x_in=8'd0;#50;

//sinusoidal like input
x_in=8'd50;#10;
x_in=8'd100;#10;
x_in=8'd50;#10;
x_in=8'd0;#10;
x_in=8'd0;#40;
$stop;
end
initial begin
$monitor("time=%0d,reset=%b,x_in=%d,y_out=%d",$time,rst,x_in,y_out);
end
endmodule
