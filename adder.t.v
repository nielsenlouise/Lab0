// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFull4BitAdder();
    reg[3:0] a, b;
    wire[3:0] sum;
    wire carryout, overflow;
    reg carryin;


    FullAdder4bit adder (sum[3:0], carryout, overflow, a, b);
    initial begin

    // Test Cases with two positive numbers, no overflow
    $display("Test Cases with 2 Positive Numbers, No Overflow");
    $display("A     B     | Sum   Exp. | Cout  Exp. | Over  Exp.  ");
    a[3]=0; a[2]=0;a[1]=0;a[0]=0;
    b[3]=0; b[2]=1;b[1]=1;b[0]=0;
    carryin=0; #1000
    $display("%b  %b  | %b  0110 | %b     0    | %b     0 ", a, b[3:0], sum, carryout, overflow);
    a[3]=0; a[2]=0;a[1]=1;a[0]=1;
    b[3]=0; b[2]=1;b[1]=0;b[0]=0;
    carryin=0; #1000
    $display("%b  %b  | %b  0110 | %b     0    | %b     0 ", a, b[3:0], sum, carryout, overflow);
    a[3]=0; a[2]=0;a[1]=1;a[0]=1;
    b[3]=0; b[2]=1;b[1]=0;b[0]=0;
    carryin=0; #1000
    $display("%b  %b  | %b  0111 | %b     0    | %b     0 ", a, b[3:0], sum, carryout, overflow);
    $display("-------------------------------------------------");

    //Test Cases with two positives, with overflow
    $display("Test Cases with 2 Positive Numbers, With Overflow");
    $display("A     B     | Sum   Exp. | Cout  Exp. | Over  Exp.  ");
    a[3]=0; a[2]=1;a[1]=0;a[0]=1;
    b[3]=0; b[2]=0;b[1]=1;b[0]=1;
    carryin=0; #1000
    $display("%b  %b  | %b  1000 | %b     0    | %b     1 ", a, b[3:0], sum, carryout, overflow);
    a[3]=0; a[2]=1;a[1]=1;a[0]=0;
    b[3]=0; b[2]=1;b[1]=1;b[0]=0;
    carryin=0; #1000
    $display("%b  %b  | %b  1100 | %b     0    | %b     1 ", a, b[3:0], sum, carryout, overflow);
    $display("-------------------------------------------------");

    // Test Cases with two negatives and no overflow
    $display("Test Cases with 2 Negative Numbers, No Overflow");
    $display("A     B     | Sum   Exp. | Cout  Exp. | Over  Exp.  ");
    a[3]=1; a[2]=1;a[1]=1;a[0]=0;
    b[3]=1; b[2]=1;b[1]=0;b[0]=0;
    carryin=0; #1000
    $display("%b  %b  | %b  1010 | %b     1    | %b     0 ", a, b[3:0], sum, carryout, overflow);
    a[3]=1; a[2]=0;a[1]=1;a[0]=1;
    b[3]=1; b[2]=1;b[1]=1;b[0]=0;
    carryin=0; #1000
    $display("%b  %b  | %b  1001 | %b     1    | %b     0 ", a, b[3:0], sum, carryout, overflow);
    a[3]=1; a[2]=1;a[1]=1;a[0]=1;
    b[3]=1; b[2]=1;b[1]=0;b[0]=1;
    carryin=0; #1000
    $display("%b  %b  | %b  1100 | %b     1    | %b     0 ", a, b[3:0], sum, carryout, overflow);
    $display("-------------------------------------------------");

    // Test Cases with two negatives, with overflow
    $display("Test Cases with 2 Negative Numbers, With Overflow");
    $display("A     B     | Sum   Exp. | Cout  Exp. | Over  Exp.  ");
    a[3]=1; a[2]=1;a[1]=1;a[0]=0;
    b[3]=1; b[2]=0;b[1]=0;b[0]=1;
    carryin=0; #1000
    $display("%b  %b  | %b  0111 | %b     1    | %b     1 ", a, b[3:0], sum, carryout, overflow);
    a[3]=1; a[2]=0;a[1]=0;a[0]=0;
    b[3]=1; b[2]=0;b[1]=1;b[0]=1;
    carryin=0; #1000
    $display("%b  %b  | %b  0011 | %b     1    | %b     1 ", a, b[3:0], sum, carryout, overflow);
    $display("-------------------------------------------------");

    // Test Cases with positive and negative, and carryout of 1
    $display("Test Cases with Negative & Positive Numbers, with Carryout");
    $display("A     B     | Sum   Exp. | Cout  Exp. | Over  Exp.  ");
    a[3]=1; a[2]=1;a[1]=1;a[0]=1;
    b[3]=0; b[2]=1;b[1]=1;b[0]=1;
    carryin=0; #1000
    $display("%b  %b  | %b  0110 | %b     1    | %b     0 ", a, b[3:0], sum, carryout, overflow);
    a[3]=0; a[2]=0;a[1]=1;a[0]=1;
    b[3]=1; b[2]=1;b[1]=1;b[0]=1;
    carryin=0; #1000
    $display("%b  %b  | %b  0010 | %b     1    | %b     0 ", a, b[3:0], sum, carryout, overflow);
    $display("-------------------------------------------------");

    // Test Cases with positive and negative, no carryout
    $display("Test Cases with Positive & Negative Numbers, No Carryout");
    $display("A     B     | Sum   Exp. | Cout  Exp. | Over  Exp.  ");
    a[3]=0; a[2]=0;a[1]=1;a[0]=0;
    b[3]=1; b[2]=0;b[1]=0;b[0]=1;
    carryin=0; #1000
    $display("%b  %b  | %b  1011 | %b     0    | %b     0 ", a, b[3:0], sum, carryout, overflow);
    a[3]=0; a[2]=0;a[1]=0;a[0]=0;
    b[3]=1; b[2]=0;b[1]=0;b[0]=0;
    carryin=0; #1000
    $display("%b  %b  | %b  1000 | %b     0    | %b     0 ", a, b[3:0], sum, carryout, overflow);
    $display("-------------------------------------------------");

    $finish();
    end
endmodule
