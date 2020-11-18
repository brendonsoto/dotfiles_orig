:haskell:

# Survival Guide
A quick and dirty reference for Haskell

# Installation
Look into `ghcup` for a convenient solution.
Needed:
- GHC
- Stack
- Cabal

# REPL
GHCi is the REPL
Run `ghci`

To load a file:
- `ghci myFile.hs`
- (in ghci) `> :load myFile.hs` -- shortcut = `:l`

To reload a file within ghci: `ghci :reload` -- shortcut = `:r`


# Syntax
## Comments
Comments begin with `--``
`-- This is a comment`

## Variables
Remember, variables are immutable
`one = 1`
`greeting = "hello"`
`myList = [1, 2, 3]`

## Functions
Simple:
`inc x = x + 1`

Higher Order:
`f g x = g x`

Lambda Expressions/Anonymous Functions:
`(\x -> x + 1)`
`double = (\x -> x * 2)`

## Datatypes
Simple:
`data Car = MkCar String Int -- a Car with a name (String) and idk, year (Int)`

Quick info:
- The name next to `data` is called the *data constructor*
- The name `MkCar` is called the *type constructor*
- It's more common to see the type constructor have the same name as the data constructor:
  - `data Person = Person String Int -- Name + Age`
  - (in ghci): `me = Person Brendon 27; :t me -- Results in Person`


## Pattern Matching
Simple pattern matching example based on numbers
```
f :: Int -> String
f 0 = "Zero"
f 1 = "One"
f _ = "Something greater than One"
```


# Typeclasses
## Implementing a Typeclass
```
instance <TypeClass> <DataType> where
  (function) = ...
```

Here's an example implementing `EQ` for `Bool`o
```
instance EQ Bool where
  (==) True True = True
  (==) False False = True
  (==) _ _ = False
```

If we wanted to treat `==` as an infix operator the above would look like
```
instance EQ Bool where
  True == True = True
  False == False = True
  _ == _ = False
```


# Specific Functions
## Foldl
Think `for` loop, think Nicta/Data61 course.

## Foldr
Think *constructor replacement*, think Nicta/Data61 course.
