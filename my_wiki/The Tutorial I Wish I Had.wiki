= The Tutorial I Wish I Had -- v2 =
This is a guide without strict guidance on how to use Elm version 0.19.
Why was this created? Because I prefer learning in a different way than the elm guide. The guide's great and if it works for you, great! I became frustrated with it because I felt some of the basics weren't covered. For instance, an explanation on the `init` function.

[[Alternative approach]]


== How to Start an Elm project ==
In the terminal create a directory for our code and `cd` to it.
Type `elm` in the command line.

Brings up a bunch of stuff right? I always get a bit anxious seeing a bunch of text pop up on my screen, but I try to frame it as a little surprise (party horn emoji) to make it fun. Take a breath and read through it. It is really helpful.

`elm init` looks exactly like what we need! Type it! *Schwarzenegar voice* DO IT NAOW!

The prompt gives you a link with information on the point of the command. Handy!

We've got our project structure now. Cool! But what now? How do we make things appear on the screen? The prompt from running `elm` talked about how `elm reactor` can be used to compile and view code, but what code do we write?!

== Making Things Appear ==
This can be a bit more complicated than anticipated... 


= The Tutorial I Wish I Had -- v1 =
I don't know about you, but I wanted a more straightforward guide for Elm. The Elm guide is nice, but I came into it expecting to learn things from the ground up instead of having an environment to mess around in.
This tutorial is for anyone who likes learning from the ground up and then experimenting.
I do like how the CLI tool makes a lot of topics discoverable.

== How to Start an Elm Project ==
Oddly enough, the documentation does not tell you how to start an Elm project. Luckily, it's as easy as running in `elm init` and clicking `enter` right after the prompt! I kid you not!

When `elm init` is first run a message will appear providing a link that provides more information on the command. I find it a bit odd that the info isn't provided in the command itself, but it doesn't matter. Basically the documentation lets you know the command will create an `elm.json` file that specifies key packages and a `src` directory. Nothing more, nothing less. 

From there you can create `.elm` files within `src` and use `elm reactor` to spin up a local server to check out your work. As an example you can use the [example in the Elm guide](https://guide.elm-lang.org/), putting the code in `src/Main.elm`, run that with `elm reactor` to see the output.

If you want to compile the output to a file that can be hosted, use `elm make src/Main.elm`. This will result in creating an `index.html` page that has the code in `src/Main.elm`, but in JavaScript! Or if you want just JavaScript instead of that with HTML, you can run `elm make src/Main.elm --output=main.js` to compile the code into a file named `main.js`.


== How to get simple HTML up on the screen ==
One thing I think is helpful in learning things is repitition. Spaced repitition works wonders, but unfortunately I haven't thought of a way to bring that to this guide. Why am I bringing up repitition? To help us learn better! "Where is this going?" you might ask. We're going to use our knowledge from the previous section to segway into producting markup.
^*NOTE* Perhaps use only the top sentence and include the rest as a footnote?

So let's start small by creating a single page using `elm init`.

Now we have our `elm.json` file and an empty `src` directory. Let's go ahead and make a `Main.elm` file in `src`.

Let's look at the package docs for anything that talks about creating a page.

Checking the packages, one of the first on the list is *browser*. Looking inside we see the following:
- sandbox
- element
- document
- application

The third looks exactly like what we need! Clicking on it though shows what may seem as a confusing piece of code. This is a description of the *document type*. Whenever you see the colon symbol, think of it as a description for a type with the leftside being the type name and the right side being whatever stuff makes up the type.

Here we see the type name is *document*, but the right side, or the underside to be more specific, is a bunch of stuff surrounded by curly brackets.

The brackets indicate a *record* which is like an object in most other languages. We see what looks like types inside, but since this is a record the keywords to the left of the colons are the record's *properties*. They're like types, but specfic to the record.

There are four record properties here:
- init
- view
- update
- subscriptions

Every Elm program needs a *main* function. This is what starts it out. So we can start up Elm with `main = Browser.document...`.


== How to add event handlers ==


== How to fetch data ==


== How to handle JSON ==
