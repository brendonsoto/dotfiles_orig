:typescript:types:

# Intersection Types
Think of intersection types as types connected through the use of *and*.
A type is this *and* that.
Intersection types are *sum* types.
Use them when you're combining two types (i.e. while using `Object.assign`)

For mnemonic purposes, think of the intersection of two types.

The syntax for it would be like so:
```
interface One {
  name: string
}
interface Two {
  num: number
}

const Three: One & Two = {
  name: "MyName",
  num: 7
}
```
