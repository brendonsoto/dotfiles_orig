:typescript:types:

# Types

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
