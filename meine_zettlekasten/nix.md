:nix:


# Nix
Nix is a package manager
It's written using the functional language nix (same name. yeah, a bit confusing)

Packages are compiled and stored kinda like a key/value pair where the key is a hash of the package at a specific version
This allows you to have multiple versions of the same software simultaneously

Packages are made from "nix expressions"

THIS PAGE IS WHAT I WAS LOOKING FOR regarding explanations:
https://nixos.org/learn.html#learn-guides


# Tutorial
Taken from https://nixos.org/guides/dev-environment.html

The file `default.nix` is needed and seems like it's the main config file of it

`nix-build` is used to read from `default.nix` and create the package store

`nix-shell default.nix` is used to then create a shell environment based off of the `default.nix`
So it's very similar to `virtualenv`/`venv`
