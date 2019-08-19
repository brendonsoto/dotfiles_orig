= Alternative Approach =
This approach will outline the steps and then ask questions afterwards.

== Starting Out ==
*GOAL:* Simple hello world page.
*PURPOSE:*
- Learn how to start up an Elm project
- Learn how to get stuff on the screen
- Learn how to run some sort of development server for Elm projects

=== Intro Instructions ===
1. Open a terminal application
2. Create a directory for the code
3. `cd` into the directory
4. Run `elm`
5. Read
6. Run `elm init` and enter `Y` at the prompt
7. Create and open the file `src/Main.elm` in a text editting program

=== Making Stuff Appear ===
1. 

=== MEAT - The What, How, and Why ===
The program we ran created the file `elm.json` and an empty directory called `src`. We created a file named `Main.elm`. Our goal is to create a simple hello- world-esque page.

How do you know what to do or where to start when you're new? Check the docs!

https://elm-lang.org/ > Docs > Package Docs
(Yes there's an official guide that has their own demo project, but we're taking a different approach)

Near the top, or at least under the "Popular Packages" section, we see *elm/browser*. Click on it. You should see a section like the following:

"
...the Browser module. It lets you create Elm programs with the following functions:   
    sandbox — react to user input, like buttons and checkboxes
    element — talk to the outside world, like HTTP and JS interop
    document — control the <title> and <body>
    application — create single-page apps
"

The *document* function **seems** like what we need, but let's read into it a bit more before going with it. Click on "document". You should see this:

"
document :
    { init : flags -> ( model, Cmd msg )
    , view : model -> Document msg
    , update : msg -> model -> ( model, Cmd msg )
    , subscriptions : model -> Sub msg
    }
    -> Program flags model msg

Create an HTML document managed by Elm. This expands upon what element can do in that view now gives you control over the <title> and <body>.
"

Holey moley! That's a lot, especially if you're not used to working with types. Let's break it down at a higher-level.

We read previously that the *Browser* module has several functions, one being *document*. We see a colon next to *document*, and we know that *document* is a function, so this must be some sort of function defining syntax.

What's with the curly brackets underneath "document :"? So glad you asked (not really, but who cares?!)! This is called a *record* data structure. You can read more about them [here](https://guide.elm-lang.org/core_language.html).

So now we know that *document* is a function, that a colon next to a name indicates a function, and that curly brackets are a sign of a *record* data structure. 

Skimming inside the record we see more names followed by colons and then more words and symbols. It's like an archaeology class! We're not going to dive into everything here, but one thing to pay attention to is the arrow sign (`->`) in between words. This is part of the function syntax and is the symbol for "returns". So the `init` part of the record uses something called *flags* and *returns* a two-part thing in parenthesis (which is called a [tuple](https://guide.elm-lang.org/core_language.html)).

Look at the end of the record underneath *document* and we see another arrow with more words! Yay words! But what do these words mean?

Notice how only one is capital (Program)? Why do you think that one's capital and the others are not?

Capital words like Program usually refer to *types*. Types are descriptions of data. For instance, you know how numbers can have decimal points or not? Like 1 vs 1.23? How would you describe those two numbers in code? Some languages like to use the word *Int/Integer* for numbers without decimals and *Float* for numbers with.

Cool, we know what capital words are (I feel like a toddler saying that), but what's with the words after?

Let's start the answer with a question. *Int* and *Float* kind of make sense for describing numbers (unless if you think of an actual floating number. can't help you there!), but what's a *Program*? Sounds pretty abstract. If abstract things can be types, can I make my own?

Yes, you can make your own types! Types can be made out of other types. But how can you describe what that type is? Why not just include what the other types are in the type name?

Let's say we had a cookie factory, 'cause who doesn't like cookies? (If you don't, you can leave the site now thank you.) Our orders consist of what type of cookie and how many. We can use a string to describe cookie type and an int/number/float (woooah, floating numbers) to describe how many. We can then make an 


=== Extra Credit ===
- Read the link in `elm init`
- Explore `elm.json` file
