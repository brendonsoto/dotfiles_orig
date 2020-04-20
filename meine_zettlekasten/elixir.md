# Contents
  - [Elixir](#Elixir)
  - [General](#General)
  - [Atoms](#Atoms)
  - [Booleans](#Booleans)
    - [Comparison](#Booleans#Comparison)
  - [Comments](#Comments)
    - [Auto-documentation with ExDoc](#Comments#Auto-documentation with ExDoc)
  - [Control Structures](#Control Structures)
    - [case](#Control Structures#case)
    - [cond](#Control Structures#cond)
    - [Guards](#Control Structures#Guards)
    - [with](#Control Structures#with)
  - [Conventions](#Conventions)
    - [Boolean Functions](#Conventions#Boolean Functions)
    - [Tuples as Return Values](#Conventions#Tuples as Return Values)
  - [Date and Time](#Date and Time)
  - [Enumeration](#Enumeration)
  - [Functions](#Functions)
    - [Anonymous Functions](#Functions#Anonymous Functions)
    - [Named Functions](#Functions#Named Functions)
    - [Private Functions](#Functions#Private Functions)
    - [Default Arguments](#Functions#Default Arguments)
    - [Function Headers](#Functions#Function Headers)
  - [IEx](#IEx)
    - [Helpful Commands](#IEx#Helpful Commands)
  - [Lists](#Lists)
    - [Keyword lists](#Lists#Keyword lists)
  - [List Comprehensions](#List Comprehensions)
    - [Filters](#List Comprehensions#Filters)
    - [into](#List Comprehensions#into)
  - [Maps](#Maps)
  - [Mix](#Mix)
    - [Create a New Project](#Mix#Create a New Project)
    - [Environments](#Mix#Environments)
    - [Creating Custom Tasks](#Mix#Creating Custom Tasks)
  - [Modules](#Modules)
    - [Structs](#Modules#Structs)
    - [alias](#Modules#alias)
    - [import](#Modules#import)
    - [only and except](#Modules#only and except)
    - [require](#Modules#require)
    - [use](#Modules#use)
  - [Pattern Matching](#Pattern Matching)
    - [match](#Pattern Matching#match)
    - [pin](#Pattern Matching#pin)
  - [Pipe](#Pipe)
  - [Sigils](#Sigils)
  - [Strings](#Strings)
  - [Testing](#Testing)
    - [Configuration](#Testing#Configuration)
    - [Mocks](#Testing#Mocks)
  - [Tuples](#Tuples)


# Elixir
:languages:


Using this space to jot down things I think are interesting or that are not noted in the docs
Resources used:
- [Elixir School](elixirschool.com/) << used this primarily


# General
There is pattern matching and I love it

Values seem to be immutable
For instance, adding to a map is not in-place

Seems like there is strict and lazy evaluation


# Atoms
Atoms are analagous to symbols from Ruby


# Booleans
Thankfully _numbers are all truthy values_, even zero (looking at you JavaScript where 0 is false but everything else is true)
The *only false values* are `nil` and `false`

The following  operators can be used with any types:
- `||`
- `&&`
- `!`
But the following can be used only when the first type is a boolean:
- `or`
- `and`
- `not`

## Comparison
Comparison operators are similar to JavaScript, there are loose and strict equal operators (`==` and `===`)
*Any two types can be compared*
See elixirschool's first lesson for the ranking


# Comments
There are different ways of writing comments

*Inline* comments can be written using `#`
Example:
`# this is a comment`


*Modules* can be documented using `@moduledoc` right underneath the module declaration
Example:
```
defmodule Arithmetic do
  @moduledoc """
  Provides functions to perform arithmetic
  """

  ...

end
```
These can be used in iex using `h <module>`
So using the above as an example:
`iex> h Arithmetic`

*Functions* can be documented using `@doc` right above the function declaration
It reminds me of JSDoc
The format is the same as using `@moduledoc`

A really cool features is that *markdown* can be used in documentation!

## Auto-documentation with ExDoc
There's a dependency called ExDoc that can be used to turn all of your documentation into an online doc
It relies on Earmark
The dependencies are `:ex_doc` and `:earmark`

Elixirschool mentioned adding the `:dev` option onto both of them to not create documentation for the prod site/api


# Control Structures
There are:
- `if`
- `else`
- `unless`
which all act like the same structures in Ruby

## case
There is `case` for [pattern matching](#Pattern Matching)
Example:
```
case 2 do
1 -> "one"
2 -> "two"
_ -> "you've gone too far"
end
```
This will produce the value `two`
If we were to replace the `2` in the same line as the `case` keyword with `1` we would receive `one`
If it were replaced with anything else the final statement would catch it and return `you've gone too far`

One interesting part is how the [pin](#Pattern Matching#Pin) operator can be used with the `case` statement
Consider the following:
```
my_note = "This is a note"

case "different note" do
  ^my_note -> "This is the pinned version"
  my_note -> "This is a different note: #{my_note}"
end
```
It looks weird yeah
The first inner portion of the `case` block is saying to take the parameter passed in and match it to the contents of `my_note`
If that fails then we move to the second portion which essentially creates a new local variable called `my_note` to be used in the return

## cond
This is similar to if/else statements from other languages
Example:
```
# Let `fn` be some arbitrary function we made
cond do
  fn(x) == 1 -> "one"
  fn(x) == 2 -> "two"
  true -> "The catch all was hit"
```

## Guards
Elixir has guards!

A *guard* is like a shorter conditional
If the conditional passes, then something else can happen
Example using cases:
```
case x do
  1 -> "one"
  2 -> "two"
  n when n < 10 -> "less than ten"
  _ -> "greater than 10"
```
The fourth line with the `when` statement is our guard
We can see there's a conditional on the right side as well as what to do if that conditional is met

Guards can also be used for [pattern matching](#Pattern Matching) with functions:
```
def analyze(num) when num < 10, do: "is less than ten"
def analyze(num) when num < 100, do: "is less than hundred"
def analyze(num) when num < 1000, do: "is less than thousand"
...
```
In this case it's a bit similar to Haskell!

*Multiple* guards can be used to pattern match to have the same result
Example taken from Elixir's docs
```
def foo(term)
  when is_integer(term)
  when is_float(term)
  when is_nil(term) do
  :maybe_number
end

def foo(_other) do
  :something_else
end
```

## with
The `with` statement is intereting and weird
I can see how it can be useful for cleaning up nested statements based on this [example from elixirschool](https://elixirschool.com/en/lessons/basics/control-structures/)
It's like a way to show just the happy path of a series of functions
`else` may be provided to "catch" errors


# Conventions
## Boolean Functions
I usually name functions that return a boolean something like `is_whatever`
In Elixir, it seems like the convention is to add a question mark after the name of the thing you're testing for
So using the above example it would be represented in Elixir like `whatever?`
But this applies to modules
I guess for a better example:
```
defmodule Arithmetic do
  def even?(a), do: rem(a, 2) == 0
end
```

## Tuples as Return Values
Tuples tend to be returned as values for functions
For example, try running `Date.new(2020, 12, 12)`
A tuple with the first value as `:ok` and the second value as the date should return
So it seems common that people pattern match to pull out the value like so:
`{:ok, date} = Date.new(2020, 12, 12)`
I guess this is a way to check if all is well for functions that may fail
Think of `either` from Haskell


# Date and Time
It's interesting
For timezones, install and use `tzdata`

There are two different ways to represent times in Elixir:
- `NaiveDateTime` where timezone is not supported
- `DateTime` where timezone is supported, butrequires a "time zone database" which defaults to something that handles only Etc/UTC


# Enumeration
This confused me a bit at first
The definition of enumerate, according to dictionary.com, is "to mention separately as if in counter; name one by one; specify, as in a list:"
The particular definition that made sense was "name one by one"
In Elixir, `Enum` is a module that includes algorithms for processing sets of data
Thus, functions like `map`, `sort`, `filter`, `reduce`, etc are all referenced via `Enum`
Take for example, this simple map function:
`Enum.map([1, 2, 3], fn(x) -> x * x end) # will produce [1, 4, 9]`


# Functions
*Functions can not be created outside of a module*

## Anonymous Functions
They are declared using `fn` and `end` like so:
```
product = fn (a, b) -> a * b end
product.(2, 3) # 6
```

They can also be declared by using an ampersand `&`
```
product = &(&1 * &2)
product.(2, 3)
```

## Named Functions
Functions can be defined using the `def` keyword
The following example shows creating a named function inside a module:
```
defmodule Math do
  def add(a, b) do
    a + b
  end
end

Math.add(1, 1) # 2
```

One liners can be shortened using `do:` (note the semicolon)
So using the same example as above:
```
defmodule Math do
  def add(a, b), do: a + b
end
```
Note the following in the above example:
- the comma after the param parens
- the semicolon after do
- the lack of an `end` keyword for the one-line function

## Private Functions
Use `defp` to create a private function

## Default Arguments
Default arguments are defined by following a parameter with `\\ value`
Example:
```
defmodule Math do
  def add(a \\ 0, b \\ 0), do: a + b
end

Math.add() # 0
```

## Function Headers
When combining guards *with* default arguments a function header must be provided
This header holds the default param
Check example [from elixirschool](https://elixirschool.com/en/lessons/basics/functions/)


# IEx
Interactive Elixir
This is the REPL for Elixir

The file `.iex.exs` is used as a configuration file for the REPL
The REPL looks for this file first in the current directory and then the user directory, `~/.iex.exs`

The example from elixirschool shows how to add a function available to just iex
https://elixirschool.com/en/lessons/basics/iex-helpers/

## Helpful Commands
- `h`: get info/help on the module given (i.e. `h Enum`)
- `i`: get information on a data type (i.e. `i Map`)
- `r`: recompile a module
- `t`: get info about the types available in a module


# Lists
Lists can have *multiple types* (like JS or Ruby)

What's interesting is _adding to the front of a list is fast, but to the end is slow_
Examples of both:
```
nums = [1, 2, 3]
[0 | nums]
nums ++ [4]
```

There's an operator to _remove values from one array to another_: `--`
Example: `[1, 2, 3] -- [1] # = [2, 3]`
This also works when the array with values to remove has a value that is _not present_ in the primary array

The *cons* operator can be used for destructuring
Example: `[head | tail] = [1, 2, 3] # = 1, [2, 3]`
This would be equivalent to:
```
nums = [1, 2, 3]
head = hd nums
tail = tl nums
```

## Keyword lists
These are basically *dicts/hash maps/etc* from other languages
Examples:
```
[name: "Brendon", age: 12]
[{:name, "Brendon"}, {:age, 12}]
```

To access an element in a keyword list use an atom as the key
Example (using the above example as `person`): `person[:name] # Brendon`

Some important notes about keyword lists from elixirschool:
- keys are atoms
- keys are ordered
- keys do not have to be unique
That last one is definitely good to know

When *duplicates* are added the first item added is the one that will be returned when trying to access it via an atom

According to elixirschool, keyword lists are used to *pass options to functions*


# List Comprehensions
I think the example provided in elixirschool says it best:
```
list = [1,2,3,4,5]
for x <- list, do: x*x
```

They will work for *any* enumerable (i.e. lists, keyword lists, maps, binaries, etc.)

You can also nest them
Example (from elixirschool):
```
list = [1, 2, 3, 4]
for n <- list, times <- 1..n do
  String.duplicate("*", times)
end
```
The first part of the `for` statement is saying to iterate through each item of the list and for each value create a range `1..n`, one through n, and then iterate through those values to do the duplication

## Filters
It is possible to provide a function to be used as a filter in a list comprehension
```
list = [1, 2, 3, 4]
for n <- list,
  is_even(n), do: n
```
The above will print only the even numbers, 2 and 4

## into
There is a keyword called `into` which can transform a list into a different data structure via list comprehension
Example (from elixirschool):
```
list = [one: 1, two: 2, three: 3]
for {x, v} <- list, into: %{} do: {k, v}
```
The above will produce a map of one: 1, two: 2, etc.


# Maps
Maps are like [keyword lists](## Keyword lists) but different in the following ways:
- keys can be *any type*
- keys are unordered

The syntax looks like: `%{:name => "Brendon", "age" => 12}`

Example demonstrating how to *make a variable a key*:
```
property = "name"
%{property => "Brendon"}
```

*Duplicates are replaced by the most recent value*

_If only atoms_ are used as keys the following syntax may be used:
`%{name: "Brendon"}`

To *access* an item from a map use dot notation

To *modify* the value of a key the cons operator can be used:
```
map = %{name: "Brendon", age: 12}
%{map | age: 13
```

To *add a new key* to a map, use `Map.put`:
```
map = %{name: "Brendon", age: 12}
Map.put(map, :hair_color, "brown")
```


# Mix
Mix is a *package management* and *build tool* for Elixir

The docs seem super helpful!
Try running `mix help`

## Create a New Project
Run `mix new`
It will generate a few files in a new directory

The `mix.exs` file is the project configuration file
It's layout will make sense when you read it

In order to use the *REPL with your project* run `iex -S mix`

To *compile* use `mix compile`
The compiled files are stored within `_build` of the project's directory

*Dependencies* are defined in the `deps` function of `mix.exs`
The format is a tuple with up to three values:
- [required] an atom that is the name of the dependency (i.e. `:phoenix`)
- [required] a string representing the version `~> 1.4`
- options (i.e. for only dev or test environments: `only: [:dev, :text]`)

To *install* the dependencies use `mix deps.get`

## Environments
By default mix is configured to work with three different environments:
- `:dev`
- `:test` -- used by `mix test`
- `:prod`

The environment can be accessed by using `Mix.env`

The environment can be changed using the environment variable `MIX_ENV`
An example of a production build: `$> MIX_ENV=prod mix compile`

## Creating Custom Tasks
This is to create something like `mix my_task`

First create the directory `<project>/lib/mix/tasks/` if it doesn't already exist
Then add in that directory a file named `<task-name>.ex` where `<task-name>` is the name of the task you want to give
Add the following as a template:
```
defmodule Mix.Tasks.MyTask do
  use Mix.Task

  @shortdoc "This presents short documentation when running `mix help`"
  def run(_) do
    # Functionality goes here
  end
end
```


# Modules
Modules are Elixir's solution to namespacing

A module can be made using `defmodule`

A module name *must be title-case*

It is possible to nest modules by creating a module and using a name that uses dot notation
For example, if you have a `Math` module and want to add an `Arithmetic` module to it, the line that defines the new module would looke like `defmodule Math.Arithmetic do`

A module can have *attributes* which are like *constants* for modules
They can be defined within a module using the syntax `@<attribute-name> <value>`

## Structs
A struct is a special map of defined keys and default values
It is common for a struct to be the only thing in a module

Structs can be defined inside of a module using `defstruct`

Fields of a struct can be hidden from other things by using `@derive` followed by the function you want to reveal only a few things and then `only: <field-name-to-show>` or `except: <field-to-hide>`
Example:
```
defmodule Government do
  @derive {Inspect, only: [:name]}
  defstruct name: "Poop", money: "Too much"
end

usa = %Government{name: "usa"}
inspect(usa) # "usa"
```

## alias
It's possible for a module to use functions from another module by using `alias`
Example:
```
defmodule Customer do
  def isGoldMember(name) do
    ...
  end
end

defmodule Store do
  alias Customer

  def getDiscount(name) do
    isGold = isGoldMember(name)
    if (isGold)
    ...
  end
end
```

To import multile submodules use `alias Parent.{Submodule1, Submodule2}`

## import
The `import` statement can be used instead of aliasing

## only and except
When importing a module you can control what functions are included by using:
- `only: [<functions>]` -- imports only the functions in the brackets
- `except: [<functions>]` -- imports everything except what's in the brackets

## require
The `require` statement is used to say a module is needed when used by another module
An error will occur if otherwise

## use
The `use` statement is a way of including a subsect of functionality defined within another module via the `__using__` macro
See the example from [elixirschool](https://elixirschool.com/en/lessons/basics/modules/)


# Pattern Matching
There are two main operators for pattern matching:
- match (`=`)
- pin (`^`)
These are a little weird to me so let's examine them more in depth

## match
The *match* operator, `=`, raises a `MatchError` if what's on the left does not match what's on the right
For example:
```
# in iEx (where > represents the command prompt)
> x = 1
> 1 = x
> 1       # The interpreter retuns this
> 2 = x
> MatchError ...
```
Alright, so we can see it's throwing an error because we're trying to match 2 to 1
But where it can get a bit wonky to comprehend is in scenarios like this:
```
> {:name, val} = {:name, "Brendon"}
> val
> "Brendon"
```
Here we can see we're using the match operator to destructure a tuple
We're taking the tuple with the atom `name` and the second value `"Brendon"` and telling the computer to store the value of `:name` into `val`
Thus a form of destructuring

## pin
The *pin* operator is also used for pattern matching
For me seeing some code explained the idea
Consider the following:
```
x = 1
x = 2
```
Nothing special going on, just resetting a variable from one value to another
Now consider, and run, this:
```
x = 1
^x = 2
```
A `MatchError` occurs!
Here we can see the match operator is a way to tell the computer to keep the value of `x` the same and compare it to what's on the right side of the equals, or match, operator


# Pipe
The pipe operator, `|>`, is a way of passing data from one function to another
Think of it as chaining functions in JavaScript or the pipes in Unix


# Sigils
These still kind of confuse me
I think of them as a way of representing a literal with formatting/escaping or interpolation either applied or not
I need to see them in action in order to understand them better


# Strings
*Interpolation*: `"Hello #{name}"`
*Concatenation*: `"Hello " <> name` (like Semigroups in Haskell!)

Strings are a bit weird in Elixir as they are *represented with bytes* instead of as characters
There is a char list type which uses single quotes, but it's rarely used


# Testing
Elixir comes with a testing framework called `ExUnit`
It runs using Elixir scripts (`.exs`)

To run a test: `mix test`

When creating a project using mix a base test is created automatically

`assert` can be used to confirm an expression
`refute` is to assert an expression is false
`assert_receive` is to confirm an error is thrown
`assert_receive` is to confirm a message is received from one actor/process
`capture_io` is to observe any IO messsages
`capture_log` is similar to `capture_io`

## Configuration
`setup` can be used to run code before each test
`setup_all` can be used to run code once before all tests
Both are expected to return a tuple of `{:ok, <state>}`
Example of a return: `{:ok, name: "Tester"}`

## Mocks
This was an interesting note to me
Mocks are *discouraged* in Elixir
This article was referenced as a why:
http://blog.plataformatec.com.br/2015/10/mocks-and-explicit-contracts/


# Tuples
Tuples are defined using *curly brackets* `{}`
Example: `{1, 2}`

Modifying tuples is _expensive_ because the entire tuple is copied to memeory

Tuples are used commonly to *return multiple values* from functions
