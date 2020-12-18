:ideas:

# Whiteboard App
See Good Notes on Ipad for ideas
lol Ipad...not iPad


# To explore
- multiple background (i.e. Grid, Lined, blank, coloured, custom image)
- multiple admins
- shape tool?
- image
- moveable by other people
- chat
- mute members (only by admin)


# V1 (MVP)
- ability to create rooms
- ability to join rooms
- one admin
- grid background (solid lines) << see if you can make grid variable size
  * (https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/createPattern)
- tools:
  - pen
  - colour
  - erase
  - text
  - laser (like in google meet)
  - size? (or at least default sizes for pen/eraser)
- admin view:
  - member controls:
    - allow member to draw or not
    - kick member
    - set grid spacing/dimesnions
    - copy room link
- student view:
  - chat


# Rough Gameplan
## Drawing page
First figure out the functionality part
Make a page you can draw on
No color changes, chat, toolbar, anything
As simple as can be
Entire page is canvas

[UPDATE: 2020/Oct/15]: Done!

## Tools
Add a bottom section for tools
Include the tools mentioned above

[UPDATE 2020/Oct/15]: Implemented basic Pen and Erase!

[2020/Oct/16]:
Going to try tackling colour now
Talked with Court about best way for her kids to know what it is
I'm going to focus on pen first and then text colour
The UI will be a little dot next to the tool like an exponent
Once clicked, a popup window will show with the avail colours
*Either* when a colour is clicked *or* drawing commences the popup will disappear

Steps:
- [X] create colour picker dot
- [X] add popup bubble
- [X] add colour options
- [X] add event listener for colour options:
  - [X] add listeners to all of the elements
  - [X] enable the listeners to differentiate colours
  - [X] set active colour and disable the rest
  - [X] set stroke colour
- [X] add event listener to colour bubble
- [X] add event listener to canvas for closing popup

[2020/Oct/19]:
Let's try the lazer bit
So it's like the pen, but only lasts for a bit...
Almost like an animation/transition
- [X] add lazer button
- [X] add drawing capabilities to it

I guess one thing we can do is as the the mouse is pressed, log all of the values into an array and once off set a timeout to erase it

Found a way to recreate a "lazer"
Similar way with Pen
On mousedown, push the coordinates to an array and set a timeout that will
- pop out the *first* coordinates
- set line to using the coordinates
- set the `globalCompositeOperation` to `'destination-out'`
- if the array is empty, set the `globalCompositeOperation` to `'source-over'` and return null

One problem with this is how to implement it so when one person uses a lazer to draw, it doesn't mess with other people's drawings.

[2020/Oct/25]:
Trying Text tool
Initial steps:
- [ ] on Text tool click, create a `textarea` elem in middle of canvas
- [ ] when clicking away from the elem, make sure focus disappears
- [ ] on `mousedown` set selected `textarea` as *active*
- [ ] on `mousemove` move the `textarea` elem via `translate`

[Update 2;51pm]:
For the text tool, instead of clicking the tool to spawn a `textarea` elem in the middle, have the initial click change the cursor to something that indicates "click to make the text area". Once they click, the `textarea` element will appear.
To change the cursor, maybe once the Text tool is clicked, add a class style to the whiteboard div. Then we can apply styles to change the cursor style when that class is set. Then also an event handler can be set on that class so when clicked, get the cursor's X and Y position, create text elem, and give it styling to transform it to the certain position
- [X] on Text tool click, add a class to the canvas body which will change cursor style to `text`
- [X] add an event handler for the new class that logs the coordinates
- [X] in event handler, create the text area and position it with the coordinates

[2020/Nov/15];
Text tool talking with Court
- [X] Keep text tool active once user clicks onto board
- [X] Once user clicks on the canvas with the text tool active, focus into the textarea that is created so the user can write immediately
- [ ] Instead of a textarea appearing, box and all, remove the border and try putting a flashing icon indicating where the cursor is (think terminal/text editor) << UPDATE [ Not doing ]
- [X] When clicking outside of a text area, if there was no text in the first textarea, then delete that element
- [X] When user clicks outside of text area, hide border/surrounding box
- [X] Give textarea transparent background
- [X] Make the intial dimensions of textarea smaller
- [X] See if when typing in a textarea box that the box expands as the words go beyond the boundaries
  * [X] If not, Try to see if when typing in a textarea box and the words go beyond the box, instead of the box jumping to the next line to show what the user is typing, stay at the beginning of the sentence
- [X] Fix problem of clicking into another textarea creates a text area

Separate:
- [ ] Text font = century gothic (https://www.fonts.com/font/monotype/century-gothic)
- [ ] Make pen and eraser styles bigger (maybe add circle icon for eraser?)
- try to not erase the whole canvas when resizing the window (maybe `.save`?)
- undo?
- + redo?


## Chat Window area
Make the container
Distinguish between Teacher/Admin and Student

Create fake data structure representing members

Create controls

Create fake data for chat

## Chat functionality
Add text
New text should show

## Admin tools
Should send messages (even just console logs for now) on what action to take on who

## Test server
Express for now?

## Once Prototype Looks GOod
Migrate to Phoenix



# 2020/Nov/29
I think the goal for today is either to do CSS stuff or functionality
Actually, a mixutre of both
Basic functionality for toggling between the admin/chat section
Then styling


Reduce font-awesome size
But first measur ehow much data is dl'd


I also need the home page
The home page either creates a room or joins a room

Pages:
- Home
- Join whiteboard
- Create whiteboard

I'm thinking of having the three sections on the page altogether, but just hiding them.
There's not much content.

Or maybe I should just have three static pages?
I'm thinking of that so I don't have to deal with the back button or anything


## From Courtney:
- [X] Make textareas only editable when the text tool is active (this is so you can draw/highlight on the text)
- [X] Clear board button for Admin only
- [X] Make text from text tool bigger
- [X] Make drawing tool half as big
- [X] For the text tool, see if you can make textareas stretch horizontally, apply a max-width, and then have the sentence/text stretch vertically


## [2020/Dec/3] Next steps
- [X] Ask Court for max width on text tool
- [X] See if when entering text in a text box you can manipulate the Enter key to just put a newline


## [2020/Dec/6]
Continuing work

### Meta / Dev Work
- Consider gulp?
  - Transpile + minimize assets?

### Home Page
- [ ] Change headline to have mixed up letters and colours
- [ ] Change colours of buttons

### Join Page
- [ ] Change headline to have mixed up letters and colours
- [ ] Change colour of inputs and labels
- [ ] Change button style to be more consistent
- [ ] Wire up form

### Whiteboard
- [ ] Rename current whiteboard.html to have admin in it
- [ ] Take current whiteboard.html and make a student/limited version

### Server
- [X] Set up serving the index page
- [X] When admin page is set up, set up a socket connection
- [ ] On draw send message

I can tell what requests are coming in by using referrer



## [2020/Dec/18]
After reading some articles online (todo, link them here) I'm convinced going vanilla-js may have been a not-so great idea since I'd, most likely, will be working on this time to time. With that in mind, it would be most beneficial to use whatever I'm familiar with. On the other hand, I am curious about Preact and have heard it's basically identical to working with React, so I'm going to try that!

I have the typescript template installed and running. Pretty nifty how it gives you routing right out of the box! Now to migrate. The migration may be slightly different in order. Since routing's in already, I'm thinking about taking it page by page starting with the home. This is opposite from how I developed, starting at the meat of the app with the whiteboard.

Gameplan:
- [X] Move CSS whole
- [X] Remove the header
- [X] Move home page markup
- [X] Move join page markup
- [X] Touch up styles
- [X] Move whiteboard
- [ ] Separate out components (tools, sidebar)
- [ ] Assets?


I might do this as an experiment since I'm in a decent place with the other version.
