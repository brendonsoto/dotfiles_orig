# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/Brendon/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/Brendon/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/Brendon/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/Brendon/.fzf/shell/key-bindings.bash"

fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}
