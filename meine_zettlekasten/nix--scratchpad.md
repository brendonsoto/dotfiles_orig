:nix:

# Scratchpad

Trying to figure out why I can't get nix-shell running on Big Sur
I want to take the script apart bit by bit to understand

I made a branch off of the `nix-shells` repo to not mess anything up

The command to run is `nix-shell /path/to/nix-shells --attr business_portal`
So let's break this down

`nix-shell` creates the shell environment

The path is to the "derivation"

// What is a derivation?

`--attr business_portal` is like a target for the `default.nix` file in `/path/to/nix-shells`
I skipped a step there
`nix-shell /path/to/nix-shells` will look for a `default.nix` file in that path and execute that

Looking in the `default.nix` file, the area that draws my eye is near the bottom, the area commented with "# Shells"
This is where, I believe, the `--attr` flag comes in
It's like a dictionary where the keys are the attribute values and the values are the shell environments

In `nix-shells/shells/business_portal` I see both a `default.nix` and a `shell.nix`

I think a better way of doing this is seeing if I can create a nix-shell script/file/w/e to trigger this in the least amount of lines possilbe
