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

local actions = require("diffview.actions")

require('diffview').setup({
  diff_binaries = false,
  enhanced_diff_hl = true,
  git_cmd = { "git" },
  use_icons = true,
  icons = {
    folder_closed = "",
    folder_open = "",
  },
  signs = {
    fold_closed = "",
    fold_open = "",
  },
  view = {
    merge_tool = {
      layout = "diff3_mixed",
      disable_diagnostics = true,
    },
  },
  file_panel = {
    listing_style = "tree",
    tree_options = {
      flatten_dirs = true,
      folder_statuses = "only_folded",
    },
    win_config = {
      position = "left",
      width = 35,
    },
  },
  file_history_panel = {
    log_options = {
      git = {
        single_file = {
          diff_merges = "combined",
        },
        multi_file = {
          diff_merges = "first-parent",
        },
      }
    },
    win_config = {
      position = "bottom",
      height = 16,
    },
  },
})
