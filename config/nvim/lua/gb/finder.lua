local utils = require("gb.utils")
keymap = utils.map

local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

require("telescope").setup {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = "  ",
    scroll_strategy = "cycle",
    file_ignore_patterns = {"%.git", "node%_modules"},
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    path_display = {"absolute"},
    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-f>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<esc>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-t>"] = trouble.open_with_trouble
      }
    }
  },
  pickers = {
    find_files = {
      hidden = string.find(vim.fn.getcwd(), ".dotfiles"),
      sort_lastused = true,
      previewer = false
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

keymap("n", "<leader>a", ":lua gb_grep_files()<CR>")
keymap("n", "<leader>p", ":Telescope find_files<Cr>")
keymap("n", "<leader>ca", ":Telescope lsp_code_actions<CR>")

-- Create a new vsplit, switch to it and open CtrlP
keymap("n", "<leader>w", "<C-w>v :Telescope find_files<cr>")

-- Create a new split, switch to it and open CtrlP
keymap("n", "<leader>s", "<C-w>s<C-w>j :Telescope find_files<cr>")
