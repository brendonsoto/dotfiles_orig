= Algebraic Datatype =
Perhaps it's because I'm not necessarily math/comp-sci-minded, but understanding what is meant by the term algebraic datatype (ADT) took me quite some time.

From _Haskell from First Principles_ I understood algebraic datatypes to be a description of datatypes created from multiple types that are logically tied together in the style of ANDs and ORs. By this I provide two examples.

First, a type could be created that would be either one type OR another type. This is known as a sum type. Why sum instead of product or some other math term? This is where cardinality, or the number of possible values a type could have, of types come into play. Since a sum type is one type OR another the total number of possible values for the datatype is the number of values for the first type plus the number of values for the second type. Thus it is a sum of the cardinality of the two types.

As you can guess, the total number of possible values of product types can be seen by getting the product of the number of values per type involved in a datatype. So if you have the following datatype: `data myType = typeA typeB` where `typeA` has 3 possible values and `typeB` has 5, then we know `myType` has 15 different possible values.

The concept of sum and product types seemed pretty straight forward, but I still didn't get what the big deal of ADTs were until I ran into another article that was literally breaking down into a table all the different variations of a product type. Why is this a big deal? Because we can take advantage of pattern matching to dial into a more accurate picture of what we want to happen for each different combination of sub-types into your created datatype! It helps us reason about the number of possibilities of functions!


= Catamorphism =
A fancy way of saying a fold. Something that reduces a list of stuff into a single/different value.
