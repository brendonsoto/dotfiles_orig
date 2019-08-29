# Programming Paradigms for Dummies
**What Every Programmer Should Know** by Peter Van Roy

The intro says how the paper will go over different programming paradigms and their uses.


## Introduction
Different problems call for different concepts in the solutions, thus an ideal programming language should allow for multiple paradigms to be used. Each paradigm is best for a certain application, so that should be used when solving programming problems!


## Languages, paradigms, and concepts
There's a graphic that shows multiple paradigms, each connected by arrows representing the addition of a concept, and the programming languages featuring the paradigms. It is really interesting seeing this overlay, but this graph is the work of the author's. I am a bit skeptical on some claims, like how some paradigms that are perceived as radically different are often different in one concept. He uses the example of functional vs object oriented programming for this. On the graphic, they differ only by OOP having the concept of cell/state (I guess that means individual state?) involved.

Within the same section, just before Observable nondeterminism, the author mentions "The language's kernel language should support the paradigm". What does *kernel language* mean?

### Taxonomy of programming paradigms
#### Observable nondeterminism
*Nondeterminism* is when the program allows the computer to make a decision, an action the computer takes that's not defined by the user. In other words, it seems to be an *unpure* function. An example of observable nondeterminism is the race condition. Depending on the execution order you can get different results for the same set of inputs.

I am a bit confused because the author states observable nondeterminism is used to model real-world and concurrent problems. Haskell can be used for both, but it handles concurrent programming differently. Or does it? I have not actually done any concurrent programming in Haskell, so I can't tell, but people do tout of Haskell's ability to do concurrent programming declaratively resulting in a somewhat pure function.

I guess nondeterminism is stated as useful for real-world/concurrent programming because, just like the real-world, you don't know when things will happen? But can't this also be a form of reactive or event-driven programming?

#### Named State
Named state simply refers to the ability to store information in some way, to have a history of the data within a program.

### Computer programming and system design
Computer science is helping further define the boundaries that a computer can either represesnt a complex machine, complex defined as how many basic features the system can support and combine, or simulations to make sense of randomness.

Since large programs can be achieved with languages, the languages at use are seen as ways to explore complexity objectively. This is where the science comes in, trying to dissect the languages.

### Creative extension principle
To me, the gist of the creative extension principle is an exploratory process. It is when the paradigm applied for a certain problem causes technical problems unrelated to the main problem being solved for. This is a hint that adding a feature to the paradigm may create something new that would facilitate solving the particular problem! It's a form of synthesis!


## Designing a language and its programs
### Langauges that support two paradigms
This group of languages utilize two paradigms by having one for smaller, more frequent problems and the other for large projects.

### A definitive programming language
Here the author discusses four languages that support multiple paradigms, but were created for different problems. A point of interest is that all four languages share a lot of similarities in terms of paradigms. They all share at least three out of four paradigms and the implementation is very similar between them.

I believe the author predicts languages will move towards implementing the paradigms shown in the above four. An oversimplification would be languages will first off support functional programming and then implement some form of concurrency (with a slight emphasis on message passing concurrency).

### Architecture of self-sufficient systems
Self-sufficent systems are declared as needing three things:
- closures (base)
- message passing concurrency (to indicate to the system itself when actions are taken)
- named state (to update subcomponents itself)

Feedback loops need to be set up in order for the system to monitor itself. These feedback loops will have feedback loops themselves. These sub loops could either be just two loops sharing the same space/context or one loop managing the other, or a combo!


## Programming Concepts
### Record
The record is as you think of records in Haskell or objects in JavaScript or dicts in Python or Ruby. They encapsulate several properties that each contain data of certain datatypes. They are fundamental and a lot of other things can be derived from them (like arrays, lists, strings, trees, hash tables).

### Lexically scoped closure
Closures help with preserving context (like bringing part of a context within the execution of another context) or modularity/repeatability (like currying!). Closures enable a lot of things, like creating objects, separating concerns, or working within a module system all thanks to higher order functions!

### Independence (concurrency)
"Concurrency is a language concept and parrallelism is a hardware concept."

Processes differ from threads by being more competetive in regards to resource management. Processes each try to use up as much CPU as possible so the OS has to manage dividing resources to each appropriately. Threads all work for the same goal so they aren't as aggresive as processes.

Two popular styles of concurrency are *shared-state concurrency* and *message-passing concurrency*.

Shared-state concurrency is where threads share memory. Special constrol structures are used to update the memory. This is popular in languages like Java and C#. Shared-state concurrency is also observed in transactional/db languages like SQL.

Message-passing concurrency is where individual threads send each other messages. Erlang is of this paradigm.

### Named state
State is analogous to history, memory, some way of remembering what has existed in the program.

The author talks about time and how things change with time. He also states how functional programming does not deal with time and how in the real world not much shares the timeless qualities of functions. While this is all true, I am a bit skeptical. Time is useful in some applications, but not every program needs to keep history. It is a nice feature, but can't we also enable a program to grow itself by continually adding onto what already exists? Is this not what organisms do too? Nothing in life can go backwards in time so isn't history more of a plus that can is part of the group of few things to be found naturally in programming?

#### Named state and modularity
I'm still a bit uncertain of the usefulness of named state. I don't understand the author's example of how adding the named state makes it modular. I feel like having no named state, like the original implementation in the example, is more modular because it allows the implementation to exist in different contexts where the context can have its own state to tackle the particular problem at hand. I know this still refers to state, but state could also be expressed as a higher-order function, the state could be an immutable value. It would be simply returning new records upon iterations with updated values instead of modifying an existing record.


## Data abstraction
Think of data abstractions as containers for data structures with only a few openings to tinker with the inner structures. This is ideal because 1) it can guarantee safety by limiting the operations possible on the structures, 2) make the program easier to understand and build since you're separating out functionality, and 3) possible to use as a building block for larger programs.

Polymorphism and inheritance are two means of data abstraction.

### Objects and abstract data types
The author states "[t]here are four main ways to to organize data abstractions, organized along two axes. The first axis is *state*... The second axis is *bundling*: does the abstraction fuse data and operations into a single entity [objects]".

At the quadrant of state + bundling is an object where at stateless + no bundling is an abstract data type.

### Polymorphism and the responsability principle
Polymorphism is described as usual: an entity/function that's able to take in arguments of different types.

### Inheritance and the substitution principle
I need to be aware of my bias because I think inheritance is evil.

I do have to give the author kudos. He highlights the advantage of sharing commonalities via inheritance, but goes one further by saying to use inheritance with care and then goes even another one further by saying composition is a viable alternative.

The substitution principle is if inheritance is to be used, any function that uses the extended class must also work for the inherited/parent class too.


## Deterministic concurrent programming
### Avoiding nondeterminism in a concurrent program
Isolate the nondeterministic parts and then make the language deterministic.

There are paradigms that achieve this:

#### Declarative concurrency (monotonic dataflow)
Declarative concurrency is where the inputs and outputs are all deterministic. Guess this means everything has to be known about the I/O and that all has to be communicated in the code.

#### Functional reactive programming (continuous synchronous programming)
In FRP, the program is still a function, but the arguments are nondeterministic and are the only nondeterministic parts of the program. The program recalculates the changes and then propogates the changes to the output.

#### Discrete synchronous programming
Discrete synchronous programming is very similar to FRP with the main difference being the former treats time as discrete steps instead of a continuous stream, which is what FRP does. This makes programming concurrency simpler as everything is contained within discrete steps. It's like digital circuits versus analog circuits.

#### Deterministic concurrency and computer music
Deterministic concurrency can involve the following features:
- lazy evaluation
- demand driven (seems like event-driven, i.e. you press a thing and that triggers other things to happen)
- continuous instead of discrete representation of time
- Max/MSP is an example!

### Declarative concurrency [6.2, not part of Avoiding nondet...]
So declarative programming has a foundation in functional programming, but adds threads, independent sequences of instructions to be executed, and dataflow variables, which acts as a signal manager for the threads.

Threads have the basic blueprint consisting of just a function to create a thread.

Dataflow variables have three functions in their blueprint:
- Instantiate the variable to a value
- Bind the variable to a value
- A wait command that tells a thread to wait for the variable to be assigned before continuing

This enables programs to wait until data is available to them and then execute.

#### Lazy declarative concurrency
Laziness can be implemented by adding by-need synchronization to the previous paradigm. The by-need part just enables functions to only execute when they need to by using the dataflow variable "wait" function to explicitly state in the function to wait until a variable is bound.

#### Declarative concurrency and multi-core processors
With multiple processors parallel programming is now mainstream. It's impossible to simply make a process a parallel process without the programmer stating so. It is up to the language to make this process easy. Shared-state languages like Java and C++ unfortunately fall flat of this. This is where declarative/functional programming shines.


## Constraint programming
Constraint programming is defining boundaries for a problem in terms of variables and telling the computer to find the variables that solve for x. There is an emphasis on the programmer to *model* the situation rather than the solution.

I skimmed over the rest of the section because constraint programming seems cool, but the explanation and application kind of goes over my head.
