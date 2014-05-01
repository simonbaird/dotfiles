tm() {
  tmux new -s main -d
  tmux new-window -t main -n vim
  tmux new-window -t main -n console
  tmux new-window -t main -n server
  tmux new-window -t main -n test
  tmux new-window -t main -n deploy
  tmux new-window -t main -n log
  tmux new-window -t main -n db
  tmux new-window -t main -n devel
  tmux new-window -t main -n 'prod!'
  tmux select-window -t :1
  tmux -2 attach-session -t main
}

tma() {
  tmux -2 a
}
