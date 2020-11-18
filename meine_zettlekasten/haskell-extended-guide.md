:haskell:

# Haskell Extended Guide

# Motivation
The other side of the survival guide. Maybe also a curation of particular files in a specific order.


# Installation
Taken from [haskell-installation](./haskell-installation.md)

This is a weird point. There's the Haskell Platform (HP) which a good chunk of people recommend, but a lot of people have reported problems using HP. It seems like the minimal set of tools needed are *GHC*, *Stack*, and *Cabal*. Installing Stack should install the others, or through the use of a tool called `ghcup`.

GHC is the compiler. GHCi is the REPL. Use `ghci` to access the REPL.
Some helpful commands:
- To load a file:
  * `ghci myFile.hs`
  * (in ghci) `> :load myFile.hs` -- shortcut = `:l`
- To reload a file within ghci: `ghci :reload` -- shortcut = `:r`
- `:i` to get **info** on a type/declaration/function
- `:t` to get **type** info on a declaration/function
- `:k` to get **kind** info on a function


# Compiling
To compile: `ghc <file>`.

Compiling outside of a Stack project is a bit weird. To compile a program that does not have language pragmas use `ghc -dynamic <file>`.
TODO Find out why
For programs with language pragmas outside of a Stack project use `ghc -dynamic -X<LanguagePragma> <file>`


# Principles
What is meant by principles? The conecpts required to reason about Haskell programs.

## Imutability
Everything in Haskell is **imutable** meaning once a variable is set, it doesn't change.

## Lazy Evaluation
Expressions are evaluated only when they are needed.
To picture the concept consider the following boolean expression (in pseudocode):
`f(a) and g(a)`
Normally a computer might get the values of `f(a)` and `g(a)` first before comparing their values, but with lazy evaluation

This enables Haskell to work with infinite lists. How? The list is enumerate
