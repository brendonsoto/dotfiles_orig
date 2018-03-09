= Memory =
The Screen and Keyboard components are supplied.
The remaining bit is the 16k memory component.
Question is: _How to tie the three together?_

*We have the following inputs to work with:*
_Memory_
- in[16]
- load
- address[15]

_Screen_
- in[16]
- load
- address[13]

_Keyboard_
Nothing - only out[16]


What if we worked backwards?
We know that if the address is all 1's (111111111111111 - 1x15) then we're working with the keyboard.
Wait, the math is tripping me up a bit...

0 - 16k = 2^14 = RAM
24576 - 16k = 2^13 = Screen
24576 = KBD

== Memory Reflections ==
So I just finished implementing the Memory bit. It took me a little longer than I had hoped. Even after rereading the implementation notes where the idea of reusing the same logic used to build the RAMX chips was presented I was having a total brain fart. I realized my mistake was in seeing the RAM16k chip as only being configured with a single input and output. Upon realizing that any numbers below 2^14 could be represented with the MSB at 0 and the second-to-MSB at either 0 or 1. This is a bit confusing in words so let's look at a truth table:

MSB | MSB-1 | Num
 0  |  0    | 0 <= x <= 8192
 0  |  1    | 8192 <= x <= 16384
 1  |  0    | 16384 <= x <= 24576
 1  |  1    | 24576 <= x
 
Once I realized the difference here the idea of using a DMux to split the load signal to the various inputs made total sense. The first two outcomes in the above truth table can be routed to the same RAM chip! 
