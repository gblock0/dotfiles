vim.g.tmux_navigator_no_mappings = 1

local keymap = vim.api.nvim_set_keymap

keymap('n', '<c-h>', ':TmuxNavigateLeft<cr>', { noremap = true, silent = true })
keymap('n', '<c-j>', ':TmuxNavigateDown<cr>', { noremap = true, silent = true })
keymap('n', '<c-k>', ':TmuxNavigateUp<cr>', { noremap = true, silent = true })
keymap('n', '<c-l>', ':TmuxNavigateRight<cr>', { noremap = true, silent = true })
