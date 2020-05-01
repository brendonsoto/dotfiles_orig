# Contents
  - [Overview](#Overview)
  - [How to Implement](#How to Implement)
  - [Functions](#Functions)
    - [init](#Functions#init)
    - [handle_call](#Functions#handle_call)
    - [handle_cast](#Functions#handle_cast)

:elixir:

# Overview
GenServer is a part of the OTP framework
It provides general server behavior

# How to Implement
To create a basic GenServer the following is needed in a module:
- `use GenServer` -- introduces GenServer functionality to the module
- An [init](##init) function
- A [handle_call](##handle_call) function

Once those elements are in your module you can use `GenServer.start_link` to spin up a process
It works similarly to `spawn_link` in the way that if the process passed in fails that failure will propogate up and cause the caller to fail as well
The return of `start_link` is a tuple usually in the form of `{ :ok, pid }`

To call a function in that process use `GenServer.call(pid, :atom)`
The atom as the second argument should be something `handle_call` is expecting

# Functions
## init
The `init` function is to establish state returned in a tuple where the first param is `:ok` and the second the state
Interestingly enough if `init` is missing from the module Elixir will inject a basic implementation
Try it out in iex to see for yourself

## handle_call
This function acts like a router
It listens for an event and then updates the state according to whatever functionality is defined there
The function can return tuples to tell the server how to respond
One example of this is by passing a tuple where the first element is `:reply`
Usually replies look like this: `{:reply, value_for_client, updated_state}`
This tells the server to respond back to the client and what the state of the server should look like from then onwards

## handle_cast
A message can be *cast* to the server which is to say a one-way message can be sent
When a message is cast it is expected that the server *will not reply*
The return of this function is a tuple with the format: `{ :noreply, state_of_process }`

# Debugging
The `start_link` function can take a third parameter, a keyword list, which can be used for debugging
To do so use `[debug: [:trace]]`

## trace
What adding `:trace` does is output messages about the functions being executed
Think of it like a step-by-step debugger but without having to give it the command to step

## statistics
Adding `:statistics` allows Elixir to collect data about the process
To access this data use `:sys.statistics pid, :get`
This will give you data such as:
- process start time
- current time
- load of the process
- how many messages have been sent
- how many messages have been received

## get_status
This isn't really an option to be added to the `:debug` list, but a function from `:sys` to get information about the process

If you want to modify its output create a function `format_status` with the following parameters:
`def format_status(_reason, [ _pdict, state ])`

As of this point, I'm not sure what `reason` or `pdict` are
