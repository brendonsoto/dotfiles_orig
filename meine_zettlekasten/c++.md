# C++
:programming:languages:


# Syntax
Comments are written using two forward-slashes
`// I am a comment`
Or using multi-line format similar to JavaScript
```
/* I
 * am
 * a
 * comment
 */
```

The *standard library* hold a lot of fundamental functionality, like I/O.

To include a library the syntax is:
`#include <library>`

Libraries wrapped in angle brackets (i.e. `<library>`) refer to the *standard header*

The *main function must return an integer*
- 0 = success
- otherwise = failure

`<<` is an *output operator* that is *left associative*

`std::cout` is the standard output
The first part of the above, `std::`, is a *namespace*
The second part is a function from the namespace

Scope is very similar to how other languages you know handle it.

*String literals* begin and end with double quotes (`"\nliteral\n"`)

`>>` signifies *read into*
So take whatever's on the left side and pipe it to what's on the right

*To declare a variable*: `type name` (i.e. `std::string name`)

*To declare a constant:* `const type name` (i.e. `const std::string name`)

If the value of a variable has a different type than what is specified in the variable declaration the value will be converted to the variable's type (I don't like the sound of that)

An operator is *overloaded* when it can do different things depending on the types of its arguments

Most operators seem left-associative

A variable's value can either be *explicitly set* by the programmer or *constructed*
What does it mean for a value to be constructed?
Alchemy! Kidding...
It depends on the type!
Let's look at creating a string.
The first example of this in the book is the following:
`const std::string spaces(greeting.size(), ' ');`
Breaking it down we have:
- Make a constant
- Make its type `std::string`
- Name it `spaces`
- The `(` indicates the value will need to be constructed using what comes after
- `size` is a *member function* of the type `string` which returns the length of a string. So here we're saying "get the length of the string greeting"
- The comma indicates other parts to be used in constructing the value
- `' '` is a *char literal* to represent an empty string
- The `)` indicates we're done adding in parts to construct the value. We have the number of characters in `greeting`, let's call it X, and a character literal. I'm not sure yet what the type of a string is, but from experience with other languages I'm guessing it's like a linked list of characters. So since we have a char literal and a number we can repeat that literal X amount of times.


# Strings
To concatenate, use `+`
`greeting = "Hello " + name + "!";`
Concatenation does not work on two string literals

The type to use when working with a number of characters is `std::string::size_type`
The rationale for this is that the number is kept in check with the possible bits to represent a string
In other words, the limit of `std::string::size_type` is different than `int` so we avoid the possibility of going beyond `int`'s limit


# Equality
`==` is used for comparisons
There is *short-circuit evaluation*
i.e. in the statement `true || false` since the left section is true the right section is not evaluated

Zero is considered false while any other numerical value is true.


# Namespaces
You might think of this as *modules* from other languages
You know how when you "include" a library, you still need to reference that library when using a function from it?
For example:
```
#include <iostream>

...
std::cout << std::endl;
```
You can avoid having to use the namespace in every function call by adding a `using` clause at the top:
```
#include <iostream>

using std::cout;
using std::endl;

...
cout << endl;
```


# I/O
One way to write things out is by including `<iostream>` to your program and use:
- `std::cin` for standard input
- `std::cout` for standard output
- `std::endl` for end of line

There are some operands that are *manipulators* which can alter a stream of data/characters

Generally, I/O uses *buffers* as a temporary storage for data to be written
Once all the data is collected and the input function is complete, the buffer is *flushed*, or written to an output device
This is to optimize output operations since writing to disk can take time
Buffers can be flushed in the following ways:
- The input buffer is full
- The library calls to read from the standard input
- Programmer makes a call to flush the buffer
It is important to flush output buffers thoughtfully to prevent too much build up in a buffer


# Questions
What's the difference between a header and a program file?

How is a buffer different than writing to disk?
