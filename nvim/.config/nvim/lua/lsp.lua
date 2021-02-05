vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
vim.o.completeopt = 'menuone,noinsert,noselect'

local keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>ld', ':lua vim.lsp.buf.definition()<CR>', {noremap = true })
keymap('n', '<leader>li', ':lua vim.lsp.buf.implementation()<CR>', {noremap = true })
keymap('n', '<leader>lsh', ':lua vim.lsp.buf.signature_help()<CR>', {noremap = true })
keymap('n', '<F2>', ':lua vim.lsp.buf.rename()<CR>', {noremap = true })
keymap('n', '<leader>lh', ':lua vim.lsp.buf.hover()<CR>', {noremap = true })
keymap('n', '<leader>lca', ':lua vim.lsp.buf.code_action()<CR>', {noremap = true })
keymap('n', '<leader>lsd', ':lua vim.lsp.util.show_line_diagnostics()<CR>', {noremap = true })


keymap('n', 'K', ':lua vim.lsp.buf.hover()<CR>', {noremap = true, silent = true })
keymap('i', '<c-p>', '<Plug>(completion_trigger)<CR>', {noremap = true, silent = true })


--must have run: npm install -g typescript
require"lspconfig".tsserver.setup{
    on_attach = function(client)
        require"completion".on_attach(client)
        require"illuminate".on_attach(client)
    end
}

--must run: npm install -g pyright
require"lspconfig".pyright.setup{on_attach=require"completion".on_attach}


local saga = require 'lspsaga'
saga.init_lsp_saga()
keymap('n', '<leader>e', ':LspSagaDiagJumpNext<CR>', {noremap = true, silent = true })
keymap('n', '<leader>cd', ':LspSagaShowLineDiags<CR>', {noremap = true, silent = true })

require('telescope').setup{
  defaults = {
    file_sorter =  require'telescope.sorters'.get_fzy_sorter,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
  }
}


keymap('n', '<leader>a',  ':Telescope live_grep<CR>', { noremap = true })
keymap('n', '<leader>p', ':Telescope find_files<Cr>', { noremap = true })
keymap('n', '<leader>ca', ':Telescope lsp_code_actions<CR>', {noremap = true, silent = true })
keymap('v', '<leader>ca', ':Telescope lsp_range_code_actions<CR>', {noremap = true, silent = true })

-- Create a new vsplit, switch to it and open CtrlP
keymap('n', '<leader>w', '<C-w>v<C-w>l :Telescope find_files<cr>', { noremap = true})

-- Create a new split, switch to it and open CtrlP
keymap('n', '<leader>s', '<C-w>s<C-w>j :Telescope find_files<cr>', { noremap = true})
keymap('n', '<F3>', ':Telescope lsp_references<CR>', {noremap = true })

require('lspkind').init({
    with_text = true,
})
