#! /bin/bash
# A script to move all of my config files when setting up a new machine

# Shortcut to the dir where this file is executed
dotfileDir=$(pwd)

# The ".config" dir might already exist so check before symlinking
if [ -d "$dotfileDir/.config" ]; then
	echo "Looping"
	for dir in .config/*; do
		ln -s "$dotfileDir/$dir" "$HOME/$dir"
	done
else
	ln -s "$dotfileDir/.config" "$HOME/.config"
fi

# Symlink other config files
ln -s "$dotfileDir/.ctags" "$HOME/.ctags"
ln -s "$dotfileDir/.ghci" "$HOME/.ghci"
ln -s "$dotfileDir/.gitconfig" "$HOME/.gitconfig"
ln -s "$dotfileDir/.ignore" "$HOME/.ignore"
ln -s "$dotfileDir/.tmux.conf" "$HOME/.tmux.conf"
ln -s "$dotfileDir/.vim" "$HOME/.vim"
ln -s "$dotfileDir/.vim/vimrc" "$HOME/.vimrc"
ln -s "$dotfileDir/.Xmodmap" "$HOME/.Xmodmap"
ln -s "$dotfileDir/.zshrc" "$HOME/.zshrc"

# Happy little messages
echo "Symlinks have been created!"
echo "Now installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Please now download the following:
> zsh
> neovim
> st
> node
> npm"
