#### COLOUR

tm_icon="♟"
tm_color_active=colour213
tm_color_inactive=colour241
tm_color_blue=colour4
tm_color_red=colour203
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

# set 24 bit color
# set -ag terminal-overrides ',*:Tc'

tm_spotify="#[fg=$tm_color_blue]#(osascript ~/.dotfiles/applescripts/spotify.scpt)"
tm_itunes="#[fg=$tm_color_blue]#(osascript ~/.dotfiles/applescripts/itunes.scpt)"
battery_percent="#(~/.dotfiles/bin/battery_indicator.sh)"

tm_date="#[fg=$tm_color_red] %a %h-%d %H:%M"
# tm_host="#[fg=$tm_color_feature,bold]#h"
tm_session_name="#[fg=$tm_color_blue,bold]$tm_icon #S"

set -g status-left $tm_session_name' #{prefix_highlight} '
set -g status-right $tm_itunes' '$tm_spotify' '$tm_date' '$battery_percent' '
