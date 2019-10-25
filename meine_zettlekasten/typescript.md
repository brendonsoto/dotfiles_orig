# TypeScript


## Intersection Types
Think of intersection types as types connected through the use of *and*.
A type is this *and* that.
Intersection types are *sum* types.
Use them when you're combining two types (i.e. while using `Object.assign`)

For mnemonic purposes, think of the intersection of two types.


## Union Types
Think of union types as types connected through the use of *or*.
A type is this *or* that.
Union types are *product* types, more-or-less.
I say more-or-less because when in use without type guards, only the properties shared between the types is directly accessible in the function.
To access unique properties, or properties not shared by all types in the union, type guards or type predicates are needed.

Example of type predicate:
`function isCustomer(user: Admin | Customer): user is Customer { ... }`

Example of type guard:
```
function getCust(user: Admin | Customer) {
  if (typeof user === "Admin") {
    // Do Admin things
  }
  if (typeof user === "Customer") {
    // Do Customer things
  }
  throw new Error("Invalid user")
}
```


## Abstract Data Types (Discriminated Unions)
Check Microsoft's handbook [here](https://www.typescriptlang.org/docs/handbook/advanced-types.html#discriminated-unions).
Their documentation on it is really good.


:programming-languages:
