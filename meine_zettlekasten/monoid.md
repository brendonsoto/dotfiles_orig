# Monoid
:monoid:

A monoid is a type class used to combine things.
It is very similar to the [semigroup](semigroup) type class.
The monoid class has three things to implement (as opposed to semigroup's `<>`):
- `mempty`
- `mappend`
- `mconcat`

`mempty` is a transparent value.
When you combine something with `mempty` it is expected to receive the something back unchanged.
It provides identity laws (think identity function) to the class.
It is needed to implement `mconcat` (discussed below).

`mappend` is how to combine two values.
It is no different than semigroup's `<>` function.

`mconcat` is a function to combine a list of data types together.
It is essentially a fold function using `mempty` as its base.
Why `mempty`?
This is where we can take advantage of the identity property!
Since we may not know what value can be used to find the identity of something we have this part of the type class to represent it!
For a more concrete example, think of addition.
Zero is the value to be used in identity functions because anything plus zero is the original number.
So `mempty` is like abstracting out the helpfulness of zero in addition.
