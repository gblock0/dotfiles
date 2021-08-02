-- misc remaps
keymap = require("gb.utils").map

-- Close location list or quickfix window
keymap("n", "<leader>q", "ccl<Space><Bar><Space>lcl", {cmd_cr = true})

-- Remap p so that paste doesn't overwrite the 0 register
keymap("x", "p", "pgvy")

-- Turn off highlighting, need to add the 'h' at the end of offset the <BS> making the cursor move one character to the right
keymap("n", "<BS>", ":noh<CR> :match none<CR>h")

-- shortcut to save
keymap("n", "<leader><leader>", "wa", {cmd_cr = true})

-- scroll the viewport faster
keymap("n", "<C-e>", "3<C-e>")
keymap("n", "<C-y>", "3<C-y>")
keymap("n", "<leader>=", "<C-W>=")

-- Reload init.vim
keymap("n", "<leader>re", 'so ~/.config/nvim/init.vim<CR>:noh<CR>:echo "init.vim Reload!"', {cmd_cr = true})

-- Add semi colon to the end of current line and return cursor to position
keymap("n", "<leader>;", "maA;<esc>`a:wa<CR>")

-- Copy current file's path to clipboard
keymap("n", "cp", 'let @+ = expand("%")', {cmd_cr = true})

-- Disable help F1 key
keymap("", "<F1>", "<ESC>")

-- show/hide whitespace mappings
keymap("n", "<F5>", "set list!", {cmd_cr = true})

keymap("n", "<leader>rn", "set relativenumber!", {silent = true, cmd_cr = true})

-- Reselect pasted text
keymap("n", "gp", "`[v`]", {silent = true})

-- Keep cursor in the middle of the screen
keymap("n", "n", "nzzzv", {silent = true})
keymap("n", "N", "Nzzzv", {silent = true})
keymap("n", "J", "mzJ`z", {silent = true})

-- Set more undo breakpoints
keymap("n", ",", ",<c-g>u", {silent = true})
keymap("n", ".", ".<c-g>u", {silent = true})
keymap("n", "!", "!<c-g>u", {silent = true})
keymap("n", "?", "?<c-g>u", {silent = true})
keymap("n", "]", "]<c-g>u", {silent = true})
keymap("n", "[", "[<c-g>u", {silent = true})
keymap("n", "(", "(<c-g>u", {silent = true})
keymap("n", ")", ")<c-g>u", {silent = true})
keymap("n", "{", "{<c-g>u", {silent = true})
keymap("n", "}", "}<c-g>u", {silent = true})

-- Make 'Y' behave like other capital letters
keymap("n", "Y", "y$")
