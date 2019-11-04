# Haskell


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



:haskell:languages:
