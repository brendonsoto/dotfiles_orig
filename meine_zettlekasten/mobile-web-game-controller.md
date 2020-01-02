# Mobile Web Game Controller

I want to do something like Kahoot where it's a game on the web and people can access it on their phones, but I want the phone to be a mock controller and the game to be an actual game!

According to MDN + Can I Use the accelerometer and permissions apis are not available on Safari on iOS which is a bit of a dealbreaker for me considering my friends mostly use iPhones.

So as an alternative, there will have to be a mock controller on the phone.
There will be a tiny switch in the top to make it accessible for left-handed users.
The screen will be divided into two, one part for a joystick, the other side for buttons.
Or maybe each half can have its own thing?

I was thinking of making this more of a library.
That way different controllers could be made for different games!
Even though it would probably be bad to overload it like a PS controller.
But for now, let's keep it simple and do just one thing, joystick + two buttons.

Then that would send data over to a server which would then bounce the data back to the client.
So kind of like a three way call?
