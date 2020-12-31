# reload zsh config
alias reload!="source ~/.config/fish/config.fish"

alias tc="~/.dotfiles/truecolor.sh"
alias tm="~/.tmux/bin/bash/tm.sh"

# Helpers
alias du="du -h -c" # calculate disk usage for a folder

# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# Open Dotfiles Tmux Session
alias dotfiles="~/./.tmux/dotfiles"

alias tkill="tmux kill-session -t"

alias vim="nvim"

# Kill all tmux sessions
alias tmuxkill="tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill"

# Delete all local branches that have been merged locally
alias gbpurge="git branch --merged | grep -v "\*" | grep -v "master" | xargs -n 1 git branch -d"

# git aliases
alias gd='git diff'
alias gs='git status'
alias gst='git status'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
