# Stop Watch

##Assignment

Rhe DE0 contains a 4-digit 7-segment output display, with each segment driven by one output pin. Create a project and top-level called "stopwatch" that has the following functionality:

* Push-button BUTTON0 resets the stopwatch, resetting the 7-segment display to "00.00".

* Push-button BUTTON1 starts the stopwatch, showing elapsed time in decimal, with two fractional digits, i.e. a precision of 10 ms.

* Push-button BUTTON2 pauses the display for as long as it is pushed (held down), but does not stop the stopwatch counter, providing something similar to the split functionality of a stopwatch. Here the split time always reflects the time between when the "start" and "split" button are presses, not the time between consecutive presses of "split". Note: my conception of split is a little different than the standard one; thanks to @bingthegreat93 for highlighting the ambiguity.

While the precision of the stopwatch is 10ms, the accuracy of the stopwatch will be less than 10ms, as we don't know how accurate the 50MHz clock is. Your stopwatch should introduce no more than 1% error on top of the clock error.

##Approach
* Division of the clock signal from 50 Mhz to 100 Hz (+/- 1 Hz)

* Generating four BCD output’s for the 7-segment display

* Seven Segment Decoder

* Enable/reset/Split user determined functionality
 
###Creating a Custom Clock Divider
Two main methods were tried, and the simplest of the two was chosen. The custom clock division wsa performed using a counter and a comparator. In order to create the stop watch, a frequency of 100 Hz was required, which could not have been obtained using the previous method used. Thus when the counter reached 500 000, the comparator would send out a pulse which would act as the new clock pulse as well as serve to reset the counter.

![clockdivision](https://cloud.githubusercontent.com/assets/17357371/13903968/f052eed4-ee87-11e5-9ced-255dfb3434ba.png)

###Generating the BCD output
The clock was always enabled in order to allow the counter to count without any glitches. Once the counter reaches 10, it is reset and the subsequent counter is enabled. This will be 10x slower than the previous counter because it is enabled after the previous counter reaches 10. This generates the required BCD output.

![newcounter](https://cloud.githubusercontent.com/assets/17357371/13904854/1e587c68-eea6-11e5-9006-c138f62cc9c6.PNG)

###BCD to 7-Segment Display
It was decided that the PAL system for this would be too time consuming to implement. Thus a Karnaugh map was made for each segment of the display, giving the following code:

```Verilog
module decode_7segment (decimal, display);
  input [3:0] decimal;
  output [6:0] display;

assign display[0] = ~(decimal[3] | decimal[1] | (decimal[2] & decimal[0]) | (~decimal[2] & ~decimal[0])); //display[0] is a
assign display[1] = ~(~decimal[2] | (~decimal[1] & ~decimal[0]) | (decimal[1] & decimal[0])); //display[1] is b
assign display[2] = ~(decimal[2] | ~decimal[1] | decimal[0]); //display[2] is c
assign display[3] = ~((~decimal[2] & ~decimal[0]) | (decimal[1] & ~decimal[0]) | (decimal[2] & ~decimal[1] & decimal[0]) | (~decimal[2] & decimal[1]) | decimal[3]); //display[3] is d
assign display[4] = ~((~decimal[2] & ~decimal[0]) | (decimal[1] & ~decimal[0])); //display[4] is e
assign display[5] = ~(decimal[3] | (~decimal[1] & ~decimal[0]) | (decimal[2] & ~decimal[1]) | (decimal[2] & ~decimal[0])); //display[5] is f
assign display[6] = ~((~decimal[2] & decimal[1]) | (decimal[1] & ~decimal[0]) | (decimal[2] & ~decimal[1]) | decimal[3])

```

###Implementing switches

####Start/Stop
We wanted to use a push-button as both the start and stop of the stop-watch. This required a more complicated latch system than for initiating the stop watch alone.

A J-K flip flop was used in the following configuration for this purpose:
![startstop](![new_startstop](https://cloud.githubusercontent.com/assets/17357371/13904803/62b658dc-eea4-11e5-8b9b-c3008d58819d.png)

####Reset
The counters had asynchronous clear as a megafunction, which we implemented in our design.

![clear](https://cloud.githubusercontent.com/assets/17357371/13904021/23fb8ba4-ee8a-11e5-9e4d-b1abe1ea5ae6.png)

####Split
This was simple to implement, as the LCD diplay panel would latch when the input from the push button was 0.

![newsplit](https://cloud.githubusercontent.com/assets/17357371/13904825/de0aef66-eea4-11e5-922b-9183bfe037ae.png)
