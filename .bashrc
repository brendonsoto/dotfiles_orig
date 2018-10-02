# Set bash to use vi commands
set -o vi

##########################################
#             Path Addendums
##########################################

export PATH="${PATH}:/usr/local/bin"

# Set editor to either neovim or vim
if command -v nvim >/dev/null 2>&1
then
  export EDITOR=nvim
else
  echo "neovim not installed!"
  export EDITOR=vim
fi

# Set fzf to use rg
if command -v rg >/dev/null 2>&1
then
  export FZF_DEFAULT_COMMAND='rg --files --follow --ignore-file ~/dotfiles/.ignore'
else
  echo "ripgrep not installed!"
fi

# local bin
if [ -d "$HOME/.local" ]
then
  export PATH="${PATH}:$HOME/.local/bin"
fi

# Rust
export PATH="${PATH}:$HOME/.cargo/bin"

# Yarn
export PATH="${PATH}:/home/brendon/.yarn/bin"

# Rust
export PATH="${PATH}:$HOME/.cargo/bin"

# Yarn
export PATH="${PATH}:/home/brendon/.yarn/bin"

# NHL
export NHL_ROOT="$HOME/development/workarea"
export GRB_HOME="$NHL_ROOT/grb"
export GRB_HOME_UI="$NHL_ROOT/grb-ui"
export PATH="${PATH}:$NHL_ROOT/de/bin:/usr/local/mysql/bin"
export NODE_EXTRA_CA_CERTS="$HOME/certs/nhl_rootca_bundle.pem"
export PATH="${PATH}:$NHL_ROOT/_scripts"


##########################################
#             Aliases
##########################################

# Reload
alias reload=". ~/.bashrc"

# Useful Commands
alias rm='rm -i' # always ask, just in case

# ls with colors!
if [ $OSTYPE = "linux-gnu" ]
then
  alias ls='ls -aF --color' # list hidden files; add colors and file type
  alias wifiSearch='sudo iw dev wlp2s0 scan | less -pSSID'
else
  alias ls='ls -aFG' # list hidden files; add colors and file type
fi

# Git shortcuts
alias gbr='git branch --sort=-committerdate | head -5'
alias gcm='git checkout master'
alias gf="git fetch"
alias gfam='gcm; git fetch && git merge origin/master'
alias gp='git push'
alias gm="git merge"
alias gmap='gcm; git merge $(git branch --sort=-committerdate | head -1 | xargs); gp'
alias gcp='git cherry-pick'
gmo() {
  git merge origin/$1
}

# Haskell
alias ghci='stack ghci'


##########################################
#             Helpful
##########################################
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/.git-completion.bash ] && . ~/.git-completion.bash
[ -f /usr/share/bash-completion/completions/pass ] && source /usr/share/bash-completion/completions/pass

export HISTCONTROL=ignoredups

findXRecentlyModified() {
  find . -type f -print0 | xargs -0 stat -f "%m %N" | sort -rn | head -$1 | cut -f2- -d" "
}


##########################################
#             For fun :)
##########################################
# Launch an aquarium on startup!
asciiquarium

# Bash Colors
export PS1="\[\033[38;5;45m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;178m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\] \\$ \[$(tput sgr0)\]"
