# Planck


## How to compile and flash
1. Reset the keyboard -- there's a button on the back of it. There should be a key combination to do it too
2. Run `sudo make planck/rev6:my_layout:dfu-util`

If there's an error regarding some `asm` module, what I did to get around it was to remove the warnings as errors. To do so:
`v \`rg Werror -l\``
What we're doing here is using `rg` to find all instances of *Werror* in the `qmk_firmware` directory and opening them in vim. Afterwards we can simply comment out all instances of `-Werror` and recompile
