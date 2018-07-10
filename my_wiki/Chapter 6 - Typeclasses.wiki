Typeclasses and Types are stated to be opposites.
Typeclass declaraions explain how data is to be consumed or processed.
Type declarations explain how something is created.
Typeclasses are explained as interfaces (like in Java) to data consumed/processed by multiple datatypes.

Empty tuples are used as the return value of IO actions.
Since Haskell is a pure functional language, every function needs to return something, so the creators decided an empty tuple should be the return call.

$¿$I'm still a bit confused as to what `data Mood = Blah` is saying.
What's the difference between a data constructor and a data type?

== Exercises ==
=== Will They Work? ===
1. Yes because we're comparing the result of two identical functions meaning the types of the results will be the same.
2. Yes, same reasoning as above.
3. No because we're comparing two different types, string and Bool.
4. Yes because the results of the functions are the same type.


== Chapter Exercises ==
=== Multiple choice ===
1. c
2. a
3. a
4. a <- Incorrect, tuple
5. a

=== Does it typecheck? ===
1. The code will not typecheck because the Person datatype does not have an instance of Show.
2. I don't think this will typecheck because I'm guessing 'deriving' only applies to one of the data constructors?:
  - Oh, it's because Eq wasn't implemented.
  - I just tried adding back the Show typeclass. Turns out the `deriving` clause at the end applies for all constructors.
3. :
  a) Blah or Woot
  b) Error because there's no num instance implemented
  c) Error because Ord was not implemented
4. I think this will type typecheck because even though the datatype takes in four parameters, wouldn't s1 (the incomplete one) still compile, but look for another string to take in?:
  - It compiles, but s1 reports an error because not enough arguments have been applied.

=== Given a datatype declaration, what can we do? ===
1. Will not typecheck because we're missing Rocks and Yeah
2. Will typecheck because it properly implements Papu
3. Will typecheck because Papu implements Eq
4. Will not typecheck because we're missing an Ord instance

=== Match the types ===
1. I think we can replace the type because we're replacing a specific type for a general one and are simply assigning.
2. I think the substitution will work because Num is a superclass of Float < Incorrect, Fractional came out...
3. Now I think we can, based on the last one
4. Yes because RealFrac has an instance of float
5. Yes because the function isn't doing anything outside of restating what it is
6. Yes, but only for ints


== Definitions ==
_Typeclass inheritance_ is where one typeclass is composed of another. This importance of this is that typeclasses can be composed of other typeclasses meaning there's more functionality available. That also means that whatever is implementing the type needs to be of the parent typeclass too.

_Effects_ (Side Effects) are noticeable actions that happen outside of a program returning a value.

An _instance_ is the implementation of a typeclass.
