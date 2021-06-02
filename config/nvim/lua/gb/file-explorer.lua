local keymap = require("gb.utils").map
vim.g.nvim_tree_width = 40 --30 by default
vim.g.nvim_tree_ignore = {".git", "node_modules", ".cache", ".DS_Store"} --empty by default
vim.g.nvim_tree_auto_close = 1 --0 by default, closes the tree when it's the last window
vim.g.nvim_tree_follow = 1 --0 by default, this option allows the cursor to be updated when entering a buffer
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_root_folder_modifier = ":~" --This is the default. See :help filename-modifiers for more options
vim.g.nvim_tree_lsp_diagnostics = 1 --0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics

keymap("n", "<leader>n", ":NvimTreeToggle<CR>", {silent = true})

local tree_cb = require "nvim-tree.config".nvim_tree_callback
vim.g.nvim_tree_bindings = {
  ["w"] = tree_cb("vsplit"),
  ["s"] = tree_cb("split")
}
