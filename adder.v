module structuralFullAdder
(
    output sum,
    output carryout,
    input a,
    input b,
    input carryin
);
    wire norAout, andAout, andBout;

    xor xorA(norAout, a, b);
    and andA(andAout, a, b);
    xor xorB(sum, norAout, carryin);
    and andB(andBout, norAout, carryin);
    or orgate(carryout, andAout, andBout);
endmodule

module FullAdder4bit
(
  output[3:0] sum,  // 2's complement sum of a and b
  output carryout,  // Carry out of the summation of a and b
  output overflow,  // True if the calculation resulted in an overflow
  input[3:0] a,     // First operand in 2's complement format
  input[3:0] b      // Second operand in 2's complement format
);
  wire carryout0, carryout1, carryout2, carryout3;
  reg carryin = 0;

  structuralFullAdder adder1 (sum[0], carryout0, a[0], b[0], carryin);
  structuralFullAdder adder2 (sum[1], carryout1, a[1], b[1], carryout0);
  structuralFullAdder adder3 (sum[2], carryout2, a[2], b[2], carryout1);
  structuralFullAdder adder4 (sum[3], carryout, a[3], b[3], carryout2);


  endmodule
