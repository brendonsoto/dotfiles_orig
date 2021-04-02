#! /bin/sh
# A script to move all of my config files when setting up a new machine

dotfileDir="$HOME/dotfiles"
files=(
  ".ctags"
  ".ghci"
  ".gitignore"
  ".tmux.conf"
  ".vim"
  "vimrc"
  ".Xmodmap"
  ".zshrc"
)


# Link dot files
echo "Creating symlinks..."

for file in "${files[@]}";do
  if [ $file = "vimrc" ]; then
    echo "VIMRC"
    ln -sFfv "$dotfileDir/.vim/$file" "$HOME/.$file"
  else
    echo "NOT VIMRC"
    ln -sFfnv "$dotfileDir/$file" "$HOME/$file"
  fi
done

# The ".config" dir might already exist so check before symlinking
# The -d is to say "does $dotfileDir/.config exist AND is a directory"
if [ -d "$dotfileDir/.config" ]; then
	echo "Looping"
	for dir in .config/*; do
		# No need to include .config after home, it's in dir already!
		ln -sfFnv "$dotfileDir/$dir" "$HOME/$dir"
	done
else
	ln -sfFnv "$dotfileDir/.config" "$HOME/.config"
fi

echo "Symlinks have been created!"


# Check for ZSH
if [ $ZSH_VERSION ]; then
  echo "Now installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi


# Reminder to install useful tools
echo "Please now download the following:
> ag
> asciiquarium
> fd
> jq
> most
> neovim
> nvm
> ranger
> st/alacritty
> tmux

Mac + Homebrew:
brew install the_silver_searcher asciiquarium fd jq most neovim nvm ranger alacritty tmux

Manjaro:
sudo pacman the_silver_searcher asciiquarium fd jq most neovim nvm ranger alacritty tmux
"
