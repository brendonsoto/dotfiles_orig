#!/bin/sh

lines=$(tput lines)
cols=$(tput cols)

# Check for WORK directory env var
# if not present, ask user to set one
if [[ -z "${WORK}" ]]; then
  echo """
    Please set the WORK environmental variable to the directory of <COMPANY> repos.
    Ex: echo 'export WORK="\$HOME/work"' >> ~/.zshrc && source ~/.zshrc
  """
  return
fi

# An array of windows to make to run the app
windowsToMake=(
# "my-repo"
)

# Start a new session without actually "launching" tmux and
# set the name of the session to 'coding' and name the window 'notes'
tmux new-session -d -x $cols -y $lines -s 'werk' -n 'notes'

# Make windows that have two rows (except for psql window)
# For each also navigate to the directory
for window in $windowsToMake; do
  tmux new-window -n $window -c "$WORK/$window"
  if [ "$window" != "psql" ]; then
    tmux split-window -v -l 15 -c "$WORK/$window"

    if [ "$window" = "business_portal" ]; then
      tmux split-window -h -c "$WORK/$window"
    fi
  fi
done

# Launch the 'coding' session in the client and detach any other clients connected to the session
tmux attach-session -d -t 'werk'
