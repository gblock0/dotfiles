require("gitsigns").setup(
{
    watch_gitdir = {
      interval = 100
    },
    signs = {
      add = { hl = "GitGutterAdd" },
      change = { hl = "GitGutterChange" },
      delete = { hl = "GitGutterDelete" },
      topdelete = { hl = "GitGutterDelete" },
      changedelete = { hl = "GitGutterChangeDelete" }
    }
}
)

local neogit = require("neogit")

neogit.setup(
  {
    integrations = {
      diffview = true
    },
    sections = {
      recent = false
    }
  }
)

vim.keymap.set("n", "<leader>gs", function() neogit.open({ kind = "vsplit" })  end, { silent = true})
vim.keymap.set("n", "<leader>gh", "<cmd>diffget //2<cr>", { silent = true})
vim.keymap.set("n", "<leader>gl", "<cmd>diffget //3<cr>", { silent = true})
vim.keymap.set("n", "<leader>gb", "<cmd>GBrowse!<cr>", { silent = true })
vim.keymap.set("v", "<leader>gb", "<cmd>'<,'>GBrowse!<CR>", { silent = true })
