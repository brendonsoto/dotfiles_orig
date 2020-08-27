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
