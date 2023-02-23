# reload zsh config
alias reload!="source ~/.zshrc"

alias tc="~/.dotfiles/truecolor.sh"
alias tm="~/.tmux/bin/bash/tm.sh"

# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first'
alias l='ls'
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

# Helpers
alias du="du -h -c" # calculate disk usage for a folder

# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# Open Dotfiles Tmux Session
alias dotfiles="~/./.tmux/dotfiles"

alias tkill="tmux kill-session -t"

alias vim="nvim"
alias n="nvim"

# Kill all tmux sessions
alias tmuxkill="tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill"

# SP  ' '  ␣
# TAB '\t' ￫
# CR  '\r' §
# LF  '\n' ¬
alias whitespace="sed 's/ /␣/g;s/\t/￫/g;s/\r/§/g;s/$/¬/g'"

alias ns="npm start"

alias nrat="npm run test:api:loc"

alias python="python3"

alias jcov="node_modules/.bin/jest --coverage"
