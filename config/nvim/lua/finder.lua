local utils = require "nutils"
keymap = utils.map

local actions = require("telescope.actions")

require("telescope").setup {
  defaults = {
    vimgrep_arguments = {"rg", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case"},
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = "  ",
    scroll_strategy = "cycle",
    prompt_position = "top",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    file_ignore_patterns = {},
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
    color_devicons = true,
    use_less = true,
    set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
    file_sorter = require("telescope.sorters").fuzzy_with_index_bias,
    file_previewer = require "telescope.previewers".vim_buffer_cat.new,
    grep_previewer = require "telescope.previewers".vim_buffer_vimgrep.new,
    qflist_previewer = require "telescope.previewers".vim_buffer_qflist.new,
    color_devicons = true,
    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-q>"] = actions.send_to_qflist,
        ["<esc>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous
      }
    }
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true
    },
    fzf_writer = {
      minimum_grep_characters = 2,
      use_highlighter = true
    }
  }
}

require("telescope").load_extension("fzy_native")

keymap("n", "<leader>a", ":Telescope fzf_writer staged_grep<CR>")
keymap("n", "<leader>p", ":Telescope fzf_writer files<Cr>")
keymap("n", "<leader>b", ":Telescope buffers<Cr>")
keymap("n", "<leader>ca", ":Telescope lsp_code_actions<CR>")
keymap("v", "<leader>ca", ":Telescope lsp_range_code_actions<CR>")

-- Create a new vsplit, switch to it and open CtrlP
keymap("n", "<leader>w", "<C-w>v<C-w>l :Telescope find_files<cr>")

-- Create a new split, switch to it and open CtrlP
keymap("n", "<leader>s", "<C-w>s<C-w>j :Telescope find_files<cr>")
keymap("n", "<F3>", ":Telescope lsp_references<CR>")
