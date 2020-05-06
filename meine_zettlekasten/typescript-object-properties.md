:typescript:

# Object Properties
An object's properties can be annotated using the convention: `<property>: <type>`

For example:
`let car: { manufacturer: string, year: int }`
This is saying a `car` object can be one with the properties `manufacturer` and `year`, but they have to have the types `string` and `int` respectively.

To make a property *optional* use `?` after the property name
For example:
`let car: { manufacturer: string, year?: int }`
