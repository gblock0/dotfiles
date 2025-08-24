local function nvim_tree_on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', 'w', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', 's', api.node.open.horizontal, opts('Open: Horizontal Split'))
end

set_nmap("<leader>n", "<cmd>NvimTreeToggle<CR>")

return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    opts = {
      diagnostics = {
        enable = false
      },
      view = {
        width = 40,
      },
      update_focused_file = {
        enable = true
      },
      filters = {
        custom = { "\\.git", "node_modules", ".cache$", ".DS_Store" }
      },
      renderer = {
        group_empty = true,
        root_folder_modifier = ":~"
      },
      on_attach = nvim_tree_on_attach
    }
  }
}
