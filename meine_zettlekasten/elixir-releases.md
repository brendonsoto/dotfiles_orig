:elixir:

# Releasing Code
Alongside _releases_ there are also _hot upgrades_ which is a sort of _deployment_ where the currently running application be changed without stopping it so there's no disruption to the user's experience

A tool for facilitating this is [Distillery](./elixir-distillery.md)

# What is Versioned
Application code and any data it operates on are both versioned independently

While application code is versioned in the `mix.exs` file data is versioned within each server module
