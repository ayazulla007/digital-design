module arbiter (clock, reset, in_0, in_1, out_0, out_1);
input clock, reset, in_0, in_1;
output out_0, out_1;
reg out_0, out_1;
always@(posedge clock or posedge reset)
if (reset) begin
out_0 <= 0;
out_1 <= 0;
end 
else if(in_0) begin
out_0 <=1;
out_1 <=0;
end
else if(in_1) begin
out_0 <=0;
out_1 <=1;
end
endmodule

module arbiter_tb();
reg clock, reset, in0, in1;
wire out0, out1;
initial begin
$monitor("in0=%b, in1=%b, out0=%b, out=%b", in0, in1, out0, out1);
clock=0;
reset=0;
in0=0;
in1=0;
#5 reset=1;
#15 reset=0;
#10 in0=1;
#10 in0=0;
#10 in1=1;
#10 in1=0; 
#10 {in0,in1}=2'b11;
#10 {in0, in1}=2'b00;
#10 $finish;
end

always begin
#5 clock = !clock;
end

arbiter U0(.clock (clock), .reset(reset), .in_0(in0), .in_1(in1), .out_0(out0), .out_1(out1));
endmodule




