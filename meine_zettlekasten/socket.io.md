# Socket IO
:socket.io:javascript:

This is the node library https://socket.io

I'm following through the tutorial again (I always forget the library) and decided to make notes this time.

There are two parts to socket-io:
- server setup
- client connection

There are instructions on the site for how to set up the connection.
From a high level view, it seems the default behavior is to set up the web socket connection on whatever server socket.io is involved with.
This enables us to not have to worry about domains when connecting the client to the server.
You define what to do when a user connects using `io.on("connection", socket => {...})` and disconnect behavior using `socket.on("disconnect", () => {...})`.
Note that `socket` calls are within `io` blocks.

Just as a client can emit messages to be picked up by the server, the server can emit messages for the client to receive.

The gist I'm getting is this:
A websocket connection is made using `io`
To actually _listen_ and _react_ to messages sent via websockets we use the following event listener: `io.on("connection", socket => {...})`
The `socket` function param in the above bullet is the interface devs have to react to websocket events
To add an event listener on the websocket connection, use `socket.on("<an-event-i-named>", ...args)`
This will listen to events sent from the client

The client has its own connection setup
Once setup, the client can `emit` events just as the server can
Additionally, the client can *listen* to events from the server as well using the same syntax
