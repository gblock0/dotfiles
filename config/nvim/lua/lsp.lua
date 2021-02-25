local utils = require'nutils'
keymap = utils.map
opt = utils.opt

vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}

opt('o', 'completeopt', 'menu,menuone,noselect')

keymap('n', '<leader>ld', ':lua vim.lsp.buf.definition()<CR>', {noremap = true })
keymap('n', '<leader>li', ':lua vim.lsp.buf.implementation()<CR>', {noremap = true })
keymap('n', '<leader>lsh', ':lua vim.lsp.buf.signature_help()<CR>', {noremap = true })
keymap('n', '<F2>', ':lua vim.lsp.buf.rename()<CR>', {noremap = true })
keymap('n', '<leader>lh', ':lua vim.lsp.buf.hover()<CR>', {noremap = true })

--must have run: npm install -g typescript
require'lspconfig'.tsserver.setup{}

--must run: npm install -g pyright
require'lspconfig'.pyright.setup{}

require'lspconfig'.rust_analyzer.setup{}

require'compe'.setup {
  preselect = 'always';
  source = {
    path = true;
    buffer = true;
    nvim_lsp = true;
    nvim_lua = true;
    treesitter = true;
  };
}

keymap('i', '<C-Space>', 'compe#complete()', {noremap = true, silent = true, expr = true})
keymap('i', '<CR>', "compe#confirm('<CR>')", {noremap = true, silent = true, expr = true})

local saga = require 'lspsaga'
saga.init_lsp_saga()
keymap('n', '<leader>e', ':Lspsaga diagnostic_jump_next<CR>', {noremap = true, silent = true })
keymap('n', '<leader>cd', ':Lspsaga show_line_diagnostics<CR>', {noremap = true, silent = true })
keymap('n', 'K', ':Lspsaga hover_doc<CR>', {noremap = true, silent = true })

require('lspkind').init({
    with_text = true,
})

