--{{{ FZF.VIM Mappings
-- local keymap = vim.api.nvim_set_keymap
-- keymap('n', '<leader>a',  ':Rg<Cr>', { noremap = true })
-- keymap('n', '<leader>p', ':GFiles<Cr>', { noremap = true })
--}}}
local utils = require'nutils'
keymap = utils.map
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    color_devicons = true,
    -- mappings = {
    --   i = {
    --     ["<C-x>"] = false,
    --     ["<C-s>"] = actions.goto_file_selection_split,
    --     ["<C-q>"] = actions.send_to_qflist,
    --   },
    -- }
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
    fzf_writer = {
      minimum_grep_characters = 2,
      use_highlighter = true,
    },
  },
}
require('telescope').load_extension('fzy_native')
require('telescope').load_extension('fzf_writer')

keymap('n', '<leader>a',  ':Telescope fzf_writer staged_grep<CR>', { noremap = true })
keymap('n', '<leader>p', ':Telescope fzf_writer files<Cr>', { noremap = true })
keymap('n', '<leader>ca', ':Telescope lsp_code_actions<CR>', {noremap = true, silent = true })
keymap('v', '<leader>ca', ':Telescope lsp_range_code_actions<CR>', {noremap = true, silent = true })

-- Create a new vsplit, switch to it and open CtrlP
keymap('n', '<leader>w', '<C-w>v<C-w>l :Telescope find_files<cr>', { noremap = true})

-- Create a new split, switch to it and open CtrlP
keymap('n', '<leader>s', '<C-w>s<C-w>j :Telescope find_files<cr>', { noremap = true})
keymap('n', '<F3>', ':Telescope lsp_references<CR>', {noremap = true })

