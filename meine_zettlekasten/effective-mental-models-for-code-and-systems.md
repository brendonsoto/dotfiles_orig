# Effective Mental Models for Code and Systems

https://medium.com/@copyconstruct/effective-mental-models-for-code-and-systems-7c55918f1b3e

## Thoughts During Reading
kay so we're starting off by talking about a talk on mental models

Interesting thought from the talk, a mental model is the representation of a relationship between a person and a system.

I like the segment between Rob Pike and Ken Thompson, thinking about the model being coded and analyzing that rather than diving into the code with debuggers.

So a problem being addressed here is that of when the mindset of "introducing a small complexity" multiplied by numerous engineers in coding a system.

Paraphrasing from John Allspaw's bit:
Engineers have their own mental models of the systems they work on. Usually they're incomplete or wrong in some way, but engineers are usually ignorant of it. Surprisingly it isn't much of a problem.

The author ties in "the relativity of wrong" by Isaac Asimov to say that it does not matter whether the individual's model is incomplete or erroneous, only that their model is close enough.

The author argues to optimize for understandability, saying that doing so will naturally lead to other benefits.
understandable -> debuggable -> testable -> extensible -> maintainable

One step in making stuff more understandable. is to identify the target audience of the code.
How does this differ from thinking that the code is written for other developers?
Ohhh, she's talking about the type of developers using the code being written.

Interesting! The author makes a claim that "self-documenting code is a myth" because code does not allow for the context to be communicated.
I especially like "The code itself lets a reader know _what_ decisions were made, but not _why_."

There's discussion about an *error kernel*. The idea is, I'm going to copy paste:

    While designing software layers, it’s salient that every layer encapsulate an error kernel. As a user of a layer, it’s important that I be offered an API that abstracts away most of the complexity of the implementation during the happy path.

I thought that idea was really cool and makes me think of implementing one in JavaScript, similar to having a Request module.

I also really loved this:

    While designing interfaces, it’s important to think of the different target audience of the system and understand that each of them might require a custom interface tailored to their needs. Overwhelming all the users with all of the information about a system at all possible times is a terrible anti-pattern and actively inhibits a user’s ability to form a mental model of the working or dysfunction of a system. In such cases, the results are only interpretable if a user knows what to look for, which is contingent on the assumption that they already have a working mental model of what they’re trying to debug in their mind, when this is rarely the case. Instead, modeling the exploratory process as a series of questions and answers the user can easily walk through offers a vastly better user experience in their quest to compare and recalibrate their mental models.

I used to think that exposing all of the information all the time, but this makes me double think that.

I am biased, but the author also caught me with her use of the term "cognitive load".

:programming:cognitive-load:systems:mental-models:
