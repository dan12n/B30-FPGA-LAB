# Multiplier
##Task
Your task is to implement a 5-bit x 5-bit multiplier, which takes two 5-bit numbers from the toggle switches, and shows the 10-bit product on the LEDs. There should be three different variants (top-levels) that you can configure:

* mult_comb : A combinatorial multiplier, where the output immediately reflects the input.
* mult_reg : A registered multiplier, where there are registers before and after the multiplier, so it takes two clock cycles to perform a multiplication.
* mult_pipe : A fully pipelined multiplier, where there are also registers within the multiplier, so it takes multiple cycles to perform the multiplication.

##The Principles
Multiplication was implemented using the shift and addition method. If the Least Significant Bit is one, add B; otherwise add 0. 

![rsz_add1](https://cloud.githubusercontent.com/assets/17357371/13903856/26b445ea-ee83-11e5-8008-5ba810e51a67.png)
> Image source: http://sit.iitkgp.ernet.in/

In order to implement this with combinational logic, 2n bit full adders were required (if the number of bits of both the multiplicand and multiplier are n). Addition, be it 0 or the multiplicand, and shifting to the left needs to be performed with each bit of the multiplier. The resulting sum from each stage must be an input to the subsequent full adder.

![rsz_shiftandadd](https://cloud.githubusercontent.com/assets/17357371/13903847/a28904c2-ee82-11e5-890b-ccf4328a399f.png)
> Image source: http://codientu.org/

##Implementing

### Combinational Multiplier
A symbol of the following was created in order to implement shifting and adding, illustrated in the above diagram.

![blockshiftandadd](
![newblock](https://cloud.githubusercontent.com/assets/17357371/13904779/938d345e-eea3-11e5-90a8-43a42e458393.png)

This was then looped five times for the five bits:
![loop](https://cloud.githubusercontent.com/assets/17357371/13903853/e7936b7a-ee82-11e5-826c-2c8ccbcb027b.png)

### Registered Multiplier
Our Design enabled us to embed the registered multiplier quite easily, through the use of D Flip-flops. These have been placed after the signal for the input switches, and before the result is given out to the LED's.

![registered](https://cloud.githubusercontent.com/assets/17357371/13903891/c530f7da-ee84-11e5-8ae3-f1b6c700a33c.png)

### Pipelined Multiplier
This was, yet again, not difficult to implement. Each stage of the addition and shifting has a 'pipelined register', which we used as follows:

![pipelined](https://cloud.githubusercontent.com/assets/17357371/13903908/54acfe9a-ee85-11e5-8ac4-a36d7811accc.png)

> Note: All registers share a common clock
