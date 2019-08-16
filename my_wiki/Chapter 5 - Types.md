== Things to check out ==
- System F - 1970's - typed lambda calculus
- Hindley-Milner system

== Exercises: Type Matching ==
1a = 2c
1b = 2d
1c = 2b 
1d = 2a
1e = 2e

== Manual currying and uncurrying ==
Uncurried functions are functions that are functions that take multiple arguments.
A way to "uncurry" a function in Haskell is to give it a tuple.
I.E. (+) = Num a :: a -> a -> a can be "uncurried" to be Num a :: (a, a) -> a

== Exercises: Type Arguments ==
¿I'm confused on 3.
`h :: (Num a, Num b) => a -> b -> b`
The type of `h 1.0 2` is `Num b => b`, but why?
I thought since `2` is an `Integer` it would default to that.
And even though the type is a `Num` why is it showing the type signature instead of just the type?
¿I'm confused on 7 too, but that follows the same principle as 3.

== Polymorphism ==
What's the difference between concrete, constrained polymorphic, and parameterically polymorphic?
Right now constrained polymorphism sounds like when you add a typeclass in a type signature like `f (Ord a) :: a -> a -> a` while unconstrained would be expressed using type variables like `f :: a -> a -> a`.

¿Once again the `id` function arises

_A subclass cannot override the methods of its superclass._

It turns out my guess above was correct. There's an interesting balance between concrete, constrained polymorphic, and parametrically polymorphic definitions. Parametrically poly. can be anything, but while that seems pretty broad it's actually restricting on the method level. Since it can be anything you don't know what functions are available to act on the parameter. 
I think this is why I would always get errors on my functions/type signatures where it was complaining about typeclasses missing from the signature. I think since it saw the type signature as being parametrically polymorphic it didn't want functions to operate on the parameters.
On the flip side, constrained polymorphic types are in the in-between zone. They can vary to a degree type wise, but since there's some constraint on them they also have access to some methods by default.
It makes me think of a shop where you need to show some sort of status or privelege in order to see certain items. Like in video games.

== Exercises: Parametricity ==
¿I'm confused on #2. What is meant by two implementations?
When I try `test :: a -> a -> a; test x y z = x + y + z` I get an error.
Ohhhhh. Nevermind, I get it now. I was doing the wrong thing.
I was using 3 arguments instead of just two.
Try this: `test :: a -> a -> a; test x y = x`
By two implementations, these are implied:
`test x y = x`
`test x y = y`
And from here if you were to try something like `test 1 'a'` an error would occur.

== Exercises: Apply Yourself ==
1. myConcat would take in arrays of Char instead of a. Plus it would drop an arg
2. I feel like myMult would change to take in a Fractional type. Yeah, it does.
3. myTake would look like `myTake :: Int -> [Char]`
4. myCom = `myCom (Ord a) :: a => a -> Bool`. This one was incorrect. The `length` function forces `a` to be an Int too.
5. myAlph = `myAlph :: Char -> Bool`

== Chapter Exercises ==
=== Multiple Choice ===
1. c
2. a
3. b
4. c

=== Determine the Type ===
1. :
  a) Num a -- Correct
  b) Tuple (Num, [Char]) -- close, it was Num a => (a, [Char])
  c) (Integer, [Char]) -- Correct
  d) Bool -- correct
  e) Num a => a -- close, it was Int
  f) Bool -- correct
2. Num -- correct
3. Num a => a -> a
4. Fractional a => a -> a -- close, it was Fractional a => a
5. [Char]

=== Does it compile? ===
Why are they showing function applicator without having explained it first?
1. I am prediciting bignum will throw an error because we're applying `10` to `5`, neither being a function. Even with corrected syntax `bigNum` would throw an error because of the same issue.:
  - I was wrong. bigNum turned out fine. I think wahoo will fail though. And it did. Fixed it by introducing a parameter in `bigNum` and replacing `10` with the param
2. I think all will work. `x = print` is saying use `x` as an alias for `print`. Correct. Nothing failed.
3. These expressions will fail because we're trying to apply a number to another number. The fix would be to swap `a` and `b`. Correct.
4. This would not work because c is never defined. It wouldn't work in ghci because we would need to define b before a.

=== Type variable or specific type constructor? ===
1. fully, fully, concrete, concrete -- wrong, forgot to read the type sig.
2. concrete, concrete?
3. fully, constrained, concrete (since it's capitalized?)
4. fully, fully, concrete

=== Write a type signature ===
*Doing in GHCi*

=== Given a type, write the function ===
*Doing in GHCi*

=== Fix it ===
In source files.

=== Type kwon do ===
Doing in GHCi


== Definitions ==
_Polymorphism_ is when a variable can be of multiple types. The variable gets its type from the context surrounding it.
In Haskell it's possible for a variable to be either *parametrically* polymorphic, meaning it can represent any type, or *constrained/Ad-hoc* polymorphic, meaning it can be any type as long as it implements what the constraints demand.
For instance:

*parameterically polymorphic:*
`reverse :: [a] -> [a]`
`a` can be any type. We can input a list of strings, chars, anything!

*constrained/Ad-hoc polymorphic:*
`doSomething (Ord a) :: [a] -> [a]`
Here `a` can be any type that *implements the Ord typeclass*. Any value given to the function that does not come from Ord will throw an error.

_Type inference_ is what it sounds like. Haskell can infer types based on what's given. The importance of this is that it allows us to program without explicitly writing type signatures or specific types in a type signature.
I.E.:
A function like `f :: a -> b -> a` will infer `a` to be of type `Num` when given the argument `1`.

_Type variables_ are placeholders for types. I.E.:
`reverse :: [a] -> [a]`
We're reusing the same example, but we see that `a` is our placeholder/type variable.

A _typeclass_ is like a blueprint for functionality to be implemented in types that are similar. An example would be the functions in the `Num` typeclass. There are numerous number-related classes such as `Int`, `Integer`, `Float`, `Double`, etc. They're all numbers, so we expect to be able to do the same sort of arithmetic for each. If we didn't have typeclasses then we would have to redefine simple functions like addition (`+`) and so on for each. Typeclasses are a way to describe common functions in general terms to be state more explicitly in types implementing the typeclass.

