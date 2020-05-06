:typescript:

# Dictionaries
When creating a dictionary (key/value object) make sure to include one of the possible values could be `undefined`
Example:
```
interface Address {
  [name: string]:
  undefined |
  {
    number: number;
    street: string;
  }
}
```
