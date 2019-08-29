I GOT IT WORKING!!! (with xfce)

[[Gnome Tryouts]]

# If Xmonad doesn't load and returns you to the Manjaro Login screen
This probably means Xmonad needs recompilation.
Go to a separate TTY and try running `xmonad --recompile`
If that doesn't work, login via a 'xfce' DE, open the terminal, and run `xmonad --recompile`
If you already logged in, but into the incorrect xfce terminal, run `pkill -KILL -u yourusername` to force exit that session and return to the login screen

# Xmonad on XFCE (no display manager)
Apparently I've been doing it the wrong way according to [this]( https://wiki.archlinux.org/index.php/Xfce#Use_a_different_window_manager ).
1. Download:
   - GHC
   - XMonad
   - XMonad-contrib
   - XMobar
2. Symlink `dotfiles/xmonad/xmonad.hs` to `~/.xmonad/xmonad.hs` (pay attention to the .xmonad)
3. Symlink `dotfiles/xmonad/xmonad.desktop` to `/usr/share/xsessions/xmonad.desktop`
4. Symlink `dotfiles/.xmobarrc` to `~/.xmobarrc`
5. Run `xmonad --recompile`
6. [Optional] Backup `.config` dir
7. Open *Xfce Settings Mannager -> Session and Startup*
8. Clear any saved sessions and disable session saving
9. Run `xfconf-query -c xfce4-session -p /sessions/Failsafe/Client0_Command -t string -sa xmonad`
10. Log out
11. Log in
12. If xmonad is running feel free to re-enable saving sessions

- Adding a quick note: talked with Greg about `dbus`. He mentions its not worth looking into as its in X-land (the window system)


# Xfce managing xmonad
My "for-dummy (me)" listing
_Note this requires the `monad.hs` and `xmonad.desktop` files in your `dotfiles` repo_
1. Download:
   - GHC
   - XMonad
   - XMonad-contrib
   - XMobar
2. Symlink `dotfiles/xmonad/xmonad.hs` to `~/.xmonad/xmonad.hs` (pay attention to the .xmonad)
3. Symlink `dotfiles/xmonad/xmonad.desktop` to `/usr/share/xsessions/xmonad.desktop`
4. Symlink `dotfiles/.xmobarrc` to `~/.xmobarrc`
5. Run `xmonad --recompile`
6. [Optional] Backup `.config` dir
7. Open "Sessions and Startup" in *Xfce Settings Manager*
8. Enable session chooser and automatic saving of sessions
9. Log out
10. Log in again (to Xfce) and choose "create a new session" (name doesn't matter)
11. Open *Xfce Settings Mannager* again and make the following changes:
   - *Desktop -> Icons* # None
   - *Keyboard* # might help to undo the Super L/R keys or anything using super?
   - *Preferred Applications* # set Terminal to whatever (default in xfce is xfce4-terminal)
12. While still in the *Xfce Settings Manager* go to *Session and Startup -> Application Autostart* (it's a tab) and add an entry for xmonad with the command `xmonad --replace` (make sure it's checked)
13. Run `xmonad --replace` and you should be set!


# Getting media keys to work
On Xfce look in _/usr/include/X11/XF86keysym.h_ for the keycodes for media keys.
Rather, check this out! https://hackage.haskell.org/package/xmonad-contrib-0.13/docs/XMonad-Util-EZConfig.html#v:mkKeymap
Actually, even better: https://hackage.haskell.org/package/xmonad-contrib-0.13/docs/XMonad-Util-EZConfig.html#g:3


## Resources
In no order
- Basic guide :: https://wiki.haskell.org/Xmonad/Using_xmonad_in_XFCE#Configuring_XMonad_to_work_with_Xfce
- xfce4-session-logout problem :: https://forum.xfce.org/extern.php?action#feed&tid#10099&type#rss
- More straightforward basic guide :: http://arjuna.deltoso.net/index.html%3Fp#242.html
- xmobar :: https://archives.haskell.org/projects.haskell.org/xmobar/#running-xmobar
- Right way to do it w/o display manager https://wiki.archlinux.org/index.php/Xfce#Use_a_different_window_manager
