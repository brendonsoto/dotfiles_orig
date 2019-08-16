Trying to get Xmonad to work with Gnome 3 on Manjaro.


- Downloaded `gnome-flashback`
- xsessions/xmonad.desktop
- modded .xinitrc `get_session()` to include xmonad following the same syntax
- There's somethign saying to use an xmonad.start script on wiki.haskell.org, but I'm not sure about it.
- Important directories:
  - /usr/share/applications/*.desktop -- for getting things to start on login for ALL users
  - $HOME/.local/share/applications/*.desktop -- for current user only things to start on login

= Experiment 1: Trying 2.2 A Simple Hybrid Alt. =
1. I created /usr/share/applications/xmonad.desktop and filled it with the contents under *2 Setting up Gnome to use Xmonad*
2. I created /usr/share/xsessions/xmonad.desktop and filled it with the contents under the same section
3. I created /usr/local/bin/xmonad.start with the following two lines:
```
export WINDOW_MANAGER=xmonad
gnome-session
```
4. Lastly, `$HOME/.xinitrc` was modified to include xmonad as listed in https://xmonad.org/tour.html but modified:
  1. I removed the `xpmroot` deal since that only sets the background
  2. I'm deleting the call to `exec $HOME/bin/xmonad` because something's telling me that's not right. The file does not exist
5. I add `$HOME/.xmonad/xmonad.hs` following the configuration guide at https://wiki.haskell.org/Xmonad/Using_xmonad_in_Gnome#Configure_Xmonad_to_interoperate_with_Gnome 
   Specficially, I added the gnomeConfig, plus changed the terminal to use gnome-terminal and changed the modmask to use the command key. Lastly added additional keys for shutodwn/lock/sleep, etc.
6. Ran `xmonad --recompile` all went well!
7. Time to reboot
8. So I saw $GNOME FLASHCITY$ as a session, but no xmonad :( I'm trying out the gconftool2 stuff now...
9. That didn't work either so now I'm trying instructions from https://wiki.archlinux.org/index.php/GNOME/Tips_and_tricks#Custom_GNOME_sessions
10. That did not work either :(
11. This partially did it https://beginners-guide-to-xmonad.readthedocs.io/
12. I just forgot to recompile `xmonad --recompile` at the end, but afterwards, that worked pretty great!



= Final Instructions =
1. Install GHC, gnome-flashback, xmonad, xmonad-contrib
2. 



== Questions to explore ==
- What exactly is `dbus-launch`?
- What is a $session bus$?
- What is `dbus-daemon`?
- What exactly is a `daemon`?
- The full command is `dbus-launch --sh-syntax --exit-with-session <windowManager>`. What is going on?
The option `--sh-syntax` tells `dbus-launch` to emit shell code to set up the environment [variables] (taken straight from the man page). The `sh` part requests `bash` code.

As for `--exit-with-session`, apparently it should be run with `dbus-launch` for distributions using `dbus-launch` as part of a standard X session. { TODO Reword this } It seems to be a sort of listener process, trying to connect to either the X server or the terminal, if X is unavailable, waiting for input indicating to kill the message bus. The manual also mentions this option is not recommended, but supplied for backwards compatibility.

The last bit just seems to be the program (titled as $PROGRAM$ in the man page). I can't find anything in the man page related to $PROGRAM$ or to $ARGS$.

