== Expectations ==
This chapter seems like it will be a combination of the chapters in Learn You A Haskell For Great Good about lists and what you can do with/to them (at least up to chapter 8). I say that because the sections in this chapter imply an overall view on lists. I'm excited about the section titled "Spines and nonstrict evaluation". I never heard about spines before. I feel like that will be the main new thing I learn.

== Lists ==
Previously I've known lists as the basic building block/data structure of Haskell. Lists were structures which can hold numerous bits of information provided the bits were all of the same datatype. Here Lists are described as having "double duty": refer to a collection of values (what I previously knew) and providing an infinite series of values, thus acting as a data stream.

Highlighting chapter goals listed in the top (in the book's words):
- explain list's datatype and how to pattern match on lists
- practice many standard library functions for lists
- learn about the underlying representations of lists
- see what hte representations means for their evaluation
- exercises

== The list datatype ==
_Product types_ are datatypes that require two or more arguments to construct a value.
_Sum types_ are datatypes that can be multiple different values. The thing that sets sum types apart from product types is that their values can be one *or* another thing. The *or* is the important piece that indicates whether or not the type is a sum or not.
Example:
`data Bool = True | False` << Sum type
`data [] a = [] | a : [a]` << Sum AND Product type
The book says it will go more into this later, so I'll keep my eyes peeled.

The book has a *REALLY* good breakdown of a datatype in English so I'm including the whole thing here:
"
`data []  a   =  []  |   a : [a]`
--  [1] [2] [3] [4] [5]  [6]
1. The datatype with the type constructor []
2. takes in a single type constructor argument 'a'
3. at the term level can be constructed via
4. nullary constructor []
5. _or_ it can be constructed by
6. data constructor (:) which is a product of a value of the type a we mentioned in the type constructor _and_ a value of type [a], that is, "more list."
"

Lists in Haskell are akin to singly-linked lists.

== Using ranges to construct lists ==
`[1..10]` _is equivalent to_ `enumFromTo 1 10`
`[1,2..10]` _is equivalent to_ `enumFromThenTo 1 2 10`


== List comprehensions ==
List comprehensions originate from mathematics (set comprehensions).

_Predicate_ is a fancy name for functions used to filter ranges within list comprehensions.
Example:
`[x^2 | x <- [1..10], even x]` << `even x` is the predicate

== Spines and nonstrict evaluation ==
A _spine_ refers to the shape of a list. Remember how a list can be represented by all of its elements tied with the cons (:) symbol? (i.e. [1,2,3] = 1:2:3:[]) Below is how its visualized

  :<------|
 / \      |
1   :<----| This is the "spine"
   / \    |
  2   :<--|
     / \
    3   []
    
So spine is the series of cons going down in the above diagram.
Spines are used to talk about data structures.

GHCi's `:sprint` command can allow us to see a variable's evaluated state, but there are some quirks involved. Since Haskell's lazy and polymorphic values don't take shape until they're invoked, inspecting type variables may be problematic.

_Normal Form_ (NF) refers to an expression that has been evaluated to its full extent. Example: `(1, 2)`
_Weak Head Normal Form_ (WHNF) refers to an expression where at least the first data constructor has been evaluated, but maybe not everything else in the expression has been evaluated. Example: `(1, 1 + 1)`
NF implies WHNF too because at least the head, the first part of the expression, has been evaluated.
$¿$ Why is this useful ?
Anonymous functions are in NF because they cannot be reduced until an argument is applied. So `\x -> x * 3` is considered to be in NF.

>>One quote that just struck me (on spines/nonstrictness/evaluation): 
  _"We will be returning to this topic at various points in the book because developing intuition for Haskell's evaluation strategies takes time and practice."_
  
=== Exercises: Bottom Madness ===
1. Bottom (because undefined will be forced to evaluate)
2. Will return 1
3. Bottom
4. Will return 3
5. Bottom
6. Bottom? < it didn't! I guess it didn't evaluate undefine?
7. [] < This bottom'd. I'm a bit confused. It's like its OHHH nvm. It bottom'd because there was no previous even value to take
8. [1]
9. [1, 3]
10. Bottom
Now I understand, or at least feel like i do.

=== Intermission: Is it in normal form? ===
1. 1
2. 2
3. 2
4. 2
5. 3
6. 3
7. 3

I still don't get what they mean by neither. The example of neither given was string concatenation, but the ++ function was in the inside, the middle term, not the outtermost?

== Transforming lists of values ==
Another bit of nonstrictness was mentioned here. I'm really starting to see a correlation between nonstrictness, lazy evaluation, and examining data structures via `:sprint` or spines.
Take the expression `take 2 $ map (+1) [1, 2, undefined]` and note that this evaluates fine. The spine structure wouldn't really help us here since the whole list isn't being forced into evaluation, only the values `1` and `2`. Thus the spine would look like:

  :
 / \
1   :
   / \
  2   :
     / \
    _   _ < could be either [] or :
    
`:sprint` would only log `1:2:_`.
We only get a snippet instead of the big picture as to what's going on with this data structure.

=== Exercises: More Bottoms ===
1. Bottom
2. 2
3. Bottom
4. `itIsMystery` takes a string and checks wether each character is a vowel or not. It's type would be `[Char] -> [Bool]`
5. :
  a) the squares of 1-10
  b) [1, 10, 20]
  c) [15, 15, 15]

== Chapter Exercises ==
=== Caesar Cipher ===
*Context:*
Only shifting to the right for now

*Parameters:*
- Number of places to shift
- String to cipher

*Algorithm:*
- Take a letter of the string (assuming the input is a full string):
  - get its Ord number
  - subtract the Ord number of 'a' from it to get it in the range of 0-25
  - add the number of places to shift to the ord number
  - get the modulus of the sum divided by 25 (since there's 26 letters and we're starting at 0)
  - add the Ord number of 'a' to it
  - transform into a Char
- Repeat for each letter


=== Writing your own standard functions ===
Can you do shortcuts with booleans?
Let's say `f :: (Eq a) a -> Bool` can we say `if f then ...` instead of `if f == True then...`?


== Definitions ==
A _product type_ is a type made up of multiple types.
Why product? I'm not completely sure myself, but I think it has to do with this idea mentioned in the book of the a product type being "a type made of a set of types compounded over each other" with "compounding" exisiting "from each type argument to the data constructor representing a value that coexists with all other values simultaneously". I think the term compounding here is to imply an effect like layering things on top of one another.

A _sum type_ is a type that can be either one type or another.

_Product types_ and _sum types_ are from type theory.
Think of a _product type_ as a type made up of two or more other types joined by the word "and".
Think of a _sum type_ as a type made up of two or more other types joined by the word "or".

_Cons_ is used as a verb to say something a new list value has been added.
I like to think of it as "append".

A _cons cell_ refers to an individual element in a list.

A _spine_ refers to the "glue" that holds a list together. It's like the links to the values, but not the values themselves.

== Follow-up resources ==
=== Data.List documentation ===
I just skimmed through the documentation for Data.List. It's surprisingly clean and simple! At first I thought going through the documentation would be helpful in the middle of a problem as a means of exploring solutions, but there are some functions here which have caught my eye! Here are a few:

`(\\) :: Eq a -> [a] -> [a] -> [a]` - Returns all of the elements in the first array that do not appear in the second array.
And for its counterpar:
`union :: Eq a -> [a] -> [a] -> [a]` - Is like concatenating two lists, but any elements in the second list that are already in the first list are dropped.

There's also `nub :: Eq a => [a] -> [a]` which deletes duplicates in a list!

`find :: Foldable t => (a -> Bool) -> t a -> Maybe a` returns the first/leftmost result that meets the condition supplied via the function parameter. So it's like `filter` but just for one element!

All of the functions in the *Predicates* section were also interesting. You can search for a list within a list! So think of searching for substrings!

`break` and `span` seem helpful too. They take a predicate and a list and iterate through the list until the predicate is true. Think of them as filters operating on while loop. As soon as the predicate is not met or met (respective to break/span) the loop stops, and whatever values were collected are returned as the first part of a tuple. The second part would be the remainder of the original list.

OH AND I JUST DISCOVERED THERE'S A SYNOPSIS TAB THAT GIVES YOU THE TYPES FOR ALL OF THE FUNCTIONS LISTED ON THE PAGE!!! NEAT!!!!

I just re-iterated through the documentation while writing the above. I see why this activity was listed as a follow-up resource. There's a lot of fold functions here, which is the upcoming chapter's topic. Additionally, a lot of these fold functions we've implemented already, which is interesting. I'm guessing they're going to try to bridge the two together, folds and recursions on lists.
