keymap = require("gb.utils").map

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

keymap("n", "<leader>gs", "vertical Git", { silent = true, cmd_cr = true  })
keymap("n", "<leader>gh", "diffget //2", { silent = true, cmd_cr = true  })
keymap("n", "<leader>gl", "diffget //3", { silent = true, cmd_cr = true  })
keymap("n", "<leader>gb", "GBrowse!", { silent = true, cmd_cr = true })
keymap("v", "<leader>gb", ":'<,'>GBrowse!<CR>", { silent = true, cmd_cr = false })

require("neogit").setup(
{
    integrations = {
      diffview = true
    }
}
)
