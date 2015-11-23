# reload zsh config
alias reload!="source ~/.zshrc"

alias radish='~/./.tmux/radish'

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # OS X `ls`
    colorflag="-G"
fi

# Filesystem aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias l="ls -lah ${colorflag}"
alias ls="ls -F ${colorflag}"
alias la="ls -AF ${colorflag}"
alias ll="ls -lFh ${colorflag}"
alias lld="ls -l | grep ^d"
alias rmf="rm -rf"

# Helpers
alias grep="grep --color=auto"
alias df="df -h" # disk free, in Gigabytes, not bytes
alias du="du -h -c" # calculate disk usage for a folder

# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
    alias "$method"="lwp-request -m '$method'"
done

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 10'"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"


alias cl="clear"
alias md5="md5 -r"
alias md5sum="md5 -r"
alias rdl="tail -f log/development.log"
alias subl="sublime"

# Open Dotfiles Tmux Session
alias dotfiles="~/./.tmux/dotfiles"

# Open Mvim in terminal
alias vim='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'


# Get list of the sizes of tmux panes
alias tmuxsize="tmux list-panes -F '#{pane_id} #{pane_width}x#{pane_height}'"

# Kill all tmux sessions
alias tmuxkill="tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill"

# Heroku logs shortcut
alias hlogs="heroku logs --tail --app"
