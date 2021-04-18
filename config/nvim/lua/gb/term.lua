local utils = require("gb-utils")
local keymap = utils.map

vim.api.nvim_set_var("floaterm_width", 0.9)
vim.api.nvim_set_var("floaterm_height", 0.9)

keymap("n", "<C-g>", ":FloatermToggle<CR>", {silent = true})
keymap("t", "<C-g>", "<C-\\><C-n>:FloatermToggle<CR>", {silent = true})
