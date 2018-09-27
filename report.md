# Team ???? Lab 0 Report

Carl Moser, Louise Nielsen, Camille Xue

## Circuit Design

### Circuit Diagrams

We based our full adder off of Camille's design from HW2. This diagram is labeled with the names of wires and gates:

![Full adder diagram](/images/full_adder.jpg)

The following diagram describes how we used this adder as a component in our 4 bit adder design:

![4 bit full adder diagram](/images/four_adder.jpg)

We referred to the [number systems slides](https://canvas.instructure.com/courses/1414489/pages/day-04-number-systems) from class 04 to inform our design, as well as our arithmetic.

### Test cases

We chose these 16 test cases with the intent of covering all possible failures:
- 3 cases adding two positive numbers (with no overflow)
- 2 cases adding two positive numbers (with overflow)
- 3 cases adding two negative numbers (with no overflow)
- 2 cases adding two negative numbers (with overflow)
- 4 cases adding a positive and a negative number

We had hoped to catch any errors in our design regarding overflow or carryout.

We actually used the first few test cases we came up with to verify our understanding of two's complement and that it worked with our implementation.

Additionally, in our first iteration of the design, we had overflow set to the result of carryout XOR `s[3]`. We realized this was wrong in our first positive and negative test case while working through them on a whiteboard (in decimal, 5 + -6), and corrected it to carryout XOR `carryout3` (the carryout from our third adder component and carryin to our fourth).

None of our test cases failed when we ran them with Verilog.

Here is a table of our test results. It is identical to our simulation test bench, except that there are both expected and actual values of sum, carryout, and overflow in the bench.

| A | B | Sum | Carryout | Overflow |
| --- | --- | --- | --- | --- |
| Positives | | | | |
| 0100 | 0010 | 0110 | 0 | 0 |
| 0000 | 0110 | 0110 | 0 | 0 |
| 0011 | 0100 | 0111 | 0 | 0 |
| Positives with overflow | | | | |
| 0101 | 0011 | 1000 | 0 | 1 |
| 0110 | 0110 | 1100 | 0 | 1 |
| Negatives | | | | |
| 1110 | 1100 | 1010 | 1 | 0 |
| 1011 | 1110 | 1001 | 1 | 0 |
| 1111 | 1101 | 1100 | 1 | 0 |
| Negatives with overflow | | | | |
| 1110 | 1001 | 0111 | 1 | 1 |
| 1000 | 1011 | 0011 | 1 | 1 |
| Positive/negative | | | | |
| 1111 | 0111 | 0110 | 1 | 0 |
| 0010 | 1001 | 1011 | 0 | 0 |
| 0000 | 1000 | 1000 | 0 | 0 |
| 0011 | 1111 | 0010 | 1 | 0 |


### Propagation Delays

## FPGA testing

### 16 Test Cases
In order to test our FPGA, we chose the same test cases that we used in our simulation test bench for the 4-bit adder. Again, we chose these cases to capture the following situations:
* Positive Numbers without Overflow
* Positive Numbers with Overflow
* Negative Numbers without Overflow
* Positive and Negative Numbers with Carryout
* Positive and Negative Numbers without Carryout

We were able to confirm that our FPGA 4-bit Adder was working because we got the expected results for each test case. A table of the results for each test can be seen in the above section because we used the exact same test cases and had the same results. 

### Test Example
To demonstrate our working FPGA, we have a [short video](https://youtu.be/c9_2-7uq8pI) on YouTube. In this test, we chose the case where A=0011 and B=1111. We would expect our sum too be 0010 and our carry out to be 1. First we input A using the four switches, and press the corresponding button. The photo below shows the state of the board at this point. Of the four LEDs above the switches, lit LEDS indicate a 1.

<img src="https://raw.githubusercontent.com/nielsenlouise/Lab0/master/images/FPGA_A.jpg" width="400px" />

Then we use the switches and 3rd button to input B, which will result in the LEDs indicating the sum. In this photo we can see that the LEDS are displaying 0010, which is the sum we expected.

<img src="https://raw.githubusercontent.com/nielsenlouise/Lab0/master/images/FPGA_SUM.jpg" width="400px" />

Finally, pressing the very first button displays the carry out and overflow. The third LED indicates the overflow and the last LED indicates the carryout. In this photo we see the last LED is lit, giving the expected carry out of 1, which again validates
the functionality of our FPGA 4-bit adder.

<img src="https://raw.githubusercontent.com/nielsenlouise/Lab0/master/images/FPGA_CO.jpg" width="400px" />

### Summary Statistics: Resources Utilized
![Utilization Summary](/images/utilization_summary.png)
Based on this summary report, we can see how much of each resource was used on the FPGA. Overall, the 4-bit adder didn't require much of anything because it is relatively simple and there are lots of available LUTs and FFs. By looking at the Hierarchy Report, we could see that 5 of the 7 Slice LUTs were used by opA_mem....
![Utilization Summary](/images/utilization_hierarchy.png)
