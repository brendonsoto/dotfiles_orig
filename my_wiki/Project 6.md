# Project 6

*Creating an Assembler*
I've decided to use Python to create the assembler.
*Why Python?* Primarily because I want to explore Python a bit and get more familiar with it. Additionally, I didn't want to use JavaScript since it's I/O operations with files can get lengthy with callbacks.

I want to provide some unit tests while developing the assembler. I don't know anything about testing in Python and definitiely will need a refresher in the language, but that can come as I go along.

_Gameplan:_
1. [X] Find out how to unit test in Python
2. [X] Figure out how to make modules (a file of Python code that can be used in another Python file) in Python
3. [X] Make a simple 'Sum' test
4. [X] Figure out how to read files
5. [X] Figure out how to write files

Cool! So I know how to make simple tests with `unittest`, how to make and import *modules* and how to read & write files!
What now...
Before I consult the book again, let me think...
An assembler has three or four parts to it:
- Parse the input file
- Change each instruction to binary code
- Create a symbol table for any user-defined symbols/variables
- Put the symbols and binary code together to make a binary file

So parsing the file would mean just iterating through the file...
And I remember the book recommending to do two passes: one for symbols, the other for translating
So the symbol table should be created after the first pass...
And the binary translation the next...
But I feel the two can be combined requiring only one iteration through the file?
Let's consult the book now... and the forum!

I misunderstood what the book meant by parsing the input. It meant deconstructing the input and organizing the pieces into different categories to then synthesize. I'm thinking about creating the assembler in a different way:
1. Create a function/module to discern whether the line read is an A command or a C command (or neither)
2. Create a function/module to parse out a C command into its bits (comp, dest, & jump) and return the full C command
3. Create a module to put everything together!

Wait, I was skimming through the implementation section on a Pomo-break and just realized now the rationale behind their suggested structure.
The comp, dest, & jump codes will all need tables/dictionaries of some sort. "Put in this language to get this binary code back." So part of the work in step two (above) would be creating these dictionaries. The comp one will need a tree structure (for the a-bit).


_Gameplan:_
- [X] Create a test for getting A or M comp codes
- [X] Create code for ^
- [X] Create modules for Jump and Dest codes
- [ ] Create a function in the Assembler module to put together the comp, jump, and dest codes
- [ ] Create parser


_Update: 2018/Mar/14_
Happy Pi day! I'm having trouble with the notions of packages in Python, specifically referencing submodules.
I understand that a _module_ in Python is a *file that ends in .py*.
I understand that _packages need an init file_ to include the files in the directory as accessible modules.
But how do you reference submodule A in submodule B??

I'm going to try to learn more by making a separate project just to learn.

I started out with just a single module with two functions, one that takes an arg, and one that doesn't.
Imports just fine in the REPL.
Now let's make a submodule

Made a basic math submodule and it works in the REPL.
Now to call it in the base module.

Accessing a submodule from a parent directory is no problem.
Now let's make a function in the root/main module that calls a submodule's function.
Works in the REPL.
Now let's make a directory that sits next to this package and see if we can call this new function _directly_ (aka python3 my_file.py)

Here is where I'm stuck!

I've tried:
- import my_package.main
- import my_package
- from .. import my_package.main
- from . import my_package.main
- from ..my_package import main
- from .my_package import main

No dice :(
Why??

_Alright, mystery kind of solved:_
Let's say you have a directory with multiple subdirectories, each being a Python package you made (no PiP or anything, just plain Python). These submodules are not in your path to begin with, so naturally you can't call them like regular modules. Additionally, Python disallows code from PackageA to access code in PackageB _directly_. It seems you may be able to do so if using *venv* or *pip* to have an isolated environment, but without them you *cannot* access packages relatively. Why? This seems to be the philosophy Guido (the creator of Python) believes in, and since he is the creator, he has the final say.
The work around is to use the *sys and os packages* to insert the local directories into your path. _This is not considered "clean"_, but people do it anyways. Seems harmless for test folders.
So for now I'm just going to keep my tests side-by-side with my files, as I do in JS projects, because I think it's simpler that way. It avoids having to duplicate a file structure in both `project` and `tests` directories and makes it super convenient to see the tests for a module.


As I go to update the Assembler structure I try to test again, but still meet the error of the submodule being inaccessible.


FINALly!!! Got it!!!


_Update 2018/Mar/14 -- 3:25pm_
Added in translating A_instructions that use predefined symbols.
Now what's left is user-defined symbols and Location symbols (i.e. (LOOP) ).
Then we can start to put it together!

Location # # of current instruction - 1
^current instruction meaning line count not including comments

Added location! Now all that's left is the following:
_TODO_
- [X] Read through the file and...
- [X] Have a running counter for the location commands...
- [X] Parse each line...
- [X] Trim whitespace and newlines
- [X] Ignore empty lines
- [X] Write it out to a file
- [X] Allow the program to take in an argument from the command line

My Assembler worked well with the Add and Max programs, but went down south for the Rect program.
I now see why a two scan is important.
The first scan makes it easy to get all of the symbols.
So now I have two options:
- Redo the program so it does two scans
- Modify the program that when locations appear to check the tables and subtract
I'm going to try the latter first. Just cause I really want to see if I can do it in one go.
Wait, no, that's a bad idea because:
Let's say an A-instruction is encountered that uses a symbol.
Then a few lines later, two or three more A-instructions are encountered.
Then after that, we see the very first symbol is actually a location.
That means all of the instructions will need their addresses shifted to match the files outputted from the book.
So a two-scan approach really is the best way, le-sigh. Well, we learned why! lol

Luckily we have a way to count program lines and make Location hashes.
_TODO_
- Use the `main` function as the basis for a `get_symbols` function to populate the symbols table
- From `main` call `get_symbols` as one of the first calls
While I'm at it, I can probably merge predefined_symobls + user_symbols into one symbols



## Reflections
I've had the wrong understanding of assemblers and assembly language for a long time.

Before I thought of assembly as a singular language so learning that the language is dependent on the hardware architecture blew my mind. It also made me think maybe this is the reason we have platform independent code, why iOS code won't work on Android and vice-versa.

Additionally, before this chapter I thought an assembler was a work of pure machine code. It's great to be able to implement a translation service in a higher level language to create such base code. I used Python to create my assembler, but I'm sure languages like C are used in modern day assemblers for their efficiency.

Lastly, this was a fun exercise in learning Python a bit better too! I already knew some basic Python, but it's been a while since I've done any actual programs in it. Plus this was the first time creating tests for a Python program! The test library is interesting and I feel like I have a lot to learn about it. For instance, I'm still unsure why all of the tests are run in alphabetical order instead of the order they are defined. I'm sure a better assembler could've been written, but I'm happy with what I've been able to do with my limited knowledge!
