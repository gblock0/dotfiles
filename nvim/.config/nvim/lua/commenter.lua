local keymap = vim.api.nvim_set_keymap
--vim.g.NERDSpaceDelims = 1
--keymap('n', '<leader>ci', ':<plug>NERDCommenterToggle<CR>', {noremap = true})
keymap("n", "<leader>ci", "<Plug>kommentary_line_default", {})
keymap("v", "<leader>ci", "<Plug>kommentary_visual_default", {})
