# BlinkenLights

##Task
>You will now add a clock input, give the circuit some state, and get the LEDs to display a 10-bit binary counter, incrementing at a rate of ~47.6837hz (i.e. it should take ~21.5 seconds for the LED counter to wrap round).

##The Principle
###Clock Division
The 50 Mhz signal has been divided (by two) twenty times using Flip-Flops.
> 50/2^20 ~47.6837 Hz.

![alt tag](http://realdigital.org/RealDigital/P09_SimpleClockDivider_Vivado/ClkDivider.svg)

###Binary Counter
![counter](https://cloud.githubusercontent.com/assets/17357371/13902083/48480774-ee32-11e5-8dd5-961241e2b44e.png)

##Overview of the Design
![principles](https://cloud.githubusercontent.com/assets/17357371/13902072/7e49595a-ee31-11e5-9b4e-3e451c849603.png)
