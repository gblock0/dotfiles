-- misc remaps
keymap = require('nutils').map

-- Close location list or quickfix window
keymap('n', '<leader>q', ':ccl<Space><Bar><Space>lcl<CR>')

-- Remap p so that paste doesn't overwrite the 0 register
keymap('x', 'p', 'pgvy')

-- Turn off highlighting, need to add the 'h' at the end of offset the <BS> making the cursor move one character to the right
keymap('n', '<BS>', ':noh<CR> :match none<CR>h')

-- shortcut to save
keymap('n', '<leader><leader>', ':wa<cr>')

-- scroll the viewport faster
keymap('n', '<C-e>', '3<C-e>')
keymap('n', '<C-y>', '3<C-y>')
keymap('n', '<leader>=', '<C-W>=')

-- Reload init.vim
keymap('n', '<leader>re', ':so ~/.config/nvim/init.vim<CR>:noh<CR>:echo "init.vim Reload!"<CR>')

-- Add semi colon to the end of current line and return cursor to position
keymap('n', '<leader>;', 'maA;<esc>`a:wa<CR>')

-- Copy current file's path to clipboard
keymap('n', 'cp', ':let @+ = expand("%")<cr>')

-- Disable help F1 key
keymap('', '<F1>', '<ESC>')

-- show/hide whitespace mappings
keymap('n', '<F5>', ':set list!<CR>')

