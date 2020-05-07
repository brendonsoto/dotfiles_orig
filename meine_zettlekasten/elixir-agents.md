:elixir:

# Agents
An agent is a background process that has *state*
Under the hood it's an OTP server

## When to Use
Use Agents and [Tasks](./elixir-tasks.md) when dealing with specific background activities
You can wrap them in modules to make them interchangeable with GenServer modules

## Helpful Functions
Some helpful functions are:
- `start`: Create the agent and give it an initial value
- `get`: Get a value from the agent
- `update`: Update a value

Example:
```
{:ok, count} = Agent.start(fn -> 0 end)
Agent.get(count, &(&1)) # id func
> 0
Agent.update(count, &(&1 + 10))
> :ok
Agent.get(count, &(&1))
> 10
```

Notice how all of the functions take in two args:
- the process of the agent
- a function to manipulate the data (even for `get` calls)

## Naming Agents
You can *name* an Agent by providing a keyword list as its second argument
Example:
```
Agent.start(fn -> 0 end, name: Count)
Agent.get(Count, &(&1))
```

In the Frequency example in the boook Programming Elixir, agents almost seem like a lightweight substitute for GenServers
