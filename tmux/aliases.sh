#
# For creating and attaching to tmux sessions
#
tmux-start() {
  local SESSION_NAME=$1

  # Try to attach
  tmux attach -t $SESSION_NAME || {
    # Can't attach so we'll create a new session

    # Define useful window lists based on the session
    case $SESSION_NAME in
      rails)
        local WINDOW_NAMES="vim console log test server db dev stage prod" ;;
      ansible)
        local WINDOW_NAMES="plays et vagrant roles1 roles2 roles3 roles4 deploy devel" ;;
      *)
        local WINDOW_NAMES="bash bash bash bash"
    esac

    # Create session
    tmux new -s $SESSION_NAME -d

    # Create windows
    for w in $WINDOW_NAMES; do
      tmux new-window -t $SESSION_NAME -n $w
    done

    # Want to start in window 1
    tmux select-window -t :1

    # Now attach to new session
    tmux attach -t $SESSION_NAME
  }
}

alias tm1='tmux-start rails'
alias tm2='tmux-start ansible'
alias tm3='tmux-start etc'

alias tm=tm1
