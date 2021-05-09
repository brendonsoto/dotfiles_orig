# Set bash to use vi commands
set -o vi

# Brew autocomplete
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

# NVM - Mac
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Ruby
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

##########################################
#             Path Addendums
##########################################

# Set editor to either neovim or vim
if command -v nvim >/dev/null 2>&1
then
  export EDITOR=nvim
  alias v="nvim"
  alias vpu="nvim +PlugUpgrade +PlugUpdate +qa"
else
  echo "neovim not installed!"
  export EDITOR=vim
  alias v="vim"
  alias vpu="vim +PlugUpgrade +PlugUpdate +qa"
fi

# local bin
if [ -d "$HOME/.local" ]
then
  export PATH="${PATH}:$HOME/.local/bin"
fi

# Python
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# my scripts
export PATH="${PATH}:$HOME/dotfiles/scripts"

##########################################
#             Aliases
##########################################

# Keyboard -- colemak or other
alias resetKeyboard="setxkbmap us && xmodmap $HOME/dotfiles/.Xmodmap"
alias setColemak="setxkbmap us && xmodmap $HOME/dotfiles/.Xmodmap-colemak"

# Reload
if [ -n "$ZSH_VERSION" ]
then
  alias reload=". ~/.zshrc"
else
  alias reload=". ~/.bashrc"
fi

# Useful Commands
alias rm="rm -i" # always ask, just in case
alias rg="rg --ignore-file ~/dotfiles/.ignore"
alias cg="curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X GET"

# ls with colors!
if [ $OSTYPE = "linux-gnu" ]
then
  alias ls="ls -aF --color" # list hidden files; add colors and file type
  alias wifiSearch="sudo iw dev wlp2s0 scan | less -pSSID"
else
  alias ls="ls -aFG" # list hidden files; add colors and file type
fi

# Git shortcuts
alias gbr="git branch --sort=-committerdate | head -5"
alias gcm="git checkout master"
alias gf="git fetch"
alias gfarm="gcm; git fetch && git rebase origin/master"
alias gp="git push"
alias gm="git merge"
alias grh="git reset --hard"
alias grm="git rebase main"
# alias gmap="gcm; git merge $(git branch --sort=-committerdate | head -1 | xargs); gp"
alias gcp="git cherry-pick"
gmo() {
  git merge origin/$1
}

# Haskell
alias ghci="stack ghci"

##########################################
#             FZF
##########################################
# Set fzf to use ag
if command -v ag >/dev/null 2>&1
then
  export FZF_DEFAULT_COMMAND="ag -p ~/dotfiles/.ignore -g ''"
  export FZF_CTRL_T_COMMAND="ag -p ~/dotfiles/.ignore -g ''"
else
  echo "ag not installed!"
fi

_fzf_compgen_path() {
  ag -p ~/dotfiles/.ignore -g ''
}

_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude '.git' . $1
}

if [ -n "$ZSH_VERSION" ]
then
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
else
  [ -f ~/.fzf.bash ] && source ~/.fzf.bash
fi

##########################################
#             Helpful
##########################################
# If zsh is available, assume that"s being used
if [ -n "$ZSH_VERSION" ]
then
  # Git completion
  autoload -Uz compinit && compinit

  # Don't share history between tabs
  unsetopt inc_append_history
  unsetopt share_history

# Assume Bash
else
  [ -f ~/.git-completion.bash ] && . ~/.git-completion.bash
  [ -f /usr/share/bash-completion/completions/pass ] && source /usr/share/bash-completion/completions/pass

  # Bash Colors
  export PS1="\[\033[38;5;45m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;178m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\] \\$ \[$(tput sgr0)\]"
fi


export HISTCONTROL=ignoredups

##########################################
#             For fun :)
##########################################
# Launch an aquarium on startup on non tmux!
if ! { [ -n "$TMUX" ]; } then
  asciiquarium
fi
