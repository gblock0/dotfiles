# reload zsh config
alias reload!="source ~/.zshrc"

alias radish='~/./.tmux/radish.key'
alias servers="~/./.tmux/servers.key"
alias dbs="~/./.tmux/dbs.key"
alias tc='~/./truecolor.sh'

# Filesystem aliases
alias l="ls -lah ${colorflag}"
alias ls="ls -F ${colorflag}"
alias la="ls -AF ${colorflag}"
alias ll="ls -lFh ${colorflag}"
alias lld="ls -l | grep ^d"
alias rmf="rm -rf"

# Helpers
alias du="du -h -c" # calculate disk usage for a folder

# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# Open Dotfiles Tmux Session
alias dotfiles="~/./.tmux/dotfiles"

alias tkill="tmux kill-session -t"

alias vim='nvim'

# Kill all tmux sessions
alias tmuxkill="tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill"

# Delete all local branches that have been merged locally
alias gbpurge='git branch --merged | grep -v "\*" | grep -v "master" | xargs -n 1 git branch -d'
