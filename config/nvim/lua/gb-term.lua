local utils = require("nutils")
local keymap = utils.map

vim.api.nvim_set_var("floaterm_width", 0.9)
vim.api.nvim_set_var("floaterm_height", 0.9)

keymap("n", "<C-z>", ":FloatermToggle<CR>", {silent = true})
keymap("t", "<C-z>", "<C-\\><C-n>:FloatermToggle<CR>", {silent = true})
