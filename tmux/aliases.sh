#
# For creating and attaching to tmux sessions
#
tmux-start() {
  local SESSION_NAME=$1

  # Bail out if we're already in tmux
  if [[ -n "$TMUX" ]]; then
    return 0
  fi


  # Try to attach
  tmux -2 attach -t $SESSION_NAME || {
    # Can't attach so we'll create a new session

    # Define useful window lists based on the session
    case $SESSION_NAME in
      rails)
        local START_DIR=~/dev/errata-rails
        local WINDOW_NAMES="vim console jobs server logs docker-up dev stage prod" ;;
      ansible)
        local START_DIR=~/dev/ansible-playbooks/errata-tool-playbooks/playbooks
        local WINDOW_NAMES="plays et vagrant et-roles roles1 roles2 roles3 deploy dev" ;;
      *)
        local START_DIR=~/dev/gerrit-nag
        local WINDOW_NAMES="bash nagbot bash bash bash"
    esac

    # Change dir
    cd $START_DIR

    # Create session
    tmux -2 new -s $SESSION_NAME -d

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
