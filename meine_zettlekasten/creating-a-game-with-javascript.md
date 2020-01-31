# Creating a Game with JavaScript
:video-game:game-development:


## Overview
This is largely notes from [MDN's breakout tutorial](https://developer.mozilla.org/en-US/docs/Games/Tutorials/2D_Breakout_game_pure_JavaScript/Create_the_Canvas_and_draw_on_it) plus my experience creating a slime volleyball clone.
I've done the tutorial once before, but did not take any notes on the experience. I remembered some of the general ideas, like the game loop and object collision, but I forgot some of the more general steps.


## Setup
With pure JavaScript, using `canvas` is one way to create games.
Once a `<canvas>` element is on the page a reference must be made to it in JS to manipulate it. For example (from the docs):
```
var canvas = document.getElementById("myCanvas");
var ctx = canvas.getContext("2d");
```

## Establishing the game loop
If using [canvas](./canvas.md) you'll want to set up a loop using either `setInterval` or `setTimeout`.


## Clearing the screen
To clear the screen per render, use `ctx.clearRect` (where `ctx` is defined as in the above example)


## Movement
One way to make things move is to use variables in function calls to draw things.
For instance, the first two params of `rect` are the x and y coordinates.
By using variables, we can vary the coordinates per frame.


## Basic collision detection
Changing direction is essentially:
- current x position + x velocity (dx)
- current y position + y velocity (dy)

Thus, the simplest form of collision detection is:
- object width / 2 < x + dx < canvas.width - object width / 2
- object height / 2 < y + dy < canvas.height - object height / 2

Collision detection's hard haha.


## Program structure
One thing that has been really helpful is making functions to handle drawing each type of element.
