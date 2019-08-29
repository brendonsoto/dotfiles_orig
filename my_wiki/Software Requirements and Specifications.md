# Software Requirements and Specifications
"a lexicon of practice, principles and prejudices"
by Michael Jackson

There are multiple paths to take when reading the book, all suggested by the author. I have been more focused on solutions rather than spending more thought on the problem so I will go about the "Overview" path first and see where that takes me.

Therefore this section will be organized primarily by suggested path and then by section/chapter. I will have a separate primary section, an "Other" section, at the end for if/when I decide to read chapters outside of any of the suggestions.

Actually, I don't see the above as necessary. I'm just going to write about the chapters as I go along.

## Introduction
Skimming the chapter, but my initial thoughts are this section will discuss an overview of the medium of the problems we solve, how to talk about said problems, and then how to plan for said problems.

In the intro paragraph, the author talks about finding the engineering aspect of software, building useful things, to be what interests him most within software development. So hopefully the emphasis will be on useful concepts that can be applied immediately?

### The Machine and the World
The end of this section provides an excellent summary:

"The problem is in the application domain. The solution is the solution."

This also glazes over another software/problem solving concept of "What and How". The "What" talks about the problem itself, what the author calls the *application domain*, where the "How" is the solution, how the problem is resolved.

### Focusing on Problems
The author brings up a flaw within the community regarding discussing and exploring problems. He believes most current attempts on talking about problems are really talks on solutions instead. What does it mean then to talk about the problem? Would it be simply talking about the players involved, the desired outcomes, possible edge cases, side-effects, etc.?

### Domain Descriptions
Don't assume. State and write down the obvious to ensure everyone is on the same page.

Don't think of the system as simply input/output because that doesn't help specify the application domain, the problem itself.

Instead, see the system as a coordination of processes which will allow you then think of the application domain in terms of when should things start within the system. In otherwords, this allows the application domain to actually exist within the system.

### Modelling
The author argues that it is not suffice to lump the description of the application domain in with the description of the machine. This is how most of us know modelling. We "model" the application domain within the machine domain and call it a day. The reason why this does not work is because information is always lost. There are descriptions that only belong to one or the other, and some that belong to both.

The author argues  to describe the application domain, then the machine, and then the commonalities. So like a venn diagram.

### Description Technique
Requirements # details on the application domain
Specificatiosn # details on the machine

The author is big on descriptions stating it's the most important part to software. He talks at a high level on ways to be more descriptive when talking about problems and solutions. Here are what he lists:

Definitions:
Documenting definitions helps to determine new and existing ideas to clarify when talking about the real-world/application domain or abstractions that deal with the real-world/application domain.

Description Scope and Span:
Scope defines the metrics of interest.
Span is used to describe the area of the world the problem pertains too.

Refutable Descriptions:
The author argues all descriptions should be refutable, meaning there should be arguments both for and against it, but I am confused as to what the merit of this is.

Partial Description:
This is about separation of concerns. Descriptions should isolate parts of a problem/machine.

Hierarchial Strucutre:
The author seems to think lowly of this, or least points out that hierarchial structure is frequently accompanied by redoing the architecture. Relates to top-down thinking.

There's a last section about moods, but I don't get it.

### Methods and Problem Frames
I'm going to stop saying "the author..." because everything is me restating what he said in someway.

There's a negative habit in thinking a singular problem-solving mindset can solve everything. It can't. Our failure to talk about problems leads to an ignorance of a dichotomy for problems.

There are differen't classes of problems. This is where *problem frames* step in which attempt to classify said problems by providing a structure for the problem to facilitate reasoning about it.

### Problem Complexity
Complex problems are problems that don't completely fit into a problem frame, but require multiple. The objective then is to split the main problem into appropriate problem frames and look for any overlapping areas, areas that fit into multiple frames. I'd like to quote the ending paragraph of the book because it's so powerful:

"
The task, then, is to separate out the different problem frames in their parallel structure. Identify the principal parts of each frame; and identify the overlapping parts and aspects of the application domain and requirement that they cover. This is the essence of problem decomposition. [<< this part really hit me] When you separate a problem by problem frames, you're separating it into simpler sub-problems **that you know how to solve**. Then you have a real chance of mastering the complexity that is found in every realistic software development.
"

### Introduction Recap
Though just an introduction, this section was filled with a lot of information. I feel super ignorant now. For all of my fascination with systems and software architecture I never spent a lot of time thinking in terms of domains. I always thought the problem requirements and the software were one, but upon reading this, and an online article regarding software design from yacoset, I see I'm very wrong. Separation of concerns is constantly reiterated as a best practice, and here I've failed at the beginning!

This book gives me hope though. It reads and reminds me a lot of Polya. I shouldn't have been so surprised to see his name pop up. My hope is, even reading the "Overview" path suggested by the author will give me sufficient mental tools to start thinking in a different way.


## Descriptions
Descriptions, and reflecting on them, are ways to analyze thinking. It's similar to the rubber-duck effect, where talking to someone about a problem can help you understand it more. This seems super for not looking like a weirdo by talking to oneself.

And now for a dichotomy of descriptions:

*Designation* focuses on a single thing. This thing is what the author calls a "phenomena". That term probably is more accurate, but I mix it up with a song from the muppets as well as an aibum from the band UFO. I'm going to describe "phenomena" as a relationship. Here's an example the author used to describe a designation that leads me to think relationship is a good synonym:
"
'The human genetic mother of x is m ~ Mother(x,m)'
The derignated ghenomenon is the relationship of genetic motherhood between two people; it will be denoted in descriptions by uring the fredicate Mother (x,m). So Mother(Joe,Lucy) will mean that the genetic mother of Joe is Lucy.
"

*Definition* is used as "formal definition"; a way of referring to a thing and its properties.

*Refutable Descriptions* are descriptions that could be proven false. Still confused on what their value is.

*Rough sketches* are used to communicate half-baked ideas, ideas that aren't solid and may use ambiguous terms to describe the idea.

A single description is not enough for a whole project, hence multiple descriptions as laid out above.

Additionally, having multiple descriptions is the groundwork for *separation of concerns*. Each description can represent its own part of the whole and therefore can be worked on individually.

*Scope and span* are referenced again here. Scope refers to the measurable parts of the problem, the tactility of it, whereas span refers to area the scope effects and its boundaries. The author uses rainfall and population maps as examples. The number of rainfall or people per year is the scope and the physical locations, where on a map the rainfall or people is being measured, is the span.

The section of *Descriptions* ends with a really great example of finding the real problem within a definition with a lot of scope and span details. The problem itself is unimportant, but what is is knowing that scope and span, the details, can very easily get in the way of understanding the problem and thinking of it in simpler terms. Perhaps it would do well to write the main problem at the top of a document in simple and concise language and then provide scope and span underneath. Then by re-reading the document one can see if too much information is given or perhaps the brevity could inspire new simple solutions!


## What and How
A micro discussion on separating the purpose and implementation aspects to a problem.
The *What* describes the purpose for a system or problem, the application domain, what use the problem aims to provide. The *How* is all about the gears under the hood that make the *what* happen.


## The Problem Context
The problem context is everything involved in the problem. This includes both the application domain and the solution/machine, but the solution is still high level. The context is like a bird's eye view of the problem, identifying all of the pieces that may be involved in the problem. It is a means to exploring the problem.

## Problem Frames
