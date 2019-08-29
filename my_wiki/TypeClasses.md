# TypeClasses
TypeClasses are really cool.
Imagine grouping a bunch of data types under a parent data type and that group has a contract defining what functions

To implement a type class:
```
data SixSidedDie # S1 | S2 | S3 | S4 | S5 | S6
instance Show SixSidedDie where
  show S1 # "one"
  show S2 # "two"
  ...
```

The reason for using `instance TypeClass` instead of simply writing a function of a type class with the new data type is because the latter might conflict with the already existing function. For instance, if you created your own version of `show` for `SixSidedDie` and tried to call `show` which version would GHC know to use? The base version or yours?
