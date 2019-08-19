= Elixir =
Going through the guide on the language site.

== Basic Types ==
*What is an atom/symbol?*
^ They seem similar to Ruby's symbols. Things that are literally what they're instantiated to be. For instance, `:hello` is a symbol and its own value together.
^ Fun fact! `true` and `false` in Elixir are atoms themselves!

*String interpolation:*
`v = "wolrd"; "hello #{v}" == "hello world"`

*Anonymous function:*
Anonymous functions here are a bit weird. They begin with `fn` and end with `end`.
`subtract = fn a, b -> a - b end`
I wonder why the `fn/end` keywords? They seem a bit silly.
Dots `.` are needed to call anonymous functions. So the above example would be called:
`subtract.(5, 5)`
Parenthesis aren't needed for functions, but they seem needed for anonymous functions.

Functions are first class! :D

*Arity* seems to be a big part of Elixir. You can check the arity of a function by using `is_function _func_, _num_`
i.e. `is_functional subtract, 2 == true`

*Lists* in Elixir are linked lists. Usual notation. More like Haskell where they can be of any values.
An interesting thing is that lists can not only be concatenated via `++`, but the first matching values can be removed using `--`. Try it!

*Tuples* are often used to return extra info from functions. Think of reading files or HTTP responses. 


== Basic operators ==
Boolean comparators are the words *and, not, or*, like Python.
There are also `||, &&, !` which can take any value. They will return `false` for `false/nil`.


== Pattern matching ==
There's Pattern matching!!
The equals sign `=` is the pattern matching syntax.
You can deconstruct tuples like so:
`{a, b, c} = {:hello, "world", 43}`
Pattern matching along what you're kind of used to:
`{:ok, result} = {:ok, 13}`
You can pattern match on lists:
`[a, b, c] = [1, 2, 3]`
You can match on head and tail!
`[head | tail] = [1, 2, 3]`
You can add things easily to a head/tail:
`[0 | list]`
The `^` character is used to "pin" a variable when pattern matching against it.
I see it as temporarily binding a variable. Say `x = 2`. Using `^x` is saying, "match on the previous value of `x`". Thus `{^x, y} = {2, 3}` will work, but not `{^x, y} = {3, 2}`.
You can use `_` to refer to values that don't matter! Like in Haskell!

