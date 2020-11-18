:haskell:

# Lazy Evaluation

## Exceptions
### IO
Lazy evaluation when performing IO is not recommended since it can lead to problems regarding determining when statements/expressions are evaluated.

In "Get Programming With Haskell" there's a good example in Lesson 24 on page 289. The program originated as a means to get the character, word, and line count of a file that is passed as an argument and append the summary to another file. The program behaved unexpectedly when called with the summary file as the input. It turns out the helper functions for files, such as`readFile`, do not close the handle so the next iteration of the program did. This lead to another error though, an `illegal operation (delayed read on closed handle)` error. This was from lazy evaluation. IO operations represent "actions" so they're executed immediately. This means closing a handle after opening a file will actually close the file, restricting access to it later. As a result, strict evaluation is preferred when working with IO.
