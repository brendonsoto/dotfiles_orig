#! /bin/sh
# A script to move all of my config files when setting up a new machine

# Shortcut to the dir where this file is executed
dotfileDir="$HOME/dotfiles"
dotfiles=(
  ".ctags"
  ".ghci"
  ".gitignore"
  ".tmux.conf"
  ".vim"
  ".vim/vimrc"
  ".Xmodmap"
  ".zshrc"
)

# Link dot files
for dotfile in "${dotfiles[@]}";do
 ln -sf "$dotfileDir/$dotfile" "$HOME/$dotfile"
done

# The ".config" dir might already exist so check before symlinking
# The -d is to say "does $dotfile/.config exist AND is a directory"
if [ -d "$dotfileDir/.config" ]; then
	echo "Looping"
	for dir in .config/*; do
		ln -sf "$dotfileDir/.config/$dir" "$HOME/.config/$dir"
	done
else
	ln -sf "$dotfileDir/.config" "$HOME/.config"
fi

# Happy little messages
echo "Symlinks have been created!"
echo "Now installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Please now download the following:
> neovim
> st/alacritty
> nvm"
