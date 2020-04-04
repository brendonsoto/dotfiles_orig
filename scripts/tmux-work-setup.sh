#!/bin/sh
# Start a new session without actually "launching" tmux and
# set the name of the session to 'coding' and name the window 'notes'
tmux new-session -d -s 'coding' -n 'zettle'

# Make new windows
tmux new-window -n 'tests'
tmux new-window -n 'code'
tmux new-window -n 'build'

# Split the last window (build) in half (left & right even though h = horizontal)
tmux split-window -h

# Launch the 'coding' session in the client and detach any other clients connected to the session
tmux attach-session -d -t 'coding'
