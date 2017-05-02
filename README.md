# My Dotfiles

Consists of:

* .bash_profile
* .bashrc
* .vim
* .agignore (file patterns to ignore when using [the silver searcher](https://github.com/ggreer/the_silver_searcher))
* .fzf.bash (shortcuts related to [FZF](https://github.com/junegunn/fzf))

## To use

```shell
cd ~
ln -s dotfiles/.bashrc .bashrc
```

## For Vim

Install plugins:

_On initial Vim launch_

```VimL
:PlugInstall
```

## For FZF

```shell
brew install fzf
```
