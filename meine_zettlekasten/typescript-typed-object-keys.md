:typescript:

Say you have a typed object
```
type myObj = {
  a: ...,
  b: ...,
  ...
}
```
And you want to map through them
```
const keys = Object.keys(myObj)
for (const key in keys) {
  ...
}
```
but you want types to...
```
const keys = Object.keys(myObj) as Array<keyof myObj>
```

[sauce](https://stackoverflow.com/questions/52856496/typescript-object-keys-return-string)
