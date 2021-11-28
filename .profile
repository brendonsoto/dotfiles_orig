# Set bash to use vi commands
set -o vi

# LF
if command -v lf &>/dev/null
then
  # For what the keys mean, check out https://github.com/gokcehan/lf/blob/aebff483a79edbde020a63816acbceb3278ed3e6/icons.go#L79
  export LF_ICONS="ln=:di=:fi=:ex=:*.html=:*.js=:*.jsx=:*.ts=:*.tsx=:*.json=ﬥ:*.rb=:*.hs=:*.norg=:*.vim=:*.vimrc:*.lua=:*.*rc=:Dockerfile=:"
fi

# NVM
export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
  # Load nvm
  \. "$NVM_DIR/nvm.sh"

  # Setup auto changing node version when .nvmrc is present in dir
  autoload -U add-zsh-hook
  load-nvmrc() {
    local node_version="$(nvm version)"
    local nvmrc_path="$(nvm_find_nvmrc)"

    if [ -n "$nvmrc_path" ]; then
      local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

      if [ "$nvmrc_node_version" = "N/A" ]; then
        nvm install
      elif [ "$nvmrc_node_version" != "$node_version" ]; then
        nvm use
      fi
    elif [ "$node_version" != "$(nvm version default)" ]; then
      echo "Reverting to nvm default version"
      nvm use default
    fi
  }
  add-zsh-hook chpwd load-nvmrc
  load-nvmrc
fi

# Rust
if command -v cargo &>/dev/null
then
  export PATH="$HOME/.cargo/bin:$PATH"
  source "$HOME/.cargo/env"
fi


##########################################
#             Mac specific
##########################################
if [[ $OSTYPE == darwin* ]]; then
  # Brew autocomplete
  if command -v brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

    autoload -Uz compinit
    compinit
  fi

  # GCC
  alias cc="/usr/local/Cellar/gcc/11.2.0_3"
  ln -s /usr/local/Cellar/gcc/11.2.0_3/bin/gcc-11 /usr/local/bin/cc

  # Python
  export PATH=/usr/local/bin:/usr/local/sbin:$PATH

  # Ruby
  export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
fi


##########################################
#             Path Addendums
##########################################

# Set editor to either neovim or vim
if command -v nvim &>/dev/null
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

# my scripts
export PATH="${PATH}:$HOME/dotfiles/scripts"

##########################################
#             Aliases
##########################################

# Keyboard -- colemak or other
alias resetKeyboard="setxkbmap us && xmodmap $HOME/dotfiles/.Xmodmap"
alias setColemak="setxkbmap us && xmodmap $HOME/dotfiles/.Xmodmap-colemak"

# Useful Commands
alias rm="rm -i" # always ask, just in case
alias rg="rg --ignore-file ~/dotfiles/.ignore"
alias cg="curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X GET"
alias pms="ps -ax -u `whoami` -o pid,command,state,lstart,etime,time,%cpu,%mem"

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
alias gfarm="gcm; git fetch && git rebase origin/main"
alias gp="git push"
alias gm="git merge"
alias grh="git reset --hard"
alias grm="git rebase main"
# alias gmap="gcm; git merge $(git branch --sort=-committerdate | head -1 | xargs); gp"
alias gcp="git cherry-pick"
gmo() {
  git merge origin/$1
}

gco() {
  branch=$(git branch | fzf | xargs)
  git checkout $branch
}

# Haskell
alias ghci="stack ghci"

# Python Simple server in current dir
alias simp="python -m SimpleHTTPServer 8000"

##########################################
#             FZF
##########################################
# Set fzf to use ag
if command -v ag &>/dev/null
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

##########################################
#             Helpful
##########################################
# If zsh is available, assume that"s being used
if [ -n "$ZSH_VERSION" ]
then
  # Aliases
  alias reload=". ~/.zshrc"

  # Git completion
  autoload -Uz compinit && compinit

  # Don't share history between tabs
  unsetopt inc_append_history
  unsetopt share_history

  # Program specific
  ## FZF
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Assume Bash
else
  alias reload=". ~/.bashrc"

  [ -f ~/.git-completion.bash ] && . ~/.git-completion.bash
  [ -f /usr/share/bash-completion/completions/pass ] && source /usr/share/bash-completion/completions/pass
  [ -f ~/.fzf.bash ] && source ~/.fzf.bash

  # Bash Colors
  export PS1="\[\033[38;5;45m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;178m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\] \\$ \[$(tput sgr0)\]"
fi


export HISTCONTROL=ignoredups

##########################################
#             For fun :)
##########################################
# Launch an aquarium on startup on non tmux!
if ! { [ -n "$TMUX" ]; } && command -v asciiquarium &>/dev/null; then
  asciiquarium
fi
