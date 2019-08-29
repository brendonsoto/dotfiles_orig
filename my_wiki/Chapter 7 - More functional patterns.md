## Begininng to 7.3
Lexical scoping is defined nice and simple here. To quote:
"Lexical scoping means that resolving the value for a named entity depends on the location in the code and the lexical content,..."
In other words, lexical scoping means the context of a variable must be taken into account when trying to determine what that variable is.

Currently I am at the *Anonymous functions* section and had an idea.
In an attempt to use what I learned in the _A Mind for Numbers_ book I'm going to look at the section headers for this chapter and write down what I expect this chapter (or the remainder of it) to be.

I'm excited for this chapter! Finally pattern matching, guards, higher order functions, function composition, and more is to be explained!
The section titles imply a dive into learning more the syntax needed for creating functions that can branch out. More interesting control flow functions.
Questions I have going forward:
- What exactly is meant by "pointfree style"?
- What separates cases from guards?

Side note (still at *Anonymous functions*): I noticed the authors just introduced the `:{ .. :}` syntax for GHCi. I feel like this, or at least delving into using `:h` for help, would've been useful a few chapters ago.

### Exercises: Grab Bag
1. All of th expressions are equivalent
2. Did in GHCi
3. Did in GHCi


## Pattern Matching
*Data constructors* were mentioned again! Not much more information was revealed outside of _data constructors_ being _values_. Quote:
"There is a reason we describe values as "data _constructors_", although we haven't explored that much yet."
I am glad to know the book will let onto why data constructors are called constructors. I just wish all of this leading on was explained a little more in the beginning.

_Data constructors are synonomous with values because_ data constructors can be functions that return a value!
Take for instance the type: `RegisteredUser :: Username -> AccountNumber -> User`
It needs a `Username` and an `AccountNumber` in order to spit out a value (`User`). Once given, the value is `User` while the type is `RegisteredUser`.

### Exercises: Variety Pack
1. :
  a) k :: (a, b) -> a
  b) [Char], no because the others are an Int or Num
  c) k3
2. Doing in GHCi

## Case expressions
_IMPORTANT DIAGRAM_:
`data Bool # False | True`
In the above, `Bool` _is the type constructor_. When you ask for the type of either `False` or `True`, `Bool` will appear. `False` and `True` _are the data constructors_.

That cleared up a lot for me.

Also, _sum type_ refers to a *type* with *multiple data constructors*.
$¿$ Why are they labeled differently?

### Exercises: Artful Dodgy
1. 11
2. 22
3. 21
4. 12
5. 11
6. 21
7. 21
8. 22
9. 31
10. 23

## Guards

## Function composition
I don't know why I didn't think of this before, but looking at the type signature (which the book provided) actually helped make the meaning of the function composition operator (.) a lot clearer.
The type signature is `(.) :: (b -> c) -> (a -> b) -> a -> c`
So to state it in English, the function composition operator takes two functions and a value. The first function provides the desired type of the output, but takes in a different type for its input. This different input is supplied by the next function which uses the third argument as its input. So it's like saying mathematically $ z # yToZ(xToY x)$. Thus why there's always the example of `f . g x # f(g(x))`, or `(f . g) x # f (g x)`.

## Pointfree style
_Pointfree style_ is the composition of functions without referencing arguments. *Point* does not refer to the dot/function composition operator (`.`), but rather to the argument itself. Thus *pointfree* is like saying "free of arguments". I think this is kind of stupid and confusing.
An important bit from the book:
"...pointfree code...helps the reader focus on the _functions_ rather than the data that is being shuffled around."

$¿$ Are lambda/anonymous functions considered part of point-style?
$¿$ Is `do` the only way to call functions in sequential order? Why is `do` considered dangerous?

## Chapter Exercises
### Multiple choice
1. d
2. Isn't this problematic? Nevermind, I just did it in GHCi and figured out where my thinking was wrong.
3. d
4. b
5. a

### Lets write code
confused on # 6.


## Definitions
_Binding_/_Bound_ implies a connection between an argument and a parameter.

_Anonymous function_ is a function that is not bound to an identifier.

_Currying_ is splitting up a function that takes multiple arguments into functions, each taking one argument and returning one value, and stringing them together.

_Pattern matching_ is a way to control the flow of a function by saying what the output should be for a specific input. IT'S GREAT! Pattern matching relies on data.

$¿$ What are product types and what separates them from sum types?

_Bottom_ is not a value, but it signifies that a program cannot return anything.

_Higher order functions_ are functions that either take in a function as an argument or return a new function.

_Composition_ and _Pointfree_ are defined above.


Idea: Imagine making an "online book" which would be a graph of articles about a subject. Any references to other inner articles would be represented by anchor links. Instead of having a linear progression, readers could form their own way of understanding stuff by clicking on links and reading at their own progression!
Let's say there are 10 topics (A, B, C...). I could read the "book" in the following manner, A, C, B, D... , while someone else could maybe read it like, A, D, F, C, B, G....
This is more of a problem for me where I like to skip around everywhere because I'm curious about everything at once.
Each article/section/node/whatever could have a short definition at the top, and then the body of the article could be more in depth of it.
This is also kind of like Ted Nelson's idea of hypertext.
It could have a single page/node view and a multi node view to see the "links" between the spots.
It could highlight the sentence of the previous node where you clicked the hyperlink.
