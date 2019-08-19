= Contents =
  - [[#Going through the Guide v3|Going through the Guide v3]]
    - [[#Going through the Guide v3#The Elm Architecture|The Elm Architecture]]
      - [[#Going through the Guide v3#The Elm Architecture#Buttons|Buttons]]
      - [[#Going through the Guide v3#The Elm Architecture#Text Fields|Text Fields]]
      - [[#Going through the Guide v3#The Elm Architecture#Forms|Forms]]
    - [[#Going through the Guide v3#Commands and Subscriptions|Commands and Subscriptions]]
      - [[#Going through the Guide v3#Commands and Subscriptions#HTTP|HTTP]]
      - [[#Going through the Guide v3#Commands and Subscriptions#JSON|JSON]]
      - [[#Going through the Guide v3#Commands and Subscriptions#TIME|TIME]]
    - [[#Going through the Guide v3#JavaScript Interop|JavaScript Interop]]
      - [[#Going through the Guide v3#JavaScript Interop#Flags|Flags]]
      - [[#Going through the Guide v3#JavaScript Interop#Ports|Ports]]
      - [[#Going through the Guide v3#JavaScript Interop#Custom Elements|Custom Elements]]

= Going through the Guide v3 =

== The Elm Architecture ==

=== Buttons ===
I'm pretty sure this is my third time going through the guide because I'm constantly starting and stopping, but now I'm trying to go through it totally.

I just got through the Buttons section of the *Architecture* section.
A big concept that is stressed is the separation of data and logic.
This is why Elm doesn't use `this` in its code.
`this` is a way to bridge data in logic, which can cause a lot of errors.

Another big concept is how the `Msg` type used for *updates* is to describe possibilities as data.
This is like expressing results as data transformations.

One thing that confused me before was how the *view* functions return a value of type `Html Msg`. Why two?
The `Html` bit is the markup itself.
The `Msg` bit afterwards is to say "Hey, this HTML can produce stuff of type `Msg`".
Hence `Html Msg` is another way of saying `Html` capable of prooducing `Msg`s.


=== Text Fields ===
Another strong point made is to "...always, you start out by guessing at what your `Model` should be."


=== Forms ===
You can make functions to return HTML and nest them to make view code more concise!


__I am skipping to Commands and Subscriptions__

== Commands and Subscriptions ==
Where `Browser.sandbox` allows us to set up simple Elm programs that can make Html and respond to Html events, `Browser.element` goes a step further by introducing *commands* and *subscriptions*.

I'm guessing subscriptions are the same concept as pub-sub systems, and in that case commands must be the pub part.


=== HTTP ===
Whenever using `Browser.element` you need to supply a `subscription` function to `Browser.element` as well as the usual `init, update, and view` functions.

`init` changes slightly too. It takes a function as its first parameter for JS interop. It returns a tuple consisting of a `Model`, your initial state, and a `Cmd Msg`, whatever you want to do on the start of the app.

Using `Browser.element` changes the `update` function too. Instead of simply returning a model, you're now returning a tuple like that in init `(Model, Cmd Msg)`.

So `Browser.element` brings with it `Cmds` and `subscriptions` although, we haven't gotten to the subscriptions part yet.

IMPORTANT: You do need to set up a subscription, even if it's `Sub.none` or else the app will fail.


=== JSON ===
Json is kind of weird in Elm.
There's a type called `Decoder` that is paired with another Type (i.e. String, Int, List, Dict, Bool).
The overall type describes a function which takes in JSON and tries to get out certain information of a certain type.
You can chain them too to get nested information.


=== TIME ===
There are two big concepts introduced here:
- Time
- Subscriptions

Time is fairly straightforward.
Since time is relative, there's this thing called POSIX that is provides the number of ms from some arbitrary date.
This time is the same everywhere.
To deal with time zones there's a Zone function/type.
Thus, normal time can be represesnted as:
POSIX + Zone = human time!


Subscriptions are still a bit mysterious to me.
The Subscriptions type is `Model -> Sub Msg`.
For this example, we used `Time.every` to make `Sub Msg`.
`Time.every`'s type siginature is:
`every : Float -> (Time.Posix -> Msg) -> Sub Msg`
The first float is how often to fire the command, the delay/throttle.
The second arg is a function that takes Posix and returns a `Msg`
This is where the `Msg` types we create come in.
The `Msg` we passed for this example was `Tick`.
So every second this sub message is hit
  which triggers the update func
  
So subscriptions is a way to set up recurring commands?


== JavaScript Interop ==
Just skimming this section to put notes here.
Everything in this section is for establishing some form of communication between an Elm app and external JavaScript.


=== Flags ===
Remember how every example has an `init` type of `init : () -> (Model, Cmd Msg)` ?
The empty tuple represents *flags*.
Skipping around a bit, a flag can be added on whatever JS initializes the elm app.
i.e.
`Elm.Main.init({ node: document..., flags: ... })`
Since Elm is typed we have to specify the type that the flag should be on Elm's side.
To do so simply switch out the empty tuple with the expected type.

And that's it for flags.
Oh! One last thing I picked up on reading the beginning of Ports:
*Flags communicate in one way* (JS -> Elm not vice versa)


=== Ports ===
Ports are used to set up continuous communication between Elm and JS, not just get some initialization data from JS (i.e. Flags).

Look at the docs for setting up a Port.

The idea is there's a keyword in Elm, port, that is used as the communicator on Elm's side. On JS there's a `subscribe` function exposed by the `Elm.Main.init` function that takes a callback to perform some action whenever data is sent from the Port.

To communicate from JS to Elm, there's a `send` function also exposed by `Elm.Main.init` to do so.


=== Custom Elements ===
Skipping for now...


== Web Apps ==
For web apps `Brower.document` is used.
It's type signature is very similar to `Browser.element`.
What differs is the `view` function returns a `Document msg` instead of `Html msg`.
`Document` has the following type signature:
`Document : { title : String, body : List (Html msg) }`

=== Navigation ===
Now this is cool!

The main gist of SPA navigation in Elm is this:
There is an action to change the Url.
This is what links send out.
*This only changes the url*
To *react* to the *change* we use the `update` function!
So to kinda draw it out:
action -> triggers url update -> `update` function responds

If you want to get fancy, you can do stuff in between the `UrlRequest`s and `UrlChange`s!
It's all in how you handle the reactions in the `update` function!

To further explain, let's take a step back.
Web apps require the `Browser.application` data constructor.
It is similar to `document` except it adds two new functions to the `init` record:
- `onUrlRequest`
- `onUrlChanged`

The first is like an event handler for all links in the app.
`onUrlRequest`'s type signature is `onUrlRequest : UrlRequest -> msg`.
`UrlRequest` has the following type signature: `UrlRequest : Internal Url | External String`
Knowing that we can derive the following `onUrlRequest : (Internal Url | External String) -> msg`.
`onUrlRequest` produces a `msg` which is why we provide a `msg` type in the `init` initialization.

This example used `onUrlRequest = LinkClicked` where `LinkClicked : LinkClicked Browser.UrlRequest`.
We know what `UrlRequest` is made of so we can deduce that the `msg` we pass is what `onUrlRequest` will emit.

Any link, internal or external, goes through `onUrlRequest`.
This is why we need to check for the type passed in `onUrlRequest` in the `update` function.

`onUrlChanged` is similar, but takes just a `Url` instead of an `UrlRequest`.

So altogether:
- Links go through `onUrlRequest` and produce a `Msg` with a `UrlRequest`
- `update` checks for the `UrlRequest` and decides what to do, most likely ending in changing the url somehow
- Url changes go through `onUrlChange` which produces its own `Msg` with a `Url`
- `update` checks for the `Url` and responds to it somehow, most likely adding it to its state

So it's like it has its own router
