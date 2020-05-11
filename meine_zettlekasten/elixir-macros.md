:elixir:

# Macros
*Never use a macro when you could use a function* (Programming Elixir, p303)

The two man modules for macros are the *Macro* and *Code* modules

Macros are expanded before a program executes

One function handy in creating macros is `quote`
It returns the *internal representation* of its arguments
Example:
`quote do: (a=1; a+a)`

To *undo* or *revert* the internal representation, use `unquote`
An important note is that `unquote` can *only be used* within a `quote` block
Example:
```Oh! I forgot to comment to ask in my `histogram` implementation. Is it
defmacro macro(code) do
  quote do
    IO.inspect(unquote(code))
  end
end
```

Another way to run an internal representation is by using `Code.eval_quoted`
Example:
```
fragment = quote do: (a=1; a+a)
Code.eval_quoted fragment
```
