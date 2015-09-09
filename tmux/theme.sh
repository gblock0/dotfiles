#### COLOUR

tm_icon="♟"
tm_color_active=colour213
tm_color_inactive=colour241
tm_color_feature=colour4
tm_color_music=colour203
tm_color_battery=colour9

# separators
tm_separator_left_bold="◀"
tm_separator_left_thin="❮"
tm_separator_right_bold="▶"
tm_separator_right_thin="❯"

set -g status-left-length 32
set -g status-right-length 150
set -g status-interval 5


# default statusbar colors
# set-option -g status-bg colour0
set-option -g status-fg $tm_color_active
set-option -g status-bg default
set-option -g status-attr default

# default window title colors
set-window-option -g window-status-fg $tm_color_inactive
set-window-option -g window-status-bg default
set -g window-status-format "#I #W"

# active window title colors
set-window-option -g window-status-current-fg $tm_color_active
set-window-option -g window-status-current-bg default
set-window-option -g  window-status-current-format "#[bold]#I #W"

# pane border
set-option -g pane-border-fg $tm_color_inactive
set-option -g pane-active-border-fg $tm_color_active

# message text
set-option -g message-bg default
set-option -g message-fg $tm_color_active

# pane number display
set-option -g display-panes-active-colour $tm_color_active
set-option -g display-panes-colour $tm_color_inactive

# clock
set-window-option -g clock-mode-colour $tm_color_active

tm_spotify="#[fg=$tm_color_music]#(osascript ~/.dotfiles/applescripts/spotify.scpt)"
tm_itunes="#[fg=$tm_color_music]#(osascript ~/.dotfiles/applescripts/itunes.scpt)"
tm_battery_percent="#[fg=$tm_color_battery]#(~/.dotfiles/tmux/tmux.symlink/plugins/tmux-battery/scripts/battery_percentage.sh)"
tm_battery_remain="#[fg=$tm_color_battery]#(~/.dotfiles/tmux/tmux.symlink/plugins/tmux-battery/scripts/battery_remain.sh)"
tm_battery_icon="#[fg=$tm_color_battery]#(~/.dotfiles/tmux/tmux.symlink/plugins/tmux-battery/scripts/battery_icon.sh)"

tm_date="#[fg=$tm_color_feature] %a %h-%d %H:%M"
tm_host="#[fg=$tm_color_feature,bold]#h"
tm_session_name="#[fg=$tm_color_feature,bold]$tm_icon #S"

set -g status-left $tm_session_name' '
set -g status-right $tm_itunes' '$tm_spotify' '$tm_date' '$tm_battery_percent' '
