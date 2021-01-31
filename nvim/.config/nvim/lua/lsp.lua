vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
vim.o.completeopt = 'menuone,noinsert,noselect'

local keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>ld', ':lua vim.lsp.buf.definition()<CR>', {noremap = true })
keymap('n', '<leader>li', ':lua vim.lsp.buf.implementation()<CR>', {noremap = true })
keymap('n', '<leader>lsh', ':lua vim.lsp.buf.signature_help()<CR>', {noremap = true })
keymap('n', '<F3>', ':lua vim.lsp.buf.references()<CR>', {noremap = true })
keymap('n', '<F2>', ':lua vim.lsp.buf.rename()<CR>', {noremap = true })
keymap('n', '<leader>lh', ':lua vim.lsp.buf.hover()<CR>', {noremap = true })
keymap('n', '<leader>lca', ':lua vim.lsp.buf.code_action()<CR>', {noremap = true })
keymap('n', '<leader>lsd', ':lua vim.lsp.util.show_line_diagnostics()<CR>', {noremap = true })


keymap('n', 'K', ':lua vim.lsp.buf.hover()<CR>', {noremap = true, silent = true })
keymap('n', '[e', ':LspSagaDiagJumpPrev<CR>', {noremap = true, silent = true })
keymap('n', ']e', ':LspSagaDiagJumpNext<CR>', {noremap = true, silent = true })
keymap('n', '<leader>ca', ':LspSagaCodeAction<CR>', {noremap = true, silent = true })
keymap('v', '<leader>ca', ':LspSagaRangeCodeAction<CR>', {noremap = true, silent = true })
keymap('i', '<c-p', '<Plug>(completion_trigger)', {noremap = true, silent = true })

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
