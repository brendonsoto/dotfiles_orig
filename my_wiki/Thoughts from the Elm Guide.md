# Thoughts
## Questions
What exactly is `Cmd`?
- `Cmd` is a type.
- Elm treats actions as `data`:
  - This `data` is communicated to the `Elm runtime system`:
    - The `runtime` performs some `optimizations` to the `data` prior acting upon it

What is a `Task` and what does `Task.perform` mean?
- `Task` is a type (surprise!) that communicates some asynchronous task that needs to be done, but could fail.
- `Task.perform` is a function that acts on a task. It takes a data constructor that returns a `msg`, a task that `Never` fails, and produces a `Cmd` with the `msg`!

Why have `Task`s that `Never` fail? Why not just make them a function?

## Core Language
Are type annotations not a thing? Or is it like Haskell?

From the *List* section, I noticed the functions on lists were prefixed with `List`.
This is different than Haskell where we would either have the function available by default (via Prelude imports) or import the function itself, not referencing the whole module, although I guess you can still do that.

At the bottom the author mentions Elm's way of making new objects/things as updates instead of destructively updating an object/thing is efficient through "sharing as much content as possible" I wonder what that means...

## The Elm Architecture
People refere to the Elm architecture as TEA. It consists of the following three pieces:
- Model
- A system for updating the model
- view
So it's similar to MVC, definitely letter wise (badum-tsst!).

### Buttons
I see and appreciate the value of having types representing actions. The exercise of adding a "Reset" feature displayed how trivial this is. Sure, it's a small example, but imagine in a bigger context! And the readability!

### Form
One bit that was tripping me up is how a type can seem like a function itself. For instance, the onChange events are handled by what seems like half a type (i.e. `Name`). This then takes whatever input and returns the full `Name String` bit.

## Types
### Type Aliases
Just like in Haskell!

### Custom Types
Elm treats types like Haskell which is pretty awesome! You can make `custom types` which is Elm's name for `algebraic datatypes (ADT)`.

### Pattern Matching
Here Elm is a bit different than Haskell. They use `case` syntax which is similar to Haskell. Here's a snippet from the guide:
`
toName : User -> String
toName user
  case user of
    Regular name _ ->
      name

    Visitor name ->
      name
`

## Side Note << Appendix -- Types as Sets
Here the author/s talk about cardinality! Same stuff as discussed in Haskell guides.
One point that I did find valuable is the concept of *revisiting and revising types so they match their real world values*.


## Error Handling
### Maybe
A very good point was made:
If you're using `Maybe` a lot it will be worthwhile to examine your data types and perhaps use custom classes instead. This way you can avoid conditional code to handle the situations and just rely on pattern matching. Plus it will describe the application better from a higher-level.

### Result
This is interesting. There's a `Result` type whose definition is the following:
`
type Result error value
  # Ok value
  | Err error
`
This is a way to add messages to errors to provide more detailed errors or different messages based on the type of error.
I am a bit confused on the type definition of Result. Why would you have the `Ok` value as the last param? Why not just make a custom type of two bits, similar to `Maybe`? I guess I am confused as to why would this be better than `Maybe` in some situations. So would an `Ok` value look like `Result _ value`?

## Commands and Subscriptions
### HTTP
There's `Browser.sandbox` and `Browser.element`. The former allows you to only create HTML while the latter allows you create HTML and set up `commands` and `subscriptions` to issue interactions with external things like *network requests, time, and random numbers*.

I wonder why there is both `sandbox` and `element` instead of just `element`.

### JSON
The `elm/json` package provides the `Decoder` type which takes in the name of the field you want to access and the type the data should be (i.e. int, string, bool). This is then applied to a JSON object to get the data. For nested data just nest the `Decoder`s.

### Random
Randomness has its own class and generates values through the `Random.generate` function. You specify via the `Generator` type what type the value will be and then provide a range for possible values. You can also weight it so one value appears more than the other.

### Time

## JavaScript Interop
### Flags
Flags are variables passed to Elm via the `init` function on Elm's side. When creating the HTML from an Elm file using `elm make`, there's a snippet of code calling a function called `Elm.Main.init` that's passed an object. Within that object can be a property called `flags` which has whatever data you pass into it. This data, `flags`, can be referenced in the `init` function. Error handling happens on Elm's side and fails immediately if the type of data passed into it isn't what is expected.

### Ports
I skimmed through this portion, but its purpose is for passing data back and forth between Elm and JavaScript.

## Web Apps
This seems to be more of what I was looking for.
`Browser.Element` is useful for introducing Elm to a team via a single element (surprise!), element here meaning DOM node.

### Navigation
Use `Browser.application` for SPAs.
