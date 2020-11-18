:haskell:

# Newtype

Newtype is a way to create a datatype in Haskell.
It is limited by the fact that it can only take in one datatype after the type constructor.
Here's an example:
`newtype Order = Order Integer`
The above is saying we're creating a new type called `Order` and it is constructed by using the type constructor `Order` followed by a value of type `Integer`.

Why does this matter?
It matters because the constraint allows GHC to optimize the code further.
Additionally, people reading the type can infer the type is kind of like a wrapper around a basic type to provide more context.
Using the above as an example, we could've used a [[type-alias|type alias]] to say `type Order = Integer`, but then we would lose out on benefits like type checking against it.
What if there were other numerical types like `ZipCode` or `StreetNumber` that were also represented by `Integer`?
