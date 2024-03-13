# don't start a background job when '&' is at the end of the line
setopt NO_BG_NICE

# continue running background jobs, even when the shell has exited
setopt NO_HUP

# NO BEEPING
setopt NO_LIST_BEEP

# allow functions to have local options
setopt LOCAL_OPTIONS

# allow functions to have local traps
setopt LOCAL_TRAPS

# parameter expansion, command substitution and arithmetic expansion are performed in prompts. Substitutions within prompts do not affect the command status.
setopt PROMPT_SUBST

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# history
setopt HIST_VERIFY

# in addition to the command run, save the time when the command was started and how long it ran for
setopt EXTENDED_HISTORY

# tidy up the line when it is entered into the history by removing any excess blanks that mean nothing to the shell
setopt HIST_REDUCE_BLANKS

# tells the shell not to store a history line if it's the same as the previous one
setopt HIST_IGNORE_ALL_DUPS

# append history instead of replace the whole file
setopt APPEND_HISTORY

# add each line to history as it is executed instead of on shell exit
setopt INC_APPEND_HISTORY

# as each line is added, the history file is checked to see if anything was written out by another shell, and if so it is included in the history of the current shell too
setopt SHARE_HISTORY

# prevents aliases on the command line from being internally substituted before completion is attempted
setopt COMPLETE_ALIASES

# make terminal command navigation sane again
bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[^N' newtab
bindkey '^?' backward-delete-char
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
