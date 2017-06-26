tm() {
  tmux new -s rails -d
  tmux new-window -t rails -n vim
  tmux new-window -t rails -n console
  tmux new-window -t rails -n log
  tmux new-window -t rails -n test
  tmux new-window -t rails -n server
  tmux new-window -t rails -n deploy
  tmux new-window -t rails -n db
  tmux new-window -t rails -n dev
  tmux new-window -t rails -n qe
  tmux new-window -t rails -n stage
  tmux new-window -t rails -n 'prod!'
  tmux select-window -t :1
  tmux -2 attach-session -t rails
}

tm2() {
  tmux new -s ansible -d
  tmux new-window -t ansible -n engops
  tmux new-window -t ansible -n errata-tool
  tmux new-window -t ansible -n vagrant
  tmux new-window -t ansible -n roles1
  tmux new-window -t ansible -n roles2
  tmux new-window -t ansible -n deploy
  tmux new-window -t ansible -n devel
  tmux select-window -t :1
  tmux -2 attach-session -t ansible
}

tma() {
  tmux -2 a -t rails
}

tma2() {
  tmux -2 a -t ansible
}
