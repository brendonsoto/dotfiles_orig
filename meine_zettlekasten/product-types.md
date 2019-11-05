# Product Types
:product-types:

Types combined with "and" are called *product types*.
An example in English would be:
- An Outfit type can be made of the types Pants and Shirt

An example in Haskell would be:
- `data Outfit = Outfit Pants Shirt`

The [[cardinality]] of product types is the product of the cardinality of the individual types.
So let's say we have the following:
```
data Pants = Jeans | Bellbottoms | Shorts
data Shirt = ButtonDown | Cotton
data Shoes = Birkenstock | Sneakers | Boots
data Outfit = Outfit Pants Shirt Shoes
```
The cardinality of `Outfit` would be 3 * 2 * 3 = 18 since `Pants` has three states, `Shirt` two, and `Shoes` three.

For common data types the cardinality might depend on the hardware.
For instance, `data Grade = Char Int` would be the cardinality of `Char` times the cardinality of `Int`.
Let's say the program is running on a 64-bit computer and that there are only 26 values for `Char`.
The cardinality would be 26 * 2^64.
