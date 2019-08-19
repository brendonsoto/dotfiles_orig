= Project 7 =
This project can also be broken down into two components, a parser and a code-writer, but I want to try things a bit different here.

The last project I knew up front that there's a simple way to iterate through the lines of a file in Python (the documentation provides a simple for loop to do so) so I thought creating a function just to read the input was unnecessary. This time I want to try making reading the input without parsing the lines a tested function. The input will be a file and the output an array/list of the lines.

I guess what I'm saying is that I want my functions to be more simple this round. I want them to do one thing and one thing well. I'm going to try to not think about organization much right from the get-go so I can see the patterns unfold and react as they arise. This I feel will allow me to work in a more focused flow.

The gameplan:

1. [X] Create a project directory
2. [X] Create a test for a function to read in input and return a list of the lines
3. [X] Create ^ func
4. [X] Create a test to filter out lines that are just comments, inline comments, and white space
5. [X] Create ^ func
6. [X] Create a parsing function that takes in a line and returns a dict describing the line's instruction
7. [X] Create ^ func
8. [ ] Create tests for the arithmetic operations
9. [ ] Create ^ funcs
10. [ ] Create writing functions for each type of output
11. [ ] Create ^ funcs

Man, I can't believe I didn't see the value in doing this before. If I did this in the previous project I would've been able to reuse some code already! Specifically steps 1-5! Even 6 and 7, although they would've needed some tweaking.

Also I have some sub-goals I want to aim for while doing this project. I'd like to learn more about Python, testing in particular.
- [X] Why are tests run alphabetically?
- [X] Can tests be run in different ways?
- [X] What's the difference between a TestCase class and a TestSuite?

Okay! I just read through the Python documentation on the `unittest` library (https://docs.python.org/3/library/unittest.html) and got my answers the above!

Tests are run alphabetically just because that's how Python is ¯\_(ツ)_/¯. Python sorts the tests by their name and runs them in that order. If another order of tests is needed, that's where `TestSuite` comes in. `TestSuite` is a way to group your tests using the `addTest/s` function/s. You add your tests in whatever order, create a `TestRunner` instance, and tell that instance to run the test suite! The documentation mentions using just `TestCase` should be sufficient enough for everyday testing and now I see why.


Returning to talking about the above steps. I think it is silly to have a test just to read the lines and make a list of the lines. There is the `for` loop for a reason and it would be silly to have to iterate over the lines twice unnecessarily. So the test should really be to read the file and output all of the valid lines. The ability to read a file line by line already exists so that does not need to be tested. What does is the ability to take the valid lines/instructions from a file and sanitize them (remove comments).

I think I just stumbled into understanding Python modules and using them in other Python modules/scripts a little more...

Let's say you make a Python module `~/modA/main.py` (~ means the root of the project). This module lives in a directory with the __init__.py file too. You make another module in a different directory that references the first module. Importing the module using `import modA` opens up the files in the directory to be used, so in order to reference a specific file/method you'd have to do `modA.main.my_func`. It's starting to make more sense now!


_Update - 2018/Mar/19_
This project translates .vm files into .hack files.
There's a memory part to it. The VM has the following memory bits:
- argument
- local
- static
- constant
- this
- that
- pointer
- temp
This all has to do with manipulating a stack. So the question becomes, how can we make a sort of 'stack' with Hack?
Hack features the following memory bits:
- SP (Stack Pointer)
- LCL (Local)
- ARG (Argument)
- THIS
- THAT
- R5-R12 (temp)
- R13-R15

So one of the first things sticking out to me is how Assembly features a SP keyword/symbol. That's our key.
Wait, I think it would be better to look at the source code again.

I see the very first step in the VM-test file being initializing the SP. The exact line is: `set RAM[0] 256`. So this makes me think that the very first step in the output .hack file should be to set A equal to the SP's value in memory, or in other words: @SP; A=M;!

_NOTE_ I've made mistakes: Going backwards from the stack pointer should be `@SP;A=M;` since the stack pointer holds a reference to where to go

A push command (i.e. `push constant 7`) would equal:
@7
D=A
@ARG
M=D
// Followed by
@SP
M=M+1

Thus an arithmetic function would be (i.e. add, sub)...
@SP // Go to the top of the stack
// Forgot the A=A-1 here
D=M // Get the value from the top
A=A-1 // Go back an address (SP-1)
M=D+M // Do your arithmetic and set the value there
A=A+1 // Iterate the Stack Pointer by 1

A negating function would then be...
@SP
A=A-1
M=-M
A=A+1

The boolean expressions would be (i.e. x = y)...
@SP
A=A-1
D=M
A=A-1
D=M-D
D;JEQ

// X > Y
@SP
A=A-1
D=M
A=A-1
D=M-D
D;JGT

The bit-wise or/and expressions would be...
@SP
A=A-1
D=M
A=A-1
M=D|M (or) D&M

And lastly the bit-wise not would be...
@SP
A=A-1
M=!M
A=A+1


_Update 2018/Mar/20_
So I was able to get SimpleAdd to work, but not StackTest which tells me my arithmetic is off, least for the equality bits.
Yup, my jump Statements are incorrect. I was stepping through StackTest and for the 'eq' part my code jumped right back to the beginning, causing an infinite loop. I realize I need to make separate 'commands' to set a value to 'true' or 'false' depending on the boolean expression.

Looked at the forum for people with similar problems. Found a few posts, but one stuck out to me saying, "look at past .asm projects". That got me looking back at `Fill.asm` where I noticed I set up two routines to basically set a value to true or false. I guess I need something similar, like a setup call.

Now I'm thinking about how to only write the boolean helpers when they are needed...
I figured this would be better than including the boolean helpers on every program since they may not be needed. One way to do this would be to iterate through all of the instructions looking for the first instance of 'eq/lt/gt' and then setting a flag to true, breaking out of the loop, and then writing the instructions. Another approach would be to reduce/filter the list of instructions to just values and look for any value that has 'eq/lt/gt'. I like the first approach better since its max runtime would be O(N).

I implemented the coroutines, but something's still not right...

I'm stuck figuring out how to jump back to where I was just at. It's like I have to write every equality bit as its own function.
Yup, just checked on the forum again (this time in the Chapter 7 portion instead of project 7) and found in a post that _dynamically created labels are necessary_. Dangit.
Now how to set this new system up...

Got it working!!

_Update 2018/Mar/21_

Now for part II. Pop segments seem like they would follow something like...
1. Grab the value from the SP and save it to the D register
2. Decrement the SP by one
3. Navigate to the address indicated by the Pop command
4. Set the value in memory (M) to what's in the D register

[DISREGARD]For Step 3, getting the address by the Pop command would require in higher-lang...
1. Getting the base (lcl, arg, this, that, etc.) address from some symbol dict
2. Get the offset of the address from the Pop command
3. Add the offset to the base
4. Return that as the resulting address

Wait no, the above is wrong. I think it should be like this:
1. Go to lcol/arg/this/that and grab the address there into the D register
2. Set the A register to whatever is the second arg to the Pop command
3. Set D = D + A (i.e. Local + 2)
4. Set A = D
5. Boom, we're at base + i


But first, time for test cleanup (everything's failing lol -- forgot to update)
That was quick. I just deleted the tests since it's only testing strings.

YESSS Got  BasicTest working and then PointerTest. Now just StaticTest!

From What I understand of the book's suggested implementation of `static` it's fine to just have it as a Hack symbol. It seems the index doesn't have much to do with it?

Yayyy!!! Got it all down! Now for some cleanup.

Now the final step:
Enable the main file to either accept a file or a directory full of .vm files to compile
1. Check if arg is a file or doc
2. If file, just process that file
3. If doc, grab all .vm files in dir and process


                               == Reflections ==

  Today (2018/Mar/22) I cleaned up the code for project seven a bit. I've certainly learned a bit more about Python through it, but more importantly it's given me little areas of contemplation regarding structure.
  The book mentioned using the VM programs for the project as unit tests, but even before this project I've been writing unit tests as I code. Seeing the book bring up unit tests made me think of having two-tiered unit test structure. One tier would be for making sure the functions did what they were supposed to do and the other tier would be testing putting the functions together. Then I realized, "Oh! I'm thinking of integration tests!".
  A weird pattern I noticed I would get into is I would test my code against the integration test (VM program), my code would fail, and then I would update my code, but not my unit tests. I was unsure of what the unit test should really expect then. This lead to a rhythm of "fix-code, pass integration test, fix unit tests". Seems odd, right?
  This leads me to think how can I know if my unit tests are expecting the right things? How do I check my understanding of the individual pieces that make up the unit test? There was no VM-to-Hack translation module provided, so I couldn't really check if what I thought to be right was actually right.
  This has been a good reminder of the value of pseudocode or just stepping through things before jumping in. I could have probably tested my understanding of the pieces by mocking out the pieces, put them together, and then test that against the supplied test. Once I have that working then I can reduce that into submodules to use as the expectations in my unit tests. And now I have a new way of thinking about tests!
  Another concept relearned was how there's never a 'one-size-fits-all' approach to, I guess anything. I started off structuring my VM translator into two Python packages: one for parsing, one for writing code. I was struggling with trying to get the packages communicating with each other when I realized I was approaching the structure all wrong. I needed _modules_ not _packages_. I mixed the two in my mind because I was thinking of a project structure similar to the Reducks structure used for JavaScript projects. Transfer of knowledge was failing me now, but for good since it reminded me sometimes you have to step back and ask "does this really make sense?". The result was a slimmed down code structure that, imo, is a lot easier to follow.
  Thinking about project structure also lead me to think about how I structure my code. Lately I've been thinking maybe it's better to write things from a top down approach so that way I can think about the naming conventions from a bird's eye view and make sure the names flow like a story. Once again revisitng I'm pseudocode note made above.
  This project has definitely been the most challenging yet, but also the most rewarding, emotionally. I had help; previous posts on the forum helped me in the right direction, but now looking at the code I made and seeing what it produces makes me feel kind of proud. Look Ma! I did a thing!
