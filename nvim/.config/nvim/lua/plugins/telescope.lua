return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- "folke/trouble.nvim"
    },
    opts =
    {
      defaults = {
        prompt_prefix = "   ",
        selection_caret = " ",
        entry_prefix = "  ",
        scroll_strategy = "cycle",
        file_ignore_patterns = { "%.git", "node%_modules" },
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          prompt_position = "top"
        },
        path_display = function(_, path)
          local tail = require("telescope.utils").path_tail(path)
          return string.format("%s (%s)", tail, path)
        end,
        mappings = {
          i = {
            ["<C-f>"] = require("telescope.actions").smart_send_to_qflist + require("telescope.actions").open_qflist,
            ["<esc>"] = require("telescope.actions").close,
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
            -- ["<C-t>"] = require("trouble.providers.telescope").open_with_trouble
          }
        },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
        },
        winblend = 0,
        border = {},
        borderchars = { "" },
      },
      pickers = {
        find_files = {
          hidden = true,
          sort_lastused = true,
          previewer = false
        },
        live_grep = {
          hidden = true,
          sort_lastused = true,
          previewer = false
        },
        buffers = {
          sort_lastused = true,
          previewer = false,
          mappings = {
            i = {
              ["<c-d>"] = require("telescope.actions").delete_buffer,
              -- Right hand side can also be the name of the action as a string
            },
            n = {
              ["<c-d>"] = require("telescope.actions").delete_buffer
            }
          }
        },
        lsp_references = {
          fname_width = 0.5,
          layout_strategy = "vertical",
          layout_config = {
            mirror = true
          }
        }
      },
      extensions = {
        fzf = {
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case"
        },
        fzf_writer = {
          minimum_grep_characters = 2
        }
      }
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("fzf_writer")
      require("telescope").load_extension("ui-select")

      set_nmap("<leader>a", "<cmd>Telescope live_grep<cr>", "Telescope: Live Grep")
      set_nmap("<leader>p", "<cmd>Telescope find_files<cr>", "Telescope: Find Files")
      set_nmap("<leader>b", "<cmd>Telescope buffers<cr>", "Telescope: Buffers")

      -- Create a new vsplit, switch to it and open CtrlP
      set_nmap("<leader>w", "<C-w>v", "Open new vsplit")

      -- Create a new split, switch to it and open CtrlP
      set_nmap("<leader>s", "<C-w>s<C-w>j", "Open new split")
    end
  },
  "nvim-telescope/telescope-fzf-writer.nvim",
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make"
  },
  'nvim-telescope/telescope-ui-select.nvim',
}
