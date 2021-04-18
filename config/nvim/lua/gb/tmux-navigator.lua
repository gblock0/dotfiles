vim.g.tmux_navigator_no_mappings = 1

local keymap = require("gb.utils").map
keymap("n", "<c-h>", ":TmuxNavigateLeft<cr>", {silent = true})
keymap("n", "<c-j>", ":TmuxNavigateDown<cr>", {silent = true})
keymap("n", "<c-k>", ":TmuxNavigateUp<cr>", {silent = true})
keymap("n", "<c-l>", ":TmuxNavigateRight<cr>", {silent = true})
