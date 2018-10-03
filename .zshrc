# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh
source ~/dotfiles/.profile

# My theme settings. Putting them here instead of a .zsh-theme file since it's small and convenient
PROMPT='%{$fg_bold[blue]%}%{$fg[blue]%}%c%{$fg_bold[blue]%}$(git_prompt_info)$(git_prompt_ahead)%{$fg_bold[blue]%} λ %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" (%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[red]%}Δ%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[blue]%} %{$fg[yellow]%}↻%{$reset_color%}"
