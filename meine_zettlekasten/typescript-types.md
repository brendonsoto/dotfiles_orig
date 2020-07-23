:typescript:types:

# Types

## Ampersand
This isn't a value but a way to create a type using another type as a basis.
Consider the following:
```
type Vehicle = {
  brand: string
}

type Car = Vehicle & {
  isStick: boolean
}
```
Our type `Car` has the properties of Vehicle and the new `isStick` property.


## Const values
Any value declared with the `const` keyword the "type" of the value is considered a literal

Where this gets weird is with objects
The object is not a literal value so it's type will be reported as whatever the structure is of the object given, but with the values abstracted as types instead of literals
For an example of this, consider the following:
```
cosnt myObj = {
  name: "Megaman"
}
```
The type of this object would be reported as:
```
myObj: {
  name: string
}
```
Notice how the `name` property has the type of `string` as opposed to the literal given to it in its declaration


## Enum
Enums map values to keys
By convention, enum names anad keys are _uppercase_
By default, TS will infer numerical values for the keys
The author of Programming TypeScript recommends avoiding enums where possible


## Generics
To create a generic use `<T>`, where `T` can be any letter or descriptor.
Once that's in the beginning of the type declaraion, any other references to the type can be with just `T` or whatever's in the brackets.
Here's the filter function as an example:
```
type Filter = {
  <T>(array: T[], f: (item: T) => boolean): T[]
}
```

Where the generic is *placed* determines its *scope*
It's placement determines when types are bound.
In the above example, the types are determined by the function passed into filter.
Here's an example where the type is bound at the parent function
```
type Filter<T> = (array: T[], f: (item: T) => boolean): T[]

// invalid
let filter: Filter = (array, f) ...

// valid
let filter: Filter<number> = (array, f) ...
```

To declare *multiple* generics separate them with a comma.
Example with map:
`type Map = <T, U>(array: T[], f: (item: T) => U): U[]`

### Infering Generic Types
You've run into the situation where you're passing in a function to a higher-order function (think of map/filter/promises) and the typechecker complains.
You can get around this by including the type at the top.
Example:
```
let p = new Promise<string>(...)

p.then(x => x + 2) // won't complain
```

### Extending Other Types
The book Programming TypeScript had a neat example of this using binary trees. There were three node types, a leaf, a node, and a node containing other nodes. They used the question "How would you create a map function for nodes?" as a way to explore this topic.

By using `extends` you can say a generic type can still vary, but it must have the qualities of whatever it extends.

Referencing the tree again, there were three types in increasing specificity: `TreeNode`, `LeafNode`, and `InnerNode`. The function's type was `<T extends TreeNode>` which allows for any of the nodes but mentions whatever the argument is it must have the qualities of TreeNode.

To extend **multiple** types use ampersand.

### Defaults
A *default type* can be assigned using the equals sign, just like default values for function parameters.


## Key-in operator
If you have a nested type structure like below:
```
type Guitar = {
  strings: {
    count: 7,
    type: "nickel"
  },
  pickups: {
    active: false,
    brand: "Seymour-Duncan"
  },
}
```
and you wanted to address one of the inner types you could do so like:
`type StringCount = Guitar['strings']['count']`


## keyof operator
Use `keyof` to describe a union of the keys in an object.
Using the `Guitar` type above the resulting options for `keyof Guitar` would be `"strings" | "pickups"`

To use this in a more **abstract** way you could do something like the following:
```
O extends object,
K extends keyof O
```
So that way `K` is always the keys of whatever `O` is
You can even combine it with `key-in` operators:
```
O extends object,
K extends keyof O,
K1 extends keyof O[K]
```
So that way `K1` represents the keys within `O[K]`


## Mapped Types
This is to describe the following type:
`type DayPlanner: {[K in Day]: Plan}`
The keys are *mapped* to values within another type


## Never
The `never` type is to represent functions that never return like:
- functions that throw exceptions
- never ending loops


## Objects
Use `?` for optional arguments
If you're not sure how many properties may have you can use bracket syntax just as you would to use variables as an object's keys
This is called an **index signature**

Example:

```
let a: {
  b: string
  c?: number
  [key: string]: boolean
}
```

Another option is to use `object` as the type itself when you don't care about what it has
Example: `const a: object`


## Record
`Record` types have the following signature: `Record<K, V>`
It's basically a dictionary. A way to map values to a certain key


## Readonly
The keyword `readonly` can be used to indicate a value is read-only


## Tuples
Example:
```
let a: [number] = [1]
let coords: [number, number] = [0, 3]
let name: [string, string, string]
```


## Union and Intersection
The two are talked about here since they have similar foundations
Think of types as _sets_
The **union** of two sets is _everything_ from the two sets
Their similarities and differences
The **intersection** of two sets is everything they have _in common_

**Union types** use `|`
**Intersection types** use `&`

**NOTE** a value of a union type can potentially be _both_ types or a mixture of the two that doesn't necessarily mean the value is of one type or the other.


## Unknown
Think of `unknown` as similar to `any` but with a few extras
You can perform boolean operations on it, but in order to actually reference it you need to **refine** it.
Refining a type is the process of using `typeof` or `instanceof` to kinda check it out.
