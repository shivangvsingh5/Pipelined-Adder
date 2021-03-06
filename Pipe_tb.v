//`timescale 1ns/10ps;

module add();

reg[31:0] a81,b81;
wire[31:0] result_81;
reg clk81, reset_81;
float_add_81 X_81 (.a81(a81),.b81(b81),.result_81(result_81),.clk81(clk81),.reset_81(reset_81));

initial begin                               // CLOCK GENERATOR
clk81 = 0;
forever #5 clk81 = ~clk81;
end



initial
begin

 $monitor ("a81 =%b,   b81 = %b,  result_81 =%b",a81,b81,result_81);       // DISPLAY RESULT IN SIMULATION

clk81 = 0;
reset_81 = 0;
#2;
reset_81 = 1;
#2;
reset_81 = 0;

// 8 DIFFERENT TEST CASES ARE PRESENTED AS BELOW - 


a81 = 32'b01000010110001000000000000000000;	// test case for a81=98 and b81=169
b81 = 32'b01000011001010010000000000000000;
#10;
a81 = 32'b01000010110001100000000000000000;	// test case for a81=99 and b81=-89
b81 = 32'b11000010101100100000000000000000;
#10;  
a81 = 32'b11000010001101000000000000000000;	// test case for a81= -45 and b81=79
b81 = 32'b01000010100111100000000000000000;
#10; 
a81 = 32'b11000011100011011000000000000000;	// test case for a81= -283 and b81=-66
b81 = 32'b11000010100001000000000000000000;
#10; 
a81 = 32'b00000000000000000000000000000000;	// test case for a81=0 and b81=0
b81 = 32'b00000000000000000000000000000000;
#10;
a81 = 32'b00000000000000000000000000000000;	//test case for a81=0 and b81=-117
b81 = 32'b11000010111010100000000000000000;
#10;
a81 = 32'b11000010110111000100000000000000;	// test case for a81=-110.125 and b81=99.875
b81 = 32'b01000010110001111100000000000000;
#10;
a81 = 32'b01000010110111011100000000000000;	// test case for a81=110.875 and b81=99.125
b81 = 32'b01000010110001100100000000000000;
#100;
$finish;

end

initial begin 
$dumpfile("add_pipe.vcd");
$dumpvars(0);
end 

endmodule
