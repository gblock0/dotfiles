return {
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
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
  },
  {
    'ruifm/gitlinker.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    opts = {
      mappings = "<leader>gb"
    }
  },
  {
    "Neogitorg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      integrations = {
        diffview = true
      },
      sections = {
        recent = false
      }
    },
    config = function(_, opts)
      local neogit = require("neogit")
      neogit.setup(opts)
      set_nmap("<leader>gs", function() neogit.open({ kind = "vsplit" }) end)
    end
  },
  {

    "sindrets/diffview.nvim",
    opts = {
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
    }
  }
}
