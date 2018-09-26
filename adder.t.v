// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFull4BitAdder();
    reg[3:0] a, b;
    wire[3:0] sum;
    wire carryout, overflow;
    reg carryin;

    //behavioralFullAdder adder (sum, carryout, a, b, carryin);
    FullAdder4bit adder (sum[3:0], carryout, overflow, a, b);
    initial begin

    $display("A     B     | Cout  Sum "); //actually Cout here might just be overflow?
    a[3]=1; a[2]=0;a[1]=1;a[0]=0;
    b[3]=1; b[2]=0;b[1]=0;b[0]=1;
    carryin=0; #1000
    $display("%b  %b  |  %b    %b  | ", a, b[3:0], carryout, sum);
    a[3]=1; a[2]=0;a[1]=1;a[0]=0;
    b[3]=0; b[2]=1;b[1]=0;b[0]=1;
    carryin=0; #1000
    $display("%b  %b  |  %b    %b  | ", a, b[3:0], carryout, sum);
    $finish();
    end
endmodule
