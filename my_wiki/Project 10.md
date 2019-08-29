# Project 10
I am a bit confused by this project. I'm not exactly sure what the results should look like so I'm going to look at the expected test results to try to get an idea of what to do.

_Update -- 2018/Apr/5 - 9:35am_
Continuing from before. While comparing the XML files for the tokenizer and the compilation engine I noticed the main difference in the output: the tokenizer is basically a list of all of the valid code words in the file while the compilation engine actually structures the tokens out.

Luckily this process is sequential (i.e. input -> tokenizer -> compilation) so I can focus on the tokenizer first without much thought to the compilation implementation.

All that's known about the relationship between the tokenizer and the comp. engine is that one feeds into the other.

Since the compilation engine is the piece that needs to nest the language's "words" according to the language's "grammar" I can focus on only the individual words.

One thing I do want to keep in mind is *I would like a way to pass a flag to the program to indicate whether to output XML or other*.

## Tokenizer
Can you apply the questions of "is there a hypothesis/conclusion?" to these sorts of problems? I'm not sure, but I'm leaning more towards "no". We already know what the output should be and we know that this part of the project will be the engine providing the expected output. Thus stating a hypothesis and/or conclusion would be redundant. Let's ask the remaining questions.

_What is the unknown?_
- How to create the tokenizer (the code for doing so).
- How to create the compilation engine (the code for doing so).

_What is the data?_
- The supplied test programs
- The supplied expected outputs

_What are the conditions?_
- When the tokenizer is supplied a Jack program it will output an XML file with the lexical analysis of the file
- When the compilation engine is supplied the output of the tokenizer it will output an XML file with the lexicon of the file structured according to the grammar of the Jack language
- Comments should be ignored

We have the input and the output. The *unknown* is the *how*.
Since comments should be ignored, maybe it would be best to start off just stripping out the comments and outputting that list?
Actually, what if we started out just putting together a little scaffolding?
- Set up the input file reading
- Set up outputting a file
Then from there we can scaffold out in english function/method names for manipulating the file and handling multiple files.
Or wait, should there be a file input handler?
How should this be structured out?

Ideally I would like the structure to be like an algebraic equation. I see the tokenizer as `f(x) # y` where `f` is the *tokenizer function*, `x` is a *jack file*, and `y` is the *output XML file*. The tokenizer function (`f`) may have sub-functions to help it run and that's okay. I guess what I'm trying to say is `f(x)` may be a compilation of other functions like `g(h(i(x), j(x)))`, but here we're generalizing the whole tokenization process to simply `f(x)`.

We know `x` and we know `y`. It's `f` that's unknown.

Sorry that I'm restating this a lot. Just exploring a different trail of thought.

So let's start with `f` as its own Python module (going back to Python because, why not?).

_Side Question:_ I'm not sure if I can answer this now, but how can I prove that `f(x) # y` is correct? Would it be through varying `x` and proving that `y` is different? The output of two files should be different as long as they have different inner text, not including comments or white spacing.

Jumping ahead a bit for the sake of getting the bigger picture, let's say the compilation engine is represented by the function `g(y) # z`. `g` is the *compilation engine*, `y` is the output from the *tokenizer function*, and `z` is the *output*.

_Wait_, should the output of these functions really be XML files or should we have a function to *convert a list to XML*? I kind of like the sound of that better, more modularity. Let's use the function `h(list) # xml`.

Thus, the `y` in our *tokenizer function* is not an XML file, but a list/array of values to be transformed. But what exactly are these values?
I think these values should be dictionaries. The keys can be *type* and *value* where type is the word to be use as the XML tag and the value is the actual code word/piece itself.

Going back to the XML function, we can then describe the test of the tokenizer as `h(f(x)) # xml` and the test of the compilation engine as `h(g(y)) # xml-y` (`xml-y` is to distinguish the output from the tokenizer).

I'm actually thinking now what if instead of a list of dictionaries a tree of dictionaries was used instead? That way we can nest tokens in a manner that's readable to the code. Or maybe that would be of more use to the compilation engine. Yeah, I think so.
So verdict: *tokenizer* outputs a list of dictionaries, *compilation engine* outputs a tree.
But then this poses a problem for the XML parser. Are two XML functions needed, one for each type? Would it be better if the XML only took a list and looked for certain keywords to indicate nesting is needed?
I think it's better for the XML formatter to take *only dictionaries/trees* as its input and that *both* tokenizer and compilation engine should output dictionaries.
The list can be seen as the leaf of the tree. Well, maybe not.
I keep flip-flopping.
When removing the idea of the XML output, the first data-structure to come to mind to represent the output is a list/array. Just a list of words.
When removing the XML output on the compilation engine, there is still nesting leftover. We need a way to group them together.
Looking at the grammar again, I do think using a list as input for the XML formatter would be best.
- The list would be the simplest output for the tokenizer
- The compilation engine could output a list too, but a list of dictionaries
Well then, I think this points out my problem. I will just have to have two separate XML formatters. The structures are going to be different so there's no point trying to shoe-horn the structures into the same formatting function. That would be simply hiding the branching in a single module. Plus, it's not like higher level languages have a single formatting method for all data types. A boolean has a different `toString` method than an int does. So it makes sense to have two separate formatting functions.

Let's return to our mathematical models of these functions. First, *tokenizer*:
- `f(x) # y` (actually, let's use english words for functions):
  - `tokenizer.tokinize(file) # list_of_tokens`
- `g(y) # z`
  - `tokenizer.toXML(list_of_tokens) # xml_of_tokens`
- Thus, `g(f(x)) # z` or:
  - `tokenizer.toXML(tokinizer.tokinize(file)) # xml_of_token`

I think this is a good place to start. I feel the compilation engine will follow a similar suit since it has a similar structure to the tokinizer: take in an input, transform it into XML. Well, I guess that's a meaningless comment since a lot of programming is transforming data.

Let's go more into what `tokinize` entails trying this *math* approach again.
We will need to read in a file:
On second thought, I don't think the math approach will help much here because how do you represent a function that takes a function?
DERP! Higher-order functions!
Read file: `r(i, f) # t` # read(input, function) # tokens (array of words)
Or maybe read file is better like: `r(f) # n` # read(file) # n-lines
Transformative function: `f(l) # split(rws(l), symbols)` # function(line_from_file) # remove_white_space(line) then split remaining string by symbols (including between-white-space)

I guess it would probably be better in just pseudocode...
readFile
for line in file:
  removeComments
  removeWhiteSpace
  split the string up into symbols (including white-space)
  add symbols to a list to contain all symbols
convert list of all symbols to xml
write xml to file

Yup. Significantly shorter than the "math" method.

_Update - later same day_
While starting to work I realized I didn't fully think out the problem. I realized this as I started the actually tokenizing. I didn't think about how I would distinguish the parts of the code apart.

_Update - next day_
I need to figure out how to separate out the individual tokens.
The problem is two or more different tokens may be side by side without anything separating them (i.e. call_function(variable);).
At first I was thinking of splitting the words by spaces and then checking the first and last characters in each word for special bits, but the example above shows the flaw in that: sometimes the character is not the first or last.
I could have a separate array to hold the atoms/chars of a token and go through each line, char by char, splitting by white-space and special characters.
My other idea is similar, but instead of creating a new array, the program would be looking for the separating characters and replace them with spaces so we could just split the whole thing. This I think would be more resource consuming.

So maybe the char-by-char approach really would be the best? Here's the general procedure per line (assumes comments & white space has been removed):
1. Create a tokens array/list
2. Create a token_chars array/list
3. For each char in the string/line:
  1. Check if it's a special symbol or white space
  2. If it is:
    1. Join whatever is in the token_chars array so it forms a string
    2. Append the new string into the tokens array
    3. Append the current char into the tokens array
    4. Empty the token_chars_array
  3. Else:
    1. Append the current char into the tokens array
  4. Go to the next char
  5. Repeat 1-4

I implemented the above, but it is buggy. I'll have to figure out why later.

I found the problem! It was a simple scoping issue hahaha. I had named a local variable something I was referencing in the global space. I wonder if I can configure Vim to pick up on these things...
Remaining problems:
- [X] Blanks are in identifier tags
- [X] String constant is being recognized incorrectly
- [X] There's an extra space for some words...
- [X] 'null' is not seen as a keyword for some reason

Wow! Fixing 1 (the top one) fixed the bottom 2 as well! Now just to fix string constant bit...
Hmmm... How to do that?
I figured out how to preserve the string, but the string is being xml'd incorrectly. Maybe if i added an identifier?

Figured it out! I just added a string to differentiate stuff.


### Compilation Engine
Input: An array of syntax tokens
Output: A tree of syntax tokens, suited to the rules of the language's grammar

To simplify things I'm going to not include thorough error checking/handling.
*Assumptions:*
- Class will be the start of the program/token list

My head's bouncing back and forth between trying to plan this and thinking about the implementation.
To go to the implementation for a moment:
What if we took the object-oriented approach and made objects for each structure piece? Or rather, factory objects!
The book splits the grammar into three sections: program structure, statements, and expressions. There can be a factory for each which takes in a token and outputs either a dictionary or an object to describe the grammar.
I guess then using both objects and a factory is necessary.
Objets can represent the individual structure/grammatical bits while the factory can provide the objects.
And this can probably make things more module since each object can have its own output function and it can take in a flag to determine what type of output (xml or whatever's to come in chapter 11).

I guess first it would be beneficial to provide a high level overview of each object?

[[Program Structure Objects]]

Wait a moment. I realize the book's throwing me off a bit. It's structure is making me think
Let's worry about indentation later.

Originally I was thinking of a tree structure, so how would that look?

class
  classVarDec
    type
  subroutineDec



What if there was an iterator object that just held the list of tokens and the current index. The object can have a `getNextToken` function that increments the index and returns the token there. There can also be a `getCurrentToken` class that grabs whatever token is the current one, in case it needs to be referenced multiple times.
^ Update. Instead of `getNextToken` it would be simply `next` to increment the index.
With this setup the error checking is baked in because for each object we can get the token, check that it matches what is expected, and repeat those two instructions until we get to a token that needs its own object.
So for the `class` object, we would first check that the first token is 'class' followed by an identifier token (can check with something like `isIdentifier`) followed by a '{' token and then check if a `classVarDec` object should be created and create it if so.

// Demo bit -- was just doodling
`if firstTOken/token[0] is not 'class' return error`
`else createClass(tokenIterator)`

The *gameplan* then is:
- [ ] Create a `tokenIterator` object
- [ ] Create a `class` object
- [ ] Create a `classVarDec` object
- [ ] Create a `subroutineDec` object

For each class create:
- `Constructor` (checks for correct known tokens, like {, leading up to next object token and then returns the object)
- *if needed, function to check what object to use for the next token (i.e. `isNextTokenVarDec`)
- `getOutput` method (takes in a flag to determine what format - xml)

A concern I had was having a subroutine body that looked something like this:
- varDec
- statement
- varDec

I won't be able to hold the varDecs in an array then because it doesn't account for the order of things.
But then looking at the breakdown of the grammar, 'statements', which constitute the code within if/while/nesting statements, do not seem to allow 'varDecs' (declaring new variables). Thus I guess I can disregard my worry.
Yeah, looking across *program structure*, *statements*, and *expressions* in the book, I should be fine as long as I adhere to the grammar rules laid out here.
Error checking shouldn't be a focus here because this language is "to learn and forget easily".


##### Structures
*#class field/variable

// Update - 04/10/2018 - Oh snap! We don't need this class. We can use `iter()`.
*TokenIterator structure:*
- constructor:
  - *currentIndex
  - *tokens
- `next`
- `getCurrentToken`

*Class structure:*
- class:
  - constructor:
    - *className
    - *classVarDecs [array]
    - *subroutineDecs [array]
  - `hasVarDec`
  - `getVarDec`
  - `hasSubroutineDec`
  - `getSubroutineDec`
  - `toOutput`:
    - `toXML`

- classVarDec:
  - constructor:
    - *static/field (scope? classScope?)
    - *type
    - *varNames (array of varNames/(str))
    - `toOutput`

- subroutineDec:
  - constructor:
    - *routineType
    - *type
    - *name
    - *parameterList (array)
    - *body (array? - or of class subroutineBody)
  - `getParameters`
  - `getSubroutineBody`

- subroutineBody:
  - constructor:
    - *varDecs
    - *statements
  - `getVarDecs`
  - `getStatements`

*Statement structure:*
- statement:
  - _This should be a factory since the statements take different values_
  - constructor:
    - *type (let/if/while/do/return)
    - *expression
  - `toOutput`

*Expression structure:*
- Expression:
  - constructor:
    - *term
    - *operator
    - *term (used after operator [i.e. 1 + *1*])
    - *valid_operators [from book]
    - *unary_operators [from book]
    - *keywordConstants [from book]
  - `isThereOperator`
  - `getOperator`
  - `getPostOperatorTerm`
  - `getTermType`:
    - `getSubroutineCall`:
      - `getExpressionList`




##### Gameplan
After writing all of this down I can't quite decide whether a top down or a bottom up approach would be better. I'm leaning towards top down now. I can always put in mock calls to the statement/expression generators. This way I can progressively test stuff.


Create:
1. [X] -*TokenIterator*- <- Don't need thanks to `iter()` <- Nvm. Iter won't work because I need references to the current item
2. [ ] *ClassStructure*
3. [X] *classVarDec*
4. [X] *subroutineDec*
5. [X] *subroutineBody*
6. [X] *Statements -- rethink how to do this*:
  1. [X] let
  2. [X] if
  3. [X] while
  4. [X] do
  5. [X] return
7. [X] *Expression*


I'm thinking Expressions should not rely on the same token_iterator all of the other classes do, but rather be given a list/tuple and process that. All instances of expressions are within parenthesis or brackets or something similar. This way we can use the surrounding characters as the limiters. This also solves the problem of recursive expressions (i.e. array_1[array_2[value]]).
So what we need is an ExpressionFactory!


Quick mini reflection -- I think I see the value in a functional approach here.
Since the big picture program would be a function to return a data structure representing a class, it would've been best to have a bottom down approach and work up from there. First we would create a function to return a data structure representing an expression or subroutine call and then a statement, and then the program/class. Just a thought for future notice.


Expressions:
Where to start?
How do I break this down?
What are the types of expressions we have to work with?
- constants
- varNames
- accessing a value from an array
- subroutine Call
- expression wrapped in parenthesis
- unaryOp

I think it's safe to say that the subroutine call will be the most complex expression. It can contain a list of expressions.

The constants should be easy to process.
- constants:
  - integer - can check by `isdigit`
  - string - can check for '(str)' in the string:
    - (str) is what I used to tell apart a string constant from varnames
  - keyword - can check for existence in an array

The unaryOp should be easy too. We just check if the current token exists in the unaryOp array and if so, process it as so.

I would guess the next thing to do would be the expressions wrapped in parenthesis. These could be accounted for by checking for a '('.

Now we're left with:
- varNames
- accessing values from array
- subroutine Call

We would need the next token to determine which to use.
- array accessor if '['
- subroutine if '('
- else varName

Array accessor would just entail a recursive call to 'get expression'. The only thing is we would need the list of tokens up to ']' for the call.

For subroutine we would also need the next two tokens. If the second token is a '.' we would have to process the entire thing as another class' function. Else just grab an expression list by:
- Getting all the tokens between '(' and ')'
- Separating the tokens by ','
- Processing each with the ExpressionFactory

The else varName is self explanatory.

So, *ExpressionFactory Gameplan:*
1. [X] Detect constants:
  - [X] integer
  - [X] string
  - [X] keyword
2. [X] Detect UnaryOp
3. [X] Detect operator
4. [X] Detect (expressions)
5. [X] Detect varName -- just put if's for the below for now
6. [X] Detect array Accessor
7. [X] Detect subroutine call


##### Updated Gameplan
1. [X] Create data structures to represent each of the pieces of the compilation engine
2. [X] Update current functions to match the data structures given
3. [X] Create an output function
4. [ ] Create a `toXML` outputting function


###### Data structures
I know I want to use dictionaries to represent bits. But how am I going to tell them apart?

*Base:*
{
  node_type: program_structure/statement/expression,
}

*Program_structure:*
{
  node_type: program_structure,
  program_structure: class,
  name: '',
  classVars: [
    {
      node_type: program_structure,
      program_structure: classVar,
      scope: field/static,
      type: '',
    }
  ],
  subroutines: [
    {
      node_type: program_structure,
      program_structure: subroutineDec,
      subroutine_type: constructor/function/method,
      return_type: void/types,
      name: '',
      parameters: [
        {
          node_type: program_structure,
          program_structure: parameter,
          type: '',
          name: ''
        },
        ...
      ],
      body: {
        node_type: program_structure,
        program_structure: subroutineBody,
        varDecs: [
          {
            node_type: program_structure,
            program_structure: subroutine_varDecs,
            type: '',
            vars: ['', '', '', ...]
          }
        ],
        statements: [
          _StatementObjects_
        ]
      }
    }
  ]
}


*Statements:*
{
  node_type: statement,
  statement_type: let/if/while/do/return,
}

*Let Statement:*
{
  node_type: statement,
  statement_type: let,
  varName/to_be_assigned: '',
  accessor: None/_Expression_,
  value: _Expression_
}

*If Statement:*
{
  node_type: statement,
  statement_type: if,
  expression: _Expression_,
  statements: [_Statement_, ...],
  else_statements: [_Statement_, ...]
}

*While Statement:*
{
  node_type: statement,
  statement_type: while,
  expression: _Expression_,
  statements: [_Statement_, ...]
}

*Do Statement:*
{
  node_type: statement,
  statement_type: do,
  subroutine: _Expression.SubroutineCall_
}


*Expressions*:
{
  node_type: expression,
  expression_type: int/string/keyword/varName,
  value: '',
  operations: Tuple of operator & term pairs?
}

*Array Accessor:*
{
  node_type: expression,
  expression_type: 'array_accessor',
  array: '',
  accessor: _Expression_,
  operations: Tuple of operator & term pairs?
}

*Subroutine Call:*
{
  node_type: expression,
  expression_type: 'subroutine_call',
  name: '',
  parent_class: None/'',
  expression_list: [_Expression_, ...],
  operations: Tuple of operator & term pairs?
}

*Parenthesis/Compound Expression*
{
  node_type: expression,
  expression_type: 'compound',
  expressions: [_Expression_],
  operations: Tuple of operator & term pairs?
}

*Unary Op:*
{
  node_type: expression,
  expression_type: 'unary',
  unary_operator: '',
  value: '',
  opeartions: Tuple of operator & term pairs?
}


##### toXML
I have my node structure which is a nested dictionary.

_Thought_
Would this be easier if the data structure was flat and the relationships dynamically created?

Back to the main thought...
In: nested dictionary
Out: list of XML tokens (indented?)

The trickiest part, I think, is handling the nested structure of everything.
At first I thought I could make just one outputting function, but I need multiple, I think.
I think I need multiple because I'm working with data structures whose innards are different from each other.
They have base similarities, but that's only a slim bit.

So now I'm thinking of making a function for each lexical chunk to convert it into XML.
But remember, the XML is only temporary. This needs to be flexible.
So what if there was a function that takes a lexical chunk and an output type, and converts it into whatever depending on the flag?
This will allow us to work bit by bit too.
I can start on the class and output just a simple:
<class>
</class>
Bit and then expand on it with the vars to get
<class>
  <varDecs>
    ...
  </varDecs>
</class>
And so on/so forth.

*Gameplan:*
Let's try working backwards this time around. Go from Expression, up to Class (so I can tackle recursive calls up front).

- [ ] Expression:
  - [ ] Constant
  - [ ] Unary
  - [ ] Parenthesis
  - [ ] Array Accessor
  - [ ] Subroutine Call
  - [ ] Subroutine Call from Parent class
  - [ ] Operation
  - [ ] varName
- [ ] Statement:
  - [ ] do
  - [ ] if
  - [ ] let
  - [ ] return
  - [ ] while
- [X] SubroutineBody
- [X] SubroutineDec
- [X] ClassVarDecs
- [X] Class -- base


I am putting a pause on this because I'm getting quite frustrated with my own ability.
I started testing this out with the actual project code, but was fumbling all over the place.
I don't like fumbling.
I didn't think this out thoroughly enough or something.
And besides, I've been itching to get to learning Haskell for the longest now.
I feel like learning more functional stuff will make me more prepared for more dificult stuff like this.
So, hasta luego
