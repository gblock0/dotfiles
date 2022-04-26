vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_root_folder_modifier = ":~" --This is the default. See :help filename-modifiers for more options

vim.keymap.set("n", "<leader>n", "<cmd>NvimTreeToggle<CR>", {silent = true})

local tree_cb = require "nvim-tree.config".nvim_tree_callback
require "nvim-tree".setup {
  auto_close = false,
  diagnostics = {
    enable = false
  },
  view = {
    width = 40,
    mappings = {
      list = {
        {key = "w", cb = tree_cb("vsplit")},
        {key = "s", cb = tree_cb("split")}
      }
    }
  },
  update_focused_file = {
    enable = true
  },
  filters = {
    custom = {".git", "node_modules", ".cache", ".DS_Store"}
  }
}
