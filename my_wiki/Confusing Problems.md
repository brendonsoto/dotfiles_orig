# Confusing Problems
_Ranging from compilation to hlint and more_


## Could not find module ‘Prelude’
*When is this problem encountered:*
Upon compilation, sometimes via hlint when coding with ALE

*Solution:*
Add the flag `-dynamic` to `ghc` when compiling
