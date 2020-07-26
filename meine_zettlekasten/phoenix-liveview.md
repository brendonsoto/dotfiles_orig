:phoenix:

# Phoenix LiveView
LiveView is a cool plug in for the Phoenix framework that enables client-side interactivity without having to write JavaScript yourself!

You can write an app that has buttons or whatever interactive elements that can update the page without having to resort to writing JavaScript for it.
It does this over websockets and Phoenix Channels.

The flow looks something like this:
App
  -> button is pressed
    -> message is sent via websockets
      -> server responds to message via websockets
        -> app changes based on response

These are my notes from the PragmaticStudio's LiveView course.


# Making a Live page -- Router setup
To create a page using LiveView first you need a route.
Live routes are created using the `live` keyword instead of the other Phoenix verbs.

For example, a live route to a weather page would be: `live "/weather", LiveWeather`

So the syntastic is nearly the same as other Phoenix routes!


# Making a Live page -- Module setup
Now that you have your route you can create a module for it.
Live modules are located in a `live` directory, in the same directory as `templates` and `views`.

The main dependency to include in the module is the `:live_view` keyword.
For example, this is what the module for the `LiveWeather` page would look like:
```
defmodule App.LiveWeather do
  use App, :live_view
end
```

And now for how to get stuff to show.

## mount
The `mount` function is what sets up your page and its initial state.
The function takes three parameters:
- `params`: any query parameters
- `session`: any session data
- `socket`: the websocket to communicate with the server/client

The most important parameter of the three is the `socket` param since that's what the app uses to let the browser talk to the server.
The socket is basically a struct.
You can setup your initial state by using the `assign` function.

Let's say for the weather page we want the initial reading to be 0 degress F:
`socket = assign(socket, :weather, 0)`

The `mount` function is expected to return a tuple with the first value being `:ok` and the second being the socket.


## render
The `render` function determines what the page shows!
Right now I've only done the first lesson so I don't know how to separate the content out into a different file so this will be inline markup.

This function has only one parameter, `assigns`, which is the state of the page.

To render markup *within the function* use the following:
```
~L"""
<!-- markup -->
"""
```

Using the weather page as an example we could use the following to render the weather:
```
def render(assigns) do
  ~L"""
    <div>The weather now is: <%= @weather =></div>
  """
end
```

Notice how we were able to access the state using the `@` symbol and without prefacing it with `assigns`?

Let's check out how to add interactivity.


## handle_event
The `handle_event` function is used for, well, handling events!
It takes three parameters:
- "<event_name>": the name of the event for the function to respond to
- TODO
- `socket`: same as in the `mount` function

The body of the function is similar to `handle_event`.
Do whatever data manipulations and then return `{:noreply, socket}`

The main difference is if you want to manipulate the page's state.
There are two functions:
- `assign`: set state
- `update`: use the current state to derive the next state
