:haskell:languages:

# Haskell


## Creating Data Types
Outside of the basic data types you can create your own types!
These types are called [[algebraic-data-types|algebraic data types]].

There are three pieces involved to create a data type:
- `data` keyword which acts as the data constructor
- `=` sign
- Type constructors

The `data` keyword is used to indicate a data type is being created.
The `=` sign is used to signify what makes up the new type.
Type constructors are like templates to show what makes up the new data type.

Type constructors have a name that is not a currently used data type and can be followed by other types like so: `data Example = Example String`.

Type constructors are interesting because they have their own names which can be the same as the data type, as seen above, or different, like this fake Bool data type: `data Bool' = True' | False'`.

One note though is that you can't use the same type constructor name for multiple type constructors. For instance, this won't compile: `data Contact = Contact String | Contact Number`.
Lastly, type variables can be used in data constructors too!
`data Contact a = Phone a | Address a`.


## Type Classes
Type classes are contracts describing available functions that within the data types that implement them.
See [[haskell#How are type classes different than interfaces?|here]] for more info.


## IO
I/O in Haskell is a bit weird.
Haskell uses types for everything, including I/O.
The type for I/O is `IO`.
Usually it's followed up with another type representing the type of data involved.
For instance, the `getLine` function has the type `IO String` because it gets a string using I/O.
The only exception is the `main` function which would usually have a type of `IO ()` (read "IO empty tuple").
The empty tuple is to signify nothing, that the function doesn't really return anything.

The `do` keyword is not an `IO` only thing.
`do` is a function that belongs to the *monad* typeclass.
This means anything that use the monad typeclass, such as `Maybe`, can use `do` notation.

Using the left arrow (`<-`) in a `do` block is a way to take the `IO` type out temporarily.
Within a `do` block `let` allows you to create a variable that is not concerned about the IO type.

Through the Reddit community I've learned that `pure` is a way to return values in an `IO` monad.


## Questions


### How are type classes different than interfaces?
[Source](https://stackoverflow.com/questions/6948166/javas-interface-and-haskells-type-class-differences-and-similarities)
For background, type classes refer to https://stackoverflow.com/questions/6948166/javas-interface-and-haskells-type-class-differences-and-similaritiesHaskell's type classes and interface refers to what you'd see in an OOP or more imperative language like Java or TypeScript.

Both establish a contract of functionshttps://stackoverflow.com/questions/6948166/javas-interface-and-haskells-type-class-differences-and-similarities for other things (types or objects) to follow.

The two differ in the details.
- Type classes are explicit in their ahttps://stackoverflow.com/questions/6948166/javas-interface-and-haskells-type-class-differences-and-similaritiesrguments where interfaces are coupled with objects and as a result introduce another argument, `this`.
- In terms of implementation, the funchttps://stackoverflow.com/questions/6948166/javas-interface-and-haskells-type-class-differences-and-similaritiestions of an interface must be implemented when the interface is implemented. Type classes do not enforce such strictness.
- Type classes can provide default implementations using parameterized types. Interfaces cannot be implemented so abstractly. Interface impelementations must involve types.
  - An example of this would be how you can `derive` a type class to gain some sort of default behavior.

One other note: I've seen multiple instances of people saying type classes were invented as a way to address "ad-hoc polymorphism".


## Related
[kinds](kinds)
