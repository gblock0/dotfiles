vim.api.nvim_set_var("floaterm_width", 0.9)
vim.api.nvim_set_var("floaterm_height", 0.9)

vim.keymap.set("n", "<C-g>", "<cmd>FloatermToggle<CR>", {silent = true})
vim.keymap.set("t", "<C-g>", "<C-\\><C-n><cmd>FloatermToggle<CR>", {silent = true})
