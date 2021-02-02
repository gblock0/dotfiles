local keymap = vim.api.nvim_set_keymap
keymap('n', '<D-/>', ':NERDComToggleComment<CR>', { noremap = true })
vim.g.NERDSpaceDelims = 1
