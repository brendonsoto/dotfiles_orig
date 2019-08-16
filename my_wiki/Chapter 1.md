Huh. I had no idea that calculus can have different facets. I thought caluclus was simply calculus, a branch of mathematics itself, but this chapter has taught me that there are different types of calculus, lambda being one. Previously I thought lambda calc was just a subsection of calculus as a whole. Good start! 👍

One of the opening questions is "What is functional programming". Here I am going to attempt to re-explain "what is functional programming" in simpler language:

  Functional programming is a way to create computer programs. It is based on mathematical functions. Programs created this way are made up of _expressions_ which can be specific values, variables (values that can change) , or functions.
  Functions are a little different from the other types of expressions. They can be _evaluated_ or _reduced_. This means functions can produce other results. Another funny way to describe functions is by saying they are *first-class*. What this means is that functions can be used in different places. They can stand by themselves as values or be used as inputs to other functions.
  Personally I think the term is a bit silly. When I hear "first-class" I think about airplanes and how "first-class" passengers get special seats and treats. Hearing that a function is "first-class" makes me think that functions would have special access to things or maybe be processed first. The actual definition of "first-class functions" seems to me to say functions can be put in more places than a variable. Right now I think it would be better to simply say "functions can be used as values or inputs to other functions" instead of "first-class", but the chapter does say the terms will be defined more carefully as the chapter progresses (I'm only on page 2).
  Side note: Yeah, I do think I should reevaluate their description of "first-class" later because they briefly threw the term "pure" out to describe the language, but in a different way than I'm used to (they say Haskell is pure because its features are translatable to lambda expressions whereas some languages have features which are not translatable) [- still on page 2 lol].
  ^ Nevermind! They just used the definition I'm used to in the preceding paragraph (for the same input you'll get the same output)
  In lambda land functions are known as _abstractions_. Abstractions have two key pieces: a *head* and a *body*. The head is the part with the lambda symbol next to it (looks like an upside-down y). Whatever symbol is next to the lambda is your input argument. This argument should appear in the body as well. It is the entry point for values into the function, kind of like a placeholder. It's like algebra.
  Lambda abstractions are _anonymous functions_.
  Here's an example of a lambda abstraction (swapping out lambda for \):
  \x.x
  \x = head
  . = separator of head and body
  last x = body
  Abstractions are called abstractions because their goal is to generalize or abstract the concept being used so they can be applied in multiple spots.
  _Beta Reduction_ is the process of applying an argument to an abstraction. In other words, it's replacing all of the argument symbols in the body with the argument and evaluate. The act of replacing the original symbols for arguments is expressed using the following syntax:
  x := y
  The *:=* says "replace all instances of x in the abstraction body with y".
  _Free variables_ are variables in the body of an abstraction that are *not* declared in the head. Example:
  \x.xy
  _Alpha equivalence_ is a name used to describe two abstractions that produce the same result. They can have different symbols in the head, but if the overall structure of the body is the same, then the two are said to be equivalent. Example:
  \x.x is equivalent to \y.y
  \x.x*2+5 is equivalent to \y.y*2+b
  \x.xa is *not* equivalent to \y.yb because the free variable is different
  
  My answers to Intermission exercises: 1) b 2) c 3) b
  
  _Combinators_ are abstractions/functions with no free variables. They just *combine* whatever's given to them!
  One thing I forgot to include is that abstractions/functions are *left associative*. What this means is that you take what's on the right side of the function (the body) and apply it to the left side (the head). To display it:
  f . g x = f( g( x ) )
  A more clear example from the book would be (starting from page 8):
  (\x.x)(\y.y)z = ((\x.x)(\y.y))z
  > [x := (\y.y)]
  = (\y.y)z
  > [y := z]
  = z
  See how symbols were grouped and reduced from the left to the right? That's what's meant by left associative.

== Chapter Exercises ==
=== Combinators ===
1. Yes
2. No
3. Yes
4. Yes
5. No
=== Normal form or diverge? ===
1. Yes
2. (\z.zz)(\y.yy) => (\y.yy)(\y.yy) => (\y.yy)(\y.yy)... NO
3. Yes
=== Beta Reduce ===
1. (\abc.cba)zz(\wv.w)
First, rewriting the above as:
= (\a.\b.\c.cba) z z (\wv.w)
^the spaces help me think
So now to reduce the first argument:
> [a := z]
= (\bc.cbz) z (\wv.w)
> [b := z]
= (\c.czz) (\wv.w)
> [c := (\wv.w)]
= (\wv.w)zz
> [w := z]
= (\v.z)z
> [v := z]
= z

2. (\x.\y.xyy)(\a.a)b
> [x := (\a.a)]
= (\y.(\a.a)yy)b
> [a := y] << *NOTE* In the book, the outer part was evaluated first
= (\y.yy)b
> [y := b]
= bb

3. (\y.y)(\x.xx)(\z.zq)
> [y := (\x.xx)]
= (\x.xx)(\z.zq)
> [x := (\z.zq)]
= (\z.zq)(\z.zq)
> [z := (\z.zq)]
= (\z.zq)q
> [z := q]
= qq

4. (\z.z)(\z.zz)(\z.zy)
> [ z := (\z.zz) ]
= (\z.zz)(\z.zy)
> [ z := (\z.zy) ]
= (\z.zy)(\z.zy)
> [ z := (\z.zy) ]
= (\z.zy)y
> [ z := y ]
= yy

5. (\x.\y.xyy)(\y.y)y
> [ x := (\y.y) ]
= (\y.(\y.y)yy)y
> [ y := y ]
= (\y.y)yy
> [ y := y ]
= yy

6. (\a.aa)(\b.ba)c
> [ a := (\b.ba) ]
= (\b.ba)(\b.ba)c
> [ b := (\b.ba) ]
= (\b.ba)ac
> [ b := a ]
= aac

7. (\xyz.xz(yz))(\x.z)(\x.a)
> [ x := (\x.z) ]
= (\yz.(\x.z)z(yz))(\x.a)
> [ y := (\x.a) ]
= (\z.(\x.z)z((\x.a)z))
> [ x := z ] << the second \x << *NOTE* I did it opposite of book
= (\z.(\x.z)z(a))
> [ x:= z ]
= (\z.za)


