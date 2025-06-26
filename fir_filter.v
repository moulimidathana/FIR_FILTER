`timescale 1ns / 1ps
module fir_filter(input clk,//clock input
input rst, //reset
input [7:0]x_in, //8-bit input
output reg [7:0]y_out //8-bit output
);
parameter TAP_COUNT =4; //no.of filter taps
parameter COEFF_WIDTH =8;//coefficient width
parameter DATA_WIDTH=8; //data width
reg[COEFF_WIDTH-1:0]coeff[0:TAP_COUNT-1];
initial begin
coeff[0]=8'd17;
coeff[1]=8'd13;
coeff[2]=8'd47;
coeff[3]=8'd48;
end
reg[DATA_WIDTH-1:0]x[0:TAP_COUNT-1];//shift registers for input samples
integer i;
reg [17:0]mult[0:TAP_COUNT-1];//multiplication results
reg[17:0]sum;
always@(posedge clk or negedge rst)
begin
if(!rst)begin
for(i=0;i<TAP_COUNT;i=i+1)begin
x[i]<=0;
end
end
else begin
x[0]<=x_in;
for(i=1;i<TAP_COUNT;i=i+1)
begin
x[i]<=x[i-1]; //shifting of previous samples
end
end
end

always@(posedge clk or negedge rst) //fir computation
begin
if(!rst)
begin
y_out<=0;
sum<=0;
end
else
begin
sum=0;
for(i=0;i<TAP_COUNT-1;i=i+1)begin
mult[i]=x[i]*coeff[i]; //multilpication of input with coefficients
sum=sum+mult[i];
end
y_out<=sum[15:8]; //output
end
end
endmodule






