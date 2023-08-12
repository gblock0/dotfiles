-- Disable help F1 key
vim.keymap.set("", "<F1>", "<ESC>")

-- Insert mode remaps --

vim.keymap.set("i", "<F1>", "<Nop>")

-- Alt + j/k moves selected lines down/up in insert mode
vim.keymap.set("i", "∆", "<Esc>:m .+1<CR>==gi", { silent = true }) -- Alt+j
vim.keymap.set("i", "˚", "<Esc>:m .-2<CR>==gi", { silent = true }) -- Alt+k

-- Normal mode remaps --

set_nmap("<F5>", "<cmd>set list!<cr>", "show/hide whitespace mappings")

set_nmap("gp", "`[v`]", "Reselect pasted text")

set_nmap("n", "nzzzv", "Keep cursor in the middle of the screen when searching down")
set_nmap("N", "Nzzzv", "Keep cursor in the middle of the screen when searching up")

-- Set more undo breakpoints -- doesn't work need to fix
-- set_nmap(",", ",<c-g>u", "Set undo breakpoints for ','")
-- set_nmap(".", ".<c-g>u", "Set undo breakpoints for '.'")
-- set_nmap("!", "!<c-g>u", "Set undo breakpoints for '!'")
-- set_nmap("?", "?<c-g>u", "Set undo breakpoints for '?'")
-- set_nmap("]", "]<c-g>u", "Set undo breakpoints for '['")
-- set_nmap("[", "[<c-g>u", "Set undo breakpoints for '['")
-- set_nmap("(", "(<c-g>u", "Set undo breakpoints for '('")
-- set_nmap(")", ")<c-g>u", "Set undo breakpoints for ')'")
-- set_nmap("{", "{<c-g>u", "Set undo breakpoints for '{'")
-- set_nmap("}", "}<c-g>u", "Set undo breakpoints for '}'")

set_nmap("Y", "y$", "Make 'Y' behave like other capital letters")

set_nmap("*", "*N", "When highlighting a word, keep the cursor on the current word")

set_nmap("<BS>", "<cmd>noh<CR> <cmd>match none<CR>h",
  "Turn off highlighting, need to add the 'h' at the end of offset the <BS> making the cursor move one character to the right")

set_nmap("<C-e>", "3<C-e>", "scroll the viewport faster")
set_nmap("<C-y>", "3<C-y>", "scroll the viewport faster")

set_nmap("<leader>rn", "<cmd>set relativenumber!<cr>")
set_nmap("<leader>q", "<cmd>ccl<Space><Bar><Space>lcl<cr>", "Close location list or quickfix window")
set_nmap("<leader><leader>", "<cmd>wa<cr>", "shorcut to save")
set_nmap("<leader>=", "<C-W>=", "Equalize splits")
set_nmap("<leader>re", '<cmd>so ~/.config/nvim/init.vim<CR>:noh<CR>:echo "init.vim Reload!"<cr>', "Reload init.vim")
set_nmap("<leader>;", "maA;<esc>`a:wa<CR>", "Add semi colon to the end of current line and return cursor to position")

set_nmap("cp", '<cmd>let @+ = expand("%")<cr>', "Copy current file's path to clipboard")

set_nmap("H", "^", "Use H to go to beginning of line")
set_nmap("L", "$", "Use L to go to end of line")

-- Visual select mode remaps --

-- Alt + j/k moves selected lines down/up in visual-block mode
vim.keymap.set("x", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("x", "K", ":m '<-2<CR>gv=gv", { silent = true })

vim.keymap.set("x", "p", "pgvy", { desc = "Remap 'p' so that paste doesn't overwrite the 0 register" })
