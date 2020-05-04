:typescript:types:

# Casting
To cast a type use `<Type> myFunction()`.
An example of where this is helpful is using [canvas](./canvas.md):
```
// document.getElementById returns a particular type, but canvas is a different type
// so we use casting to get the proper type
const canvas = <HTMLCanvasElement> documeng.getElementById("myCanvas")
```
