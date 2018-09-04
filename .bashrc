##########################################
#             Path Addendums
##########################################

# TODO: Conditional to check for nvim and use that
export EDITOR=nvim
set -o vi

# To ensure terminal is using 256 colors
export PATH="/usr/local/bin:$PATH"

export FZF_DEFAULT_COMMAND='ag -g ""'

# NHL
export NHL_ROOT="$HOME/development/workarea"
export PATH="${PATH}:$NHL_ROOT/de/bin:/usr/local/mysql/bin"
export NODE_EXTRA_CA_CERTS="$HOME/certs/nhl_rootca_bundle.pem"
export PATH="${PATH}:$NHL_ROOT/_scripts"


##########################################
#             Aliases
##########################################

# Shortcuts
alias nhl="cd $NHL_ROOT"
alias grb="cd $NHL_ROOT/grb/grb-site/src/main/java/com/nhl/grb/site/"
alias grbui="cd $NHL_ROOT/grb-ui/grb-site-ui/src/main/client"
alias sl="cd $NHL_ROOT/scoring-lite/scoring-lite-site/src/main"
alias slui="cd $NHL_ROOT/scoring-lite-ui/scoring-lite-ui/src/main/client"
alias stats="cd $NHL_ROOT/ITS/Java/ice3-stats/src/main"
alias statsui="cd $NHL_ROOT/ITS/WebServer/www/projects/ice3-stats"

# Reload
alias reload=". ~/.bashrc"

# Useful Commands
alias ls='ls -aFG' # list hidden files; add colors and file type
alias rm='rm -i' # always ask, just in case

# Git shortcuts
alias gbr='git branch --sort=-committerdate | head -5'
alias gcm='git checkout master'
alias gf="git fetch"
alias gfam='gcm; git fetch && git merge origin/master'
alias gp='git push'
alias gm="git merge"
alias gmap='gcm; git merge $(git branch --sort=-committerdate | head -1 | xargs); gp'
alias gcp='git cherry-pick'
mergeOrigin() {
  git merge origin/$1
}

# Haskell
alias ghci='stack ghci'

# Vim => NVim (because I keep typing vim)
alias vim='nvim'

##########################################
#             Helpful
##########################################
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/.git-completion.bash ] && . ~/.git-completion.bash

export HISTCONTROL=ignoredups

findXRecentlyModified() {
  find . -type f -print0 | xargs -0 stat -f "%m %N" | sort -rn | head -$1 | cut -f2- -d" "
}

# source /usr/local/etc/bash_completion.d/pass


##########################################
#             Function
##########################################
fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}


##########################################
#             For fun :)
##########################################
# Launch an aquarium on startup!
asciiquarium

# For better color support
export CLICOLOR=1
# export LSCOLORS=GxFxCxDxBxegedabagaced

# Bash Colors
export PS1="\[\033[38;5;45m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;178m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\] \\$ \[$(tput sgr0)\]"
