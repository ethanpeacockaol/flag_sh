SESSION_NAME="us"

if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
  echo "Session '$SESSION_NAME' already exists."
  exit 1
fi

tmux new-session -d -s "$SESSION_NAME"
tmux rename-window -t "$SESSION_NAME":0 "_"

tmux split-window -v -t "$SESSION_NAME":0
tmux split-window -v -t "$SESSION_NAME":0
tmux split-window -v -t "$SESSION_NAME":0
tmux send-keys -t $SESSION_NAME:_.3 'cmatrix -C red' C-m
tmux select-pane -t "$SESSION_NAME":2
tmux send-keys -t $SESSION_NAME:_.2 'cmatrix -C white' C-m
tmux select-pane -t "$SESSION_NAME":1
tmux send-keys -t $SESSION_NAME:_.1 'cmatrix -C white' C-m
tmux split-window -t 1 -v
tmux select-pane -t "$SESSION_NAME":2
tmux send-keys -t $SESSION_NAME:_.2 'cmatrix -C red' C-m
tmux split-window -t 0 -h
tmux select-pane -t "$SESSION_NAME":0
tmux send-keys -t $SESSION_NAME:_.0 'cmatrix -C blue' C-m
tmux send-keys -t $SESSION_NAME:_.1 'cmatrix -C white' C-m
tmux split-window -t 1 -v
tmux send-keys -t $SESSION_NAME:_.2 'cmatrix -C white' C-m
tmux split-window -t 2 -v
tmux send-keys -t $SESSION_NAME:_.3 'cmatrix -C red' C-m
tmux split-window -t 1 -v
tmux send-keys -t $SESSION_NAME:_.2 'cmatrix -C red' C-m

tmux attach-session -t "$SESSION_NAME"

