= OSX =
== Problems ==
=== launchd eats up CPU ===
A process is running wild in the background.
To find the process, try looking in `/var/log/system.log` for anything matching *error*.
If you don't find anything, I don't know what to do from there.
If you do find something, try to find the process handling that program and kill it.
