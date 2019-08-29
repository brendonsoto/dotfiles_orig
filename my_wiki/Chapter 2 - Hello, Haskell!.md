Everything in Haskell is an expression or declaration.
Programs are basically BIG expressions. Expressions made out of other expressions.
_Normal form_ means an expression is at its most reduced/simplified state. It can't be reduced/simplified any more.

The _:info (:i)_ command in the GHCI can be used to find out:
- the type of a function
- its level of precedence (from a scale of 0-9, higher being more important)
- where it's defined
- whether it's left associative or not
- whether it's infix naturally or not

For example: `:i (*)` yields:
```
class Num a where
  ...
  (*) :: a -> a -> a
  ...
  	-- Defined in ‘GHC.Num’
infixl 7 *
```

The key line is the bottom: *infixl 7*
- infixl says the function is infix and left-associative
- 7 is how it ranks in the precedence scale
- the type part you know already from Learn You a Haskell...

Module syntax:
`module Name where`
`module` let's the compiler know the file is a module.
`Name` is just a placeholder for the name of the module. The name should be capitalized though.
`where` is Haskell syntax for describing the contents (expressions) of the module.

When writing Haskell, avoid trailing white space.
