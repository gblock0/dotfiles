-- Testing helpers
local keymap = vim.api.nvim_set_keymap
keymap('n', '<leader>tt', ':TestNearest<CR>', { noremap = true})
keymap('n', '<leader>tf', ':TestFile<CR>', { noremap = true})
keymap('n', '<leader>ts', ':TestSuite<CR>', { noremap = true})
