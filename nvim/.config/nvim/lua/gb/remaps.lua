-- Close location list or quickfix window
vim.keymap.set("n", "<leader>q", "<cmd>ccl<Space><Bar><Space>lcl<cr>")

-- Remap p so that paste doesn't overwrite the 0 register
vim.keymap.set("x", "p", "pgvy")

-- Turn off highlighting, need to add the 'h' at the end of offset the <BS> making the cursor move one character to the right
vim.keymap.set("n", "<BS>", "<cmd>noh<CR> <cmd>match none<CR>h")

-- shortcut to save
vim.keymap.set("n", "<leader><leader>", "<cmd>wa<cr>")

-- scroll the viewport faster
vim.keymap.set("n", "<C-e>", "3<C-e>")
vim.keymap.set("n", "<C-y>", "3<C-y>")
vim.keymap.set("n", "<leader>=", "<C-W>=")

-- Reload init.vim
vim.keymap.set("n", "<leader>re", '<cmd>so ~/.config/nvim/init.vim<CR>:noh<CR>:echo "init.vim Reload!"<cr>')

-- Add semi colon to the end of current line and return cursor to position
vim.keymap.set("n", "<leader>;", "maA;<esc>`a:wa<CR>")

-- Copy current file's path to clipboard
vim.keymap.set("n", "cp", '<cmd>let @+ = expand("%")<cr>', { silent = false})

-- Disable help F1 key
vim.keymap.set("", "<F1>", "<ESC>")

-- show/hide whitespace mappings
vim.keymap.set("n", "<F5>", "<cmd>set list!<cr>")

vim.keymap.set("n", "<leader>rn", "<cmd>set relativenumber!<cr>", {silent = true})

-- Reselect pasted text
vim.keymap.set("n", "gp", "`[v`]", {silent = true})

-- Keep cursor in the middle of the screen
vim.keymap.set("n", "n", "nzzzv", {silent = true})
vim.keymap.set("n", "N", "Nzzzv", {silent = true})

-- Set more undo breakpoints
vim.keymap.set("n", ",", ",<c-g>u", {silent = true})
vim.keymap.set("n", ".", ".<c-g>u", {silent = true})
vim.keymap.set("n", "!", "!<c-g>u", {silent = true})
vim.keymap.set("n", "?", "?<c-g>u", {silent = true})
vim.keymap.set("n", "]", "]<c-g>u", {silent = true})
vim.keymap.set("n", "[", "[<c-g>u", {silent = true})
vim.keymap.set("n", "(", "(<c-g>u", {silent = true})
vim.keymap.set("n", ")", ")<c-g>u", {silent = true})
vim.keymap.set("n", "{", "{<c-g>u", {silent = true})
vim.keymap.set("n", "}", "}<c-g>u", {silent = true})

-- Make 'Y' behave like other capital letters
vim.keymap.set("n", "Y", "y$")

-- When highlighting a word, keep the cursor on the current word
vim.keymap.set("n", "*", "*N")

vim.keymap.set("i", "<F1>", "<Nop>")

-- Alt + j/k moves selected lines down/up in visual-block mode
vim.keymap.set("x", "J", ":m '>+1<CR>gv=gv", {silent = true})
vim.keymap.set("x", "K", ":m '<-2<CR>gv=gv", {silent = true})
-- Alt + j/k moves selected lines down/up in insert mode
vim.keymap.set("i", "∆", "<Esc>:m .+1<CR>==gi", {silent = true}) -- Alt+j
vim.keymap.set("i", "˚", "<Esc>:m .-2<CR>==gi", {silent = true}) -- Alt+k


