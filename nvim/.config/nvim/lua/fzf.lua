local keymap = vim.api.nvim_set_keymap
keymap('n', '<leader>a',  ':Rg<Cr>', { noremap = true })
keymap('n', '<leader>p', ':GFiles<Cr>', { noremap = true })