##########################################
#             Path Addendums
##########################################

# TODO: Conditional to check for nvim and use that
export EDITOR=nvim
set -o vi

# To ensure terminal is using 256 colors
export PATH="/usr/local/bin:$PATH"

export FZF_DEFAULT_COMMAND='ag -g ""'


##########################################
#             Aliases
##########################################

# Web 
alias web="cd ~/Sites"
alias apache="cd /usr/local/apache2"
alias mySite="web; cd mySite"

# Programming Aliases
alias prog="cd ~/Documents/Programming"
alias js="prog; cd JavaScript"

# Reload
alias reload=". ~/.bashrc"

# Useful Commands
alias ls='ls -aFG --color' # list hidden files; add colors and file type

# Git shortcuts
alias gbr='git branch --sort=-committerdate | head -5'
alias gcm='git checkout master'
alias gfam='gcm; git fetch && git merge origin/master'
alias gp='git push'
alias gmap='gcm; git merge $(git branch --sort=-committerdate | head -1 | xargs); gp'
alias gcp='git cherry-pick'

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
