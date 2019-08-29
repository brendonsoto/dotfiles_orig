The type `IO ()` is needed when you want to print stuff to the screen.
This is because any I/O operations are considered side effects.
The chapter doesn't go into much detail yet about it...

The `do` keyword is a way to string several expressions together sequentially.
Take the file $print2.hs$ for instance. The main function has a `do` statement followed by four printing functions.

Just as a note: there was a snippet in the chapter to compare the types of `++` and `concat` where `concat` returned a type signature different than the one listed in the book (`Foldable t` vs `[[a]]`). The book acknowledged this difference, but mentioned, for now, to think of Foldable as a list of lists.

For type signatures like `[a] -> [a] -> [a]` the type variable (`a`) is considered _polymorphic_ since it can take on any type. This is the big idea behind _polymorphism_: values that can change depending on the given context.

A real interesting note made was how the standard list functions (i.e. head, tail, take, etc.) are considered *unsafe* because they do not handle empty lists. The authors mentioned alternatives will be discussed later, but it just seems so odd and interesting that the fundamentals are considered unsafe for production code.
