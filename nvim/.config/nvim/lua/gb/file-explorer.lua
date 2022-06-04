vim.keymap.set("n", "<leader>n", "<cmd>NvimTreeToggle<CR>", {silent = true})

local tree_cb = require "nvim-tree.config".nvim_tree_callback
require "nvim-tree".setup {
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
  },
  renderer = {
    group_empty = true,
    root_folder_modifier = ":~"
  }
}
