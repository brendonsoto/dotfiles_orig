# Sum Types
:sum-types:

Types combine with "or" are called *sum types*.
An example in English would be:
- A Commute type can be made of the types Bike or PublicTransport or Walk

An example in Haskell would be:
- `data Commute = Bike | PublicTransport | Walk`

The [[cardinality]] of sum types is the sum of the cardinality of the individual types.
So let's say we have the following:
```
data Bike = Fixed | Single | Tandem
data PublicTransport = Bus | Train
data Walk = Walk
data Commute = Bike | PublicTransport | Walk
```
The cardinality of `Commute` would be six since `Bike` has three states, `PublicTransport` two, and `Walk` one.
