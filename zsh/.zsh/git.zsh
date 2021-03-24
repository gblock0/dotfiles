# git aliases
alias g='git'
alias gs='git status'
alias gst='git status'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gd='git diff -w --ignore-blank-lines'

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

function getdefault () {
  git remote show origin | grep "HEAD branch" | sed 's/.*: //'
}

function master () {
    git stash
    git checkout $(getdefault)
    pull
}

function pullmaster () {
    git pull origin $(getdefault)
}

function gpublish () {
  B=$(getBranch)
  git pull origin $B
  git push -u origin $B
}

function getBranch () {
  echo $(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
}

function remoteBranches () {
  git branch -a | grep 'remotes' | grep -v -E '.*(HEAD|${DEFAULT})' | cut -d'/' -f 3-
}

function localBranches () {
  git branch -a | grep -v 'remotes' | grep -v -E '.*(HEAD|${DEFAULT})' | grep -v '^*'
}

# Prunes local branches
function gbpurge () {
  git fetch
  git remote prune origin
  for local in $(localBranches); do
    in=false
    for remote in $(remoteBranches); do
      if [[ ${local} = ${remote} ]]; then
        in=true
      fi
    done;
    if [[ $in = 'false' ]]; then
      git branch -D ${local}
    else
      echo 'Skipping branch '${local}
    fi
  done;
}

function gch() {
  branch=$(git branch | fzf --height 20%)

  if [[ ${branch} -ne '' ]] then
    git checkout ${branch}
  fi
}
