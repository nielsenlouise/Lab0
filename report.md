# Team ???? Lab 0 Report

## Circuit Design

### Circuit Diagrams

### Test cases

### Propagation Delays

## FPGA testing

### 16 Test Cases
In order to test our FPGA, we chose the same test cases that we used in our simulation test bench for the 4-bit adder. Again, we chose these cases to capture the following situations:
* Positive Numbers without Overflow
* Positive Numbers with Overflow
* Negative Numbers without Overflow
* Positive and Negative Numbers with Carryout
* Positive and Negative Numbers without Carryout

We were able to confirm that our FPGA 4-bit Adder was working because we got the expected results for each test case. A table of the results for each test is shown below. It is identical to the table we generated with our simulation test bench. 

A | B 
------------ | ------------- 
0000 | 1111 
0000 | 1111 

### Test Example
To demonstrate our working FPGA, we have a [short video](https://youtu.be/c9_2-7uq8pI) on YouTube. In this test, we chose the case where A = 0011 and B = 1111. First we input A using the four switches, and press the corresponding button. The photo below shows the state of the board at this point. Of the four LEDs above the switches, lit LEDS indicate a 1. 

Then we use the switches and 3rd button to input B, which will result in the LEDs indicating the sum. In this photo we can see that the LEDS are displaying 0010, which is the sum we expected. 

Finally, pressing the very first button displays the carry out and overflow. The third LED indicates the overflow and the last LED indicates the carryout. In this photo we see the last LED is lit, giving the expected carry out of 1, which again validates 
the functionality of our FPGA 4-bit adder. 

### Summary Statistics: Resources Used
Screenshot of Vivado Summary Statistics
According to the summary statistics, in terms of resources used, this project didn't require much. 
