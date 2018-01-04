##########################################
#             Path Addendums
##########################################

export EDITOR=vim

# To ensure terminal is using 256 colors
export PATH="/usr/local/bin:$PATH"

# FireFox
export PATH="$HOME/Documents/Programming/open_source/firefox:$PATH"

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# PHP
export PATH="$(brew --prefix homebrew/php/php71)/bin:$PATH"
PATH="/usr/local/sbin:$PATH"

# Ruby - For rbenv
eval "$(rbenv init -)"

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

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
alias ls='ls -aFG' # list hidden files; add colors and file type


##########################################
#             Helpful
##########################################
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export HISTCONTROL=ignoredups


##########################################
#             For fun :)
##########################################
# Launch an aquarium on startup!
asciiquarium

# For better color support
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Bash Colors
export PS1="\[\033[38;5;45m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;178m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\] \\$ \[$(tput sgr0)\]"
