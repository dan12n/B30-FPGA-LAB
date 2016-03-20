# BlinkenLights

##Task
>You will now add a clock input, give the circuit some state, and get the LEDs to display a 10-bit binary counter, incrementing at a rate of ~47.6837hz (i.e. it should take ~21.5 seconds for the LED counter to wrap round).

##The Principle
###Clock Division

The 50 Mhz signal has been divided (by two) twenty times using Flip-Flops. For the D Flip-flop, achieving this is simple: connect the output Q' (which is high every two clock cycles) to the input D.
> 50/2^20 ~47.6837 Hz.

![alt tag](http://realdigital.org/RealDigital/P09_SimpleClockDivider_Vivado/ClkDivider.svg)

###Binary Counter

The same property of the D Flip-Flop above has been implemented below. An asynchronous up-counter was used that divided the frequency by two using the flip flops.
![counter](https://cloud.githubusercontent.com/assets/17357371/13902083/48480774-ee32-11e5-8dd5-961241e2b44e.png)

Working on the following principle:

![alt tag](http://www.learnabout-electronics.org/Digital/images/counter-wf2.gif)

> Source: http://www.learnabout-electronics.org/

##Overview of the Design
![principles](https://cloud.githubusercontent.com/assets/17357371/13902072/7e49595a-ee31-11e5-9b4e-3e451c849603.png)
