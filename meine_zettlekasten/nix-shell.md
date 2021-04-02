:nix:

# Nix-shell
`nix-shell` is used to create a shell environment
It's similar to `virtualenv`/`venv`

You can say what packages to include in a shell environment either with a `*.nix` file or by using `-p <deps>`

Use `<dep>.withPackages( packages: [ packages.<w/e> ] )` to add packages dependent on a parent package, like Python + libraries

*.nix files look something like:
```
{ pkgs ? import <nixpkg> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.htop,
    pkgs.vim,
    pkgs....
  ]
}
```

The first line is saying whether to use a local or online instance of packages
Read more [here](https://nixos.org/guides/towards-reproducibility-pinning-nixpkgs.html)

The dependencies are in `buildInputs`

You can also use `shellHook` to execute something on shell load
You can set env vars right w/in `mkShell`
