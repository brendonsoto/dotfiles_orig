It may be worthwhile checking out $set theory$ and $type theory$ (in that order). Apparently set theory may help in gaining intuition about types in Haskell easier.

Fractional numbers section mentions almost never want float except for graphics programming? Why this case?  why not use other more precise and drop float altogether?
I guess historical reasons?

How come when when using where statements any multiline assignments, the value/expression has to be indented past what the where variable name is?

NOTE: In Chapter 4 exercises, correcting syntax #2, a lambda expression is hinted at. Is this intentional? Lambda functions have not appeared earlier in the book.


@Definitions - The data constructors bit I felt a little hazy on. They have their own data types defined (i.e. `type Name = String \n data Pet = Cat | Name`) followed by checking the types in the REPL (i.e. `:t Cat = Cat :: Pet \n :t Dog = Dog :: Name -> Pet`) and this makes me feel a bit more confused.
I feel like either the custom types should have been introduced later or more details should've been given about custom types now.

*Type alias* is using the the `type` keyword to refer to another known type for brevity. I.E. `type Name = String`


