= Hooking up with Hydrogen =
This isn't a chemistry joke.

This is for syncing Ardour with Hydrogen drums.

1. Start *Jack* up via `qjackctl`
2. Open *Ardour*
3. On the lefthand side there'll be a button that says "Int". Click it so it says "Jack"
4. Open *Hydrogen*
5. In the menubar go to *Tools > Preferences*
6. Click *MIDI System* tab
7. Set *MIDI driver* to *JackMidi*

Now when you hit play in Ardour it should set off Hydrogen as well
