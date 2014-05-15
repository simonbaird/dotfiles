#
# https://gist.github.com/663503
#
# Use this to clean your repo by removing old branches.
# It will remove the branch on local and on origin.
#
# Usage:
#   $ nuke_branch some_old_branch_you_dont_need
#
# Note we use -d not -D for teh safety.
#
nuke_branch() {
  # Loop over all given branches
  for branch in $*; do
    # Check for remote branch
    CHECK_REMOTE_EXISTS=`git branch -r | grep -e "^..origin/$branch\$"`
    if [ -n "$CHECK_REMOTE_EXISTS" ]; then
      echo "** Nuking remote branch origin/$branch"
      # Delete the remote branch
      git branch -d -r origin/$branch
      # Push to remove it from origin (or something..?)
      git push origin :$branch
    else
      echo "** Remote branch origin/$branch not found"
    fi

    # Check for local branch
    CHECK_LOCAL_EXISTS=`git branch | grep -e "^..$branch\$"`
    if [ -n "$CHECK_LOCAL_EXISTS" ]; then
      echo "** Nuking local branch $branch"
      # Delete the local branch
      git branch -d $branch
    else
      echo "** Local branch $branch not found"
    fi
    echo ""
  done
}
