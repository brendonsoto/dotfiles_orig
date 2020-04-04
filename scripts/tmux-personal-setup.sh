#!/bin/sh
# Start a new session without actually "launching" tmux and
# set the name of the session to 'coding' and name the window 'notes'
tmux new-session -d -s 'personal' -n 'notes'

# Make new windows
tmux new-window -n 'build'
tmux new-window -n 'code'

# Launch the 'coding' session in the client and detach any other clients connected to the session
tmux attach-session -d -t 'coding'
