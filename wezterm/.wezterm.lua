-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font = wezterm.font('BlexMono Nerd Font Mono')
config.font_size = 18.0

-- For example, changing the color scheme:
config.color_scheme = 'Dracula+'

config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 2000 }

config.scrollback_lines = 100000

local move_around = function(window, pane, direction_wez, direction_nvim)
  if pane:get_title():sub(1, 4) == "nvim" then
    window:perform_action(wezterm.action { SendString = "\x17" .. direction_nvim }, pane)
  else
    window:perform_action(wezterm.action { ActivatePaneDirection = direction_wez }, pane)
  end
end

wezterm.on("move-left", function(window, pane)
  move_around(window, pane, "Left", "h")
end)

wezterm.on("move-right", function(window, pane)
  move_around(window, pane, "Right", "l")
end)

wezterm.on("move-up", function(window, pane)
  move_around(window, pane, "Up", "k")
end)

wezterm.on("move-down", function(window, pane)
  move_around(window, pane, "Down", "j")
end)

config.keys = {
  {
    key = '|',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '-',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'x',
    mods = 'LEADER',
    action = wezterm.action.CloseCurrentPane { confirm = false },
  },
  {
    key = 'z',
    mods = 'LEADER',
    action = wezterm.action.TogglePaneZoomState
  },
  -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
  {
    key = 'a',
    mods = 'LEADER|CTRL',
    action = wezterm.action.SendKey { key = 'a', mods = 'CTRL' },
  },
  { key = "h", mods = "CTRL", action = wezterm.action { EmitEvent = "move-left" } },
  { key = "l", mods = "CTRL", action = wezterm.action { EmitEvent = "move-right" } },
  { key = "k", mods = "CTRL", action = wezterm.action { EmitEvent = "move-up" } },
  { key = "j", mods = "CTRL", action = wezterm.action { EmitEvent = "move-down" } },
}

-- LEADER + CTRL + number to activate that tab
for i = 1, 8 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(i - 1),
  })
end

-- and finally, return the configuration to wezterm
return config
