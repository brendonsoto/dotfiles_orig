= The Simplest Page =

Taken from https://elm-lang.org/0.19.0/imports

The simplest page is:

```
import Html


main =
    Html.div [] [ Html.text "hi" ]
```

Why does this work?
I get why the HTML bits work, because we're importing the module and using those functions, but did we not need the record for main? No `init` or `sandbox` or anything!

Looking at the source.
First I tried looking at the github codebase, searching for main, but then thought:
"Why not search for what Html.div returns?"

So that lead me to `elm/html` which revealed:

`type alias Html msg = VirtualDom.Node msg`

Ok. What's a VirtualDom.Node?

`type Node msg = Node`

Ok. What happened to `msg`? I remember reading in Haskell that you can do that and it's some sort of Phantom type or phantom something. Let's skip understanding that for now.

I now know that `Html.div ` returns data of the type `Node`.

Where to now?

Let's check what packages I have installed via `elm init` to see what packages I should be searching through!

```
    "dependencies": {
        "direct": {
            "elm/browser": "1.0.1",
            "elm/core": "1.0.2",
            "elm/html": "1.0.0"
        },
        "indirect": {
            "elm/json": "1.1.3",
            "elm/time": "1.0.0",
            "elm/url": "1.0.0",
            "elm/virtual-dom": "1.0.2"
        }
    }
```
Hmmm... `elm/core`?

No. Provides basics and no files have a name that shout out "I'm what you're looking for!".

To `elm/browser`!

Ahh, immediately in the README.md:

"
Elm in the Browser!

This package allows you to create Elm programs that run in browsers.
"

This could be my lucky day!

I'm stuck.
