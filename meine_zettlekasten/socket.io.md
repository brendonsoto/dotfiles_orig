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
