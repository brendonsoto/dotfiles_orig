:haskell:

# Compiling
To compile: `ghc <file>`.

Compiling outside of a Stack project is a bit weird. To compile a program that does not have language pragmas use `ghc -dynamic <file>`.
TODO Find out why
For programs with language pragmas outside of a Stack project use `ghc -dynamic -X<LanguagePragma> <file>`
