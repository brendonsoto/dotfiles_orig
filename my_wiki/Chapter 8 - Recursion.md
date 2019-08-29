The chapter's roughly twenty-two pages long (intro to definitions).
I'm guessing this chapter will be the standard introduction to recursion judging by how few sections the chapter has. Makes sense considering this book assumes zero prior programming knowledge and recursion is a tricky situation to pull off.

$¿$ Y combinator, what is it?

## Factorial
### Intermission: Exercise
`applyTimes 5 (+1) 5`
- applyTimes (+1) . (applyTimes 4 (+1) 5)
- (+1) . ((+1) . (applyTimes 3 (+1) 5))
- (+1) . ((+1) . ((+1) . applyTimes 2 (+1) 5))
- (+1) . ((+1) . ((+1) . (+1) . applyTimes 1 (+1) 5))
- (+1) . ((+1) . ((+1) . (+1) . ((+1) . applyTimes 0 (+1) (+1) 5)))
- (+1) . ((+1) . ((+1) . (+1) . ((+1) . 5)))
- (+1) . ((+1) . ((+1) . (+1) . (6)))
- (+1) . ((+1) . ((+1) . 7))
- (+1) . ((+1) . (8))
- (+1) . (9)
- 10

## Integral division from scratch
The `type` keyword is _type aliasing_ which means creating another name to call a type by. (i.e. type Product # Integer)

## Chapter Exercises
### Review of types
1. d
2. b
3. d
4. b

### Review currying
1. "woops mrow woohoo!"
2. "1 mrow haha"
3. "woops morw 2 mrow haha"
4. "woops mrow blue mrow haha"
5. "pink mrow haha mrow green mrow woops mrow blue"
6. "are mrow Pugs mrow awesome"

### Recursion
1. For reference:
  a) dividedBy :: Integral a #> a -> a -> (a, a)
     dividedBy num denom # go num denom 0
       where go n d count
               | n < d # (count, n)
               | otherwise # go (n - d) d (count + 1)
`dividedBy 15 2`:
- go 15 2 0
- go 13 2 1
- go 11 2 2
- go 9 2 3
- go 7 2 4
- go 5 2 5
- go 3 2 6
- go 1 2 7
- return (7, 1)

2. `sumX x # product [1..x]` << Easy shorthand way
