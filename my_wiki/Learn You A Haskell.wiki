== Chapter 2 ==
_2018-Apr-24_
I've seen `<-` used in *list comprehensions* and I've seen `->` used in *type declarations*.
Is there a specific difference to the two other than one is for lists and the other types? 
Are they interchangeable?
^ No. `->` means 'returns' hence why it's used in type declarations.

OH!! Are `->`s used to signify functions are curried?
Are all Haskell functions curried since it's a lazy language?
^ By "since it's a lazy language" I mean, since a function can take multiple arguments, it's kind of like loading the function with them one at a time. Haskell is lazy so it waits until it actually has to use a variable to bring it into memory. As it waits, we can set up the function more and more every time we have a variable/argument provided to the function so we can build a template for the function. The function/compiler/code is filling in the gaps as its function is given more arguments.

== Chapter 3 ==
_2018-Apr-24_
Important quote from Chapter 3:
"If a pattern match fails, the list comprehension will just move on to the next element, and the element that failed won't be included in the resulting list."
This, to me, is important because it tells me extra caution should be taken when working with list comprehensions because errors won't propogate up to the surface/ux where the error could be made known.

== Chapter 4 ==
_2018-Apr-24 => 2018-Apr-25_
On the part with Guards/Where?.
Oh my god, I love the look of the syntax. Just look at the final (?) bmiTell function with the guards and the where statement. It. Looks. Pretty.

I like to think of guards syntax like this:
In order to get past the door (|) you need to satisfy this condition (post |) and then you can get whatever (post =)

Another oh my god moment (in the "Let it be" section):
`let` is Haskell's way of providing `lambdas` (think Python)
But Haskell's way makes sooo much more sense visually.
It's like when you're scribbling equations on paper, like algebraic equations, and then you insert values by writing "Let a = whatever" on the top (I did this in my electronics classes).
Wow.
THATS COOL.

== Chapter 5 ==
_2018-Apr-27_
Writing down the evaluation of take' 3 [4,3,2,1]
1. Check n <= 0 -- False
2. Check if the second param is an empty list -- False
3. Return the head of the list (4) and the result of take' 2 xs ([3,2,1]):
  1. Check n <= 0 -- False
  2. Check if the second param is an empty list -- False
  3. Return the head of the list (3) and the result of take' 1 [2,1]:
    1. Check n <= 0 -- False
    2. Check if the second param is an empty list -- False
    3. Get the result of take' 0 [1]:
      1. Check if n <= 0 -- True
      2. Return an empty list
    4. Returns 2:[]
  4. Returns 3:2:[]
4. Return 4:3:2:[]


== Higher order functions ==
Yup! All functions in Haskell are curried. I asked about this at chapter 2 (I think).


== Modules ==
_2018-May-1_
I'm down in the midst of the Data.Map section.
It seems that the idea of using an object in JavaScript to represent data would be analgous to using a tuple in Haskell.
Associated lists are basically Maps which are trees of tuples.
