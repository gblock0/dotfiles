vim.keymap.set("n", "<leader>n", "<cmd>NvimTreeToggle<CR>", {silent = true})

-- local tree_cb = require "nvim-tree.config".nvim_tree_callback
local function vsplit()
    -- open as vsplit on current node
    local action = "vsplit"
    local node = lib.get_node_at_cursor()

    -- Just copy what's done normally with vsplit
    if node.link_to and not node.nodes then
        require('nvim-tree.actions.node.open-file').fn(action, node.link_to)

    elseif node.nodes ~= nil then
        lib.expand_or_collapse(node)

    else
        require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)

    end

    -- Finally refocus on tree if it was lost
    view.focus()
end

local function split()
    -- open as vsplit on current node
    local action = "split"
    local node = lib.get_node_at_cursor()

    -- Just copy what's done normally with vsplit
    if node.link_to and not node.nodes then
        require('nvim-tree.actions.node.open-file').fn(action, node.link_to)

    elseif node.nodes ~= nil then
        lib.expand_or_collapse(node)

    else
        require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)

    end

    -- Finally refocus on tree if it was lost
    view.focus()
end
require "nvim-tree".setup {
  diagnostics = {
    enable = false
  },
  view = {
    width = 40,
    mappings = {
      list = {
        {key = "w", action = "vsplit", action_cb = vsplit},
        {key = "s", action = "split", action_cb = split},
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
