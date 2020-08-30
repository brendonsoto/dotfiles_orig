# Contents

- [A Type Of Programming](#A Type Of Programming)
  - [1. Computers](#A Type Of Programming#1. Computers)
  - [2. Dare](#A Type Of Programming#2. Dare)
  - [3. Machines](#A Type Of Programming#3. Machines)
  - [4. Programs](#A Type Of Programming#4. Programs)
  - [5. Types](#A Type Of Programming#5. Types)
  - [6. Names](#A Type Of Programming#6. Names)
  - [7. Expressions](#A Type Of Programming#7. Expressions)
  - [8. Runtime](#A Type Of Programming#8. Runtime)
  - [9. Function application](#A Type Of Programming#9. Function application)
  - [10. Perspective](#A Type Of Programming#10. Perspective)

:books:haskell:

# A Type Of Programming

## 1. Computers
tl;dr - This book will be about thinking about programming and language as a way to reason about computers using Haskell.

A short discussion on how computers have a limited vocabulary and how this limited vocabulary is not ideal for reasoning about computer programs. Also mentions how this book is not necessarily on Haskell. It's on programming, but using Haskell as a lens for thinking about programming. Finally, the author urges *patience* since the book takes its time to talk about topics with the hopes of developing long lasting knowledge.

## 2. Dare
tl;dr - A bit of courage is needed to break the cycle of bouncing back and forth between knowing the limits of a language and figuring otu the scope of the problem to be solved.

This chapter opens up by describing a cycle of programming. We think about what problems can be solved by programming, but we also think we need to know the limits of the programs/languages we use. The author goes to say this is why it's hard to appreciate new ideas. We don't acknowledge this loop, whether we're aware of it or not. To break out of it takes courage to try, to go into the unknown. The author ties up the chapter by asking why care? why this effort? Because more and more of the world is being tied to programming so to speak the language of programs will be a way to have control and a say in our world.

## 3. Machines
tl;dr - What sets computers apart from other machines is that they can be configured to do different things without changing the machine itself.

Hardware such as phones and elevators are used as examples to think about the nature of machines. Machines interact with the environment in some way. There is some input and the machine responds with some output. The composition of these machines are different and are made for a singular purpose despite operating with the same foundation (electricity, wires, components, etc). Computers are then mentioned as *general purpose machines* which addresses the issue of being able to do different things with a common foundation.

## 4. Programs
tl;dr - Programs generally take an input and deliver some output.

NOTE: "such as that Haskell thing we mentioned before." - I love this for some reason

NOTE: I think the author's high level notation for programs is very interesting
(`program :: input -> output`). Having learned a little Haskell I know the high level overview of a function follows a simialar format: `funcName :: inType -> outType`. I think what the author has done is a clever way of introducing a convention without directly stating it.

We begin with a reiteration of the general use of computers through different programs. Prose is brought in to begin a discussion on conveying ideas. The ambiguouity of prose is brought up and labeled unsuitable for programs. The concept of programming languages is mentioned as the alternative to prose for programs. The author mentions Haskell is used because its syntax has a lot of similarities with the way we think about code, using the `program :: input -> output` example. Compilers are then mentioned as the bridge between us, programming languages, and computers.

## 5. Types
tl;dr - Types help us reason about what we'll get out of a function/program with certain input.

This chapter explores the idea of what exactly *is* input and output in regards to a program. The discussion brought in the idea of **types** to reason about what is happening within the program. The scope of the program was limited to just the simplest program involving some form where what is put in is what you get out (the identity function). The chapter was tied up by mentioning the difference between a program and a function.

## 6. Names
tl;dr - Types alone are not enough to reason about programs, hence the importance of meaningful names.

No paragraph summary here since the tl;dr explains the chapter.

## 7. Expressions
tl;dr - Expressions form the instructions for computers to use.

Expressions form the instructions for the computer. Types and naming are for us to better reason about programs. Together they help us reason further about programs/functions by allowing us to describe programs/functions as so: "This function, which takes type x and returns type x, is equal to the expression ...".

I thought it was interesting that anonymous functions/lambda expressions (i.e. `\x -> x + 1`) were used instead of a function with a parameter, but I guess the author is building up to that.

## 8. Runtime
tl;dr - Runtime is where the expressions written deal with the unknown input.

This chapter mentions how type-checking happens at a different time than compilation and how if the former fails, the latter fails too. Runtime is used to label the lifetime of a program, when the program is actually running. The importance of it is that it's the time when the expressions are exposed to unknown input and react to it. We end with a note on the importance of naming given how often we cannot see the guts of a function (at least without going into the source).

## 9. Function application
tl;dr - To apply a value/expression/term to a function put the v/e/t next to the function name (i.e. `add_one 3`)

No need for a lengthy summary. Other interesting note is how the author mentions value, expression, and term all mean the same and the reason why is unknown.

## 10. Perspective
tl;dr - The type checker and names/expressions offer different *perspectives* of the same thing, the output of a function.

I thought the examples the author gave are really interesting, saying `four = add_one 3` and `four :: Natural` are two definitions that are in harmony, that mean the same thing but from different perspectives.

## 11. Beta-reduction
tl;dr - Beta-reduction is the process of applying parameters/inputs to a function and replacing any placeholders with the values.

## 12. Parameters
tl;dr - To add to the concepts to balance in programming there's the balance between the different types of simple, parameters being an example of such (think adding one X amount of times to get a number vs adding Y + Z).

NOTE: Quote I really like:
> "What may be simple from a conceptual point of view, where we pay attention to the meaning and essence of things, might not be simple from *economic* or *ergonomic* perspectives, and vice-versa"

## 13. Datatypes
tl;dr - How to create a datatype in Haskell, using sum types as an example via the seasons.


## 14. Pattern matching
