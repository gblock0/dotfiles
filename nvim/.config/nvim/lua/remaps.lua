-- misc remaps
local keymap = vim.api.nvim_set_keymap

-- Close location list or quickfix window
keymap('n', '<leader>q', ':ccl<Space><Bar><Space>lcl<CR>', {noremap = true})

-- Remap p so that paste doesn't overwrite the 0 register
keymap('x', 'p', 'pgvy', { noremap = true})

-- Turn off highlighting, need to add the 'h' at the end of offset the <BS> making the cursor move one character to the right
keymap('n', '<BS>', ':noh<CR> :match none<CR>h', { noremap = true})

-- shortcut to save
keymap('n', '<leader><leader>', ':wa<cr>', { noremap = true})

-- scroll the viewport faster
keymap('n', '<C-e>', '3<C-e>', { noremap = true})
keymap('n', '<C-y>', '3<C-y>', { noremap = true})
keymap('n', '<leader>=', '<C-W>=', { noremap = true})

-- Reload init.vim
keymap('n', '<leader>re', ':so ~/.config/nvim/init.vim<CR>:noh<CR>:echo "init.vim Reload!"<CR>', { noremap = true})

-- Add semi colon to the end of current line and return cursor to position
keymap('n', '<leader>;', 'maA;<esc>`a:wa<CR>', { noremap = true})

-- Copy current file's path to clipboard
keymap('n', 'cp', ':let @+ = expand("%")<cr>', { noremap = true})

-- Disable help F1 key
keymap('i', '<F1>', '<ESC>', { noremap = true})
keymap('n', '<F1>', '<ESC>', { noremap = true})
keymap('v', '<F1>', '<ESC>', { noremap = true})
keymap('x', '<F1>', '<ESC>', { noremap = true})



