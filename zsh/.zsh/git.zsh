# git aliases
alias gs='git status'
alias gst='git status'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

function gi() {
  if [[ $# > 0 ]]; then
    # if there are arguments, send them to git
    git $@
  else
    # otherwise, run git status
    git status
  fi
}

# Show preview of changed files using fzf --preview
function fd() {
    preview="git diff $@ --color=always -- {-1}"
    git diff $@ --name-only | fzf -m --ansi --preview $preview
}
