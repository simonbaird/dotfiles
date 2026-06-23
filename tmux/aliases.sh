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
      local START_DIR=~/c/et/errata-rails
      local WINDOW_NAMES="vim console jobs server logs docker-up dev stage prod"
      ;;
    ansible)
      local START_DIR=~/c/a/ansible-playbooks/errata-tool-playbooks/playbooks
      local WINDOW_NAMES="plays et vagrant et-roles roles1 roles2 roles3 deploy dev"
      ;;
    th)
      local START_DIR=~/c/th/tiddlyhost-com
      local WINDOW_NAMES="vim join start deploys prod bash bash"
      ;;
    ec)
      local START_DIR=~/c/ec/cli
      local WINDOW_NAMES="cli rego infra docs bash bash bash bash"
      ;;
    antora)
      local START_DIR=~/c/ec/enterprise-contract.github.io
      local WINDOW_NAMES="vim hugo antora bash bash bash bash bash"
      ;;
    art)
      local START_DIR=~/c/ri/apophenian/
      local WINDOW_NAMES="vim hugo bash bash bash bash bash bash"
      ;;
    *)
      local START_DIR=~/c
      local WINDOW_NAMES="bash bash bash bash bash"
      ;;
    esac

    # Change dir
    cd $START_DIR

    # Create session
    tmux -2 new -s $SESSION_NAME -d

    # Create windows
    for w in $WINDOW_NAMES; do
      echo $w $SESSION_NAME
      tmux new-window -t $SESSION_NAME -n $w
    done

    # Want to start in window 1
    tmux select-window -t :1

    # Now attach to new session
    tmux attach -t $SESSION_NAME
  }
}

alias tm1='tmux-start ec'
alias tm2='tmux-start th'
alias tm3='tmux-start art'
alias tm4='tmux-start rails'
alias tm5='tmux-start ansible'
alias tm6='tmux-start antora'
alias tm7='tmux-start etc'

alias tm=tm1
