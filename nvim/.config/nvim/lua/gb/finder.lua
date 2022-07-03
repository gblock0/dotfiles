local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

require("telescope").setup {
  defaults = {
    prompt_prefix = "   ",
    selection_caret = " ",
    entry_prefix = "  ",
    scroll_strategy = "cycle",
    file_ignore_patterns = {"%.git", "node%_modules"},
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      prompt_position = "top"
    },
    path_display = {"absolute"},
    mappings = {
      i = {
        ["<C-f>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<esc>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-t>"] = trouble.open_with_trouble
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
    color_devicons = true,
  },
  pickers = {
    find_files = {
      hidden = string.find(vim.fn.getcwd(), ".dotfiles"),
      sort_lastused = true,
      previewer = false
    },
    live_grep = {
      hidden = string.find(vim.fn.getcwd(), ".dotfiles"),
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
          ["<c-d>"] = "delete_buffer"
        },
        n = {
          ["<c-d>"] = require("telescope.actions").delete_buffer
        }
      }
    },
    lsp_references = {
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
}

require("telescope").load_extension("fzf")
require("telescope").load_extension("fzf_writer")

function _G.gb_grep_files()
  require("telescope").extensions.fzf_writer.staged_grep {
    previewer = false
  }
end

vim.keymap.set("n", "<leader>a", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>p", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>")

-- Create a new vsplit, switch to it and open CtrlP
vim.keymap.set("n", "<leader>w", "<C-w>v")

-- Create a new split, switch to it and open CtrlP
vim.keymap.set("n", "<leader>s", "<C-w>s<C-w>j")
