keymap = require("gb.utils").map

require("gitsigns").setup(
  {
    watch_index = {
      interval = 100
    },
    signs = {
      add = {hl = "GitGutterAdd"},
      change = {hl = "GitGutterChange"},
      delete = {hl = "GitGutterDelete"},
      topdelete = {hl = "GitGutterDelete"},
      changedelete = {hl = "GitGutterChangeDelete"}
    }
  }
)

keymap("n", "<leader>gs", ":vertical Git<CR>", {silent = true})
keymap("n", "<leader>gh", ":diffget //2<CR>", {silent = true})
keymap("n", "<leader>gl", ":diffget //3<CR>", {silent = true})
keymap("n", "<leader>gb", ":Git blame<CR>", {silent = true})

require("neogit").setup(
  {
    integrations = {
      diffview = true
    }
  }
)
