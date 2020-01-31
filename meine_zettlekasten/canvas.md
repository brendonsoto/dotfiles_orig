# Canvas
:canvas:javascript:


## Overview
Canvas is pretty cool! You can draw things with it!

To really use it there are two main parts:
- the `<canvas>` tag
- the *context* of the canvas via javascript

The following is a basic example of setting up canvas to be manipulated via JS:

```
var canvas = document.getElementById("myCanvas");
var ctx = canvas.getContext("2d");
```


## How to Draw
How do you, personally, draw?
You put a pen/pencil down, drag it across paper, and then lift when done.
It's very similar with code!

To "put your pen/pencil down", use `ctx.beginPath`.
To "lift", use `ctx.closePath`
In between is where you define properties of your drawing!
You can use functions like `arc` or `rect` to draw semi-circles, circles, and rectangles!
Functions like `fill`, well, fill the entire defined area with whatever `fillStyle` is defined
`stroke` can be used to get just a line
