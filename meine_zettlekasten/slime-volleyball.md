# Slime Volleyball
:game-development:video-game:

This is a space for my thoughts and notes while developing my slime volleyball clone.

This project is to make a game as well as experiment with the idea of using phones as controllers!

Originally I had a build tree structure like the following:
| index.html
| controller.html
| js/
| -- main.js
| -- controller.js

For the life of me I couldn't figure out how come I could get either the index page with main.js running, but not the controller files or have index and controller html pages active, but not their js files!
At this point I was using express in a weird way.
I was nesting routes with the hope that the child route would only become available when the parent route was hit.
I tried using the static middleware for express, but that did not help at first.
To get around the issue I wound up inlining the files so that way I had only two html files to worry about.
I was still curious on what I was doing wrong though.

Yesterday (2020/Feb/25) I asked Dan if he could provide insight.
He found a bunch of things wrong with what I was doing.
From him I learned that express routes are global.
I also learned that the websocket protocol isn't a layer on top of http, but rather a separate connection altogether.
Dan described it as being "in front of HTTP".
Through our conversation he gave me another idea for approaching the dynamic generation of routes: basically, get rid of it!
Since routes are global I could have two routes set up, the controller and the main and use socket.io's "rooms" to handle it.
But before we get to that, he recommended trying to build the mvp just with socket.io and bolt on express later.
With that said, I wonder if I even need express then?

But I feel overwhelmed, hence writing the above, and am trying to be positive about it and transform my overwhelmed feelings into positive action!
Hence all of this documentation hahaha.

Gameplan:
- [X] Set up basic socket.io without express (so using node's `http` module)
- [X] Add index file
- [X] Add controller file
- [ ] Update webpack-dev-server (Dan mentioned something about this)
- [X] Add socket.io connection
- [ ] Add communication logic

[2020/Feb/29]
Continued working on the game today.
Moreso the server part.
I was thinking about the experience of the controller page.
I know I need to limit the number of players that can connect.
At first I was thinking of creating a "gate" where when you visit the controller page there will be a text box to enter in a code to join a game.
This code would be created on the server and displayed on the index/main game page.
However, I don't think I want to go deep down this rabbit hole.
The act of creating the tool is not giving me as much joy as I expected.

Hence, I do not think I will be pursuing a robust controller experience.
I'm going to leave it as it is and focus on just getting the controllers to control the slimes.

A thought I had:
I know strings are usually terrible for games, but my game is pretty small so I figured it wouldn't be bad to send string data.
But what if the data were all just bools?
This is where I wish there were more support for sum types and abstract data types because then it could be like haskell and I could represent movements like `data Move = Left | Right | Jump`.
