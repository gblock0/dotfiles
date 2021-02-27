local utils = require'nutils'
keymap = utils.map
opt = utils.opt

vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}

local nvim_lsp = require 'lspconfig'

opt('o', 'completeopt', 'menu,menuone,noselect')

keymap('n', '<leader>ld', ':lua vim.lsp.buf.definition()<CR>', {noremap = true })
keymap('n', '<leader>li', ':lua vim.lsp.buf.implementation()<CR>', {noremap = true })
keymap('n', '<leader>lsh', ':lua vim.lsp.buf.signature_help()<CR>', {noremap = true })
keymap('n', '<F2>', ':lua vim.lsp.buf.rename()<CR>', {noremap = true })
keymap('n', '<leader>lh', ':lua vim.lsp.buf.hover()<CR>', {noremap = true })

--must have run: npm install -g typescript
nvim_lsp.tsserver.setup{}

--must run: npm install -g pyright
nvim_lsp.pyright.setup{}

nvim_lsp.rust_analyzer.setup{}

local eslint_d = {
  lintCommand = 'eslint_d -f unix --stdin --stdin-filename ${INPUT}',
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = {'%f:%l:%c: %m'},
}

local rustExe = 'rustfmt'
local rustArgs = '--emit=stdout'
local rustStdin = true

local rustfmt  = {
  formatCommand = rustExe..rustArgs..'${INPUT}',
  formatStdin = rustStdin
}

local prettierExePath = './node_modules/.bin/prettier';
local prettierArgs = '--stdin-filepath '..vim.api.nvim_buf_get_name(0)
local prettierStdin = true

local prettier  = {
  formatCommand = prettierExePath..prettierArgs,
  formatStdin = prettierStdin
}

local languages = {
  typescript = {prettier, eslint_d},
  javascript = {prettier, eslint_d},
  typescriptreact = {prettier, eslint_d},
  ['typescript.tsx'] = {prettier, eslint_d},
  javascriptreact = {prettier, eslint_d},
  ['javascript.jsx'] = {prettier, eslint_d},
  yaml = {prettier},
  json = {prettier},
  html = {prettier},
  scss = {prettier},
  css = {prettier},
  markdown = {prettier},
  rust = {rustfmt}
}

nvim_lsp.efm.setup {
    init_options = {documentFormatting = true},
    filetypes = vim.tbl_keys(languages),
    root_dir = function()
      return vim.fn.getcwd()
    end,
    settings = {
        rootMarkers = {'.git', 'package.json'},
        languages = languages
    }
}

local prettierFormatter = {
  function()
    return {
      exe = prettierExePath,
      args = {prettierArgs},
      stdin = prettierStdin
    }
  end
}

require'formatter'.setup {
  logging = false,
  filetype = {
    typescriptreact = prettierFormatter,
    typescript = prettierFormatter,
    javascript = prettierFormatter,
    javascriptreact = prettierFormatter,
    json = prettierFormatter,
    rust = {
      function ()
        return {
          exe = rustExe,
          args = {rustArgs},
          stdin = rustStdin
        }
      end

    }
  }
}

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
keymap('i', '<CR>', 'compe#confirm("<CR>")', {noremap = true, silent = true, expr = true})

local saga = require 'lspsaga'
saga.init_lsp_saga()
keymap('n', '<leader>e', ':Lspsaga diagnostic_jump_next<CR>', {noremap = true, silent = true })
keymap('n', '<leader>cd', ':Lspsaga show_line_diagnostics<CR>', {noremap = true, silent = true })
keymap('n', 'K', ':Lspsaga hover_doc<CR>', {noremap = true, silent = true })

require('lspkind').init({
    with_text = true,
})

