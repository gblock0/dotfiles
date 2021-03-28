local utils = require("nutils")
local nvim_lsp = require("lspconfig")
keymap = utils.map
opt = utils.opt

local function custom_on_init()
  print("Language Server Protocol started!")
end

local function custom_root_dir()
  if (string.find(vim.fn.expand("%f"), "node_modules/") == nil) then
    return nvim_lsp.util.root_pattern(".git")
  end

  return nil
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

--must have run: npm install -g typescript
nvim_lsp.tsserver.setup {
  -- This makes sure tsserver is not used for formatting
  on_attach = nvim_lsp.tsserver_on_attach,
  settings = {documentFormatting = false},
  on_init = custom_on_init,
  capabilities = capabilities
}

--must run: npm install -g pyright
nvim_lsp.pyright.setup {
  on_init = custom_on_init
}

nvim_lsp.rust_analyzer.setup {
  on_init = custom_on_init,
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importMergeBehavior = "last",
        importPrefix = "by_self"
      },
      cargo = {
        loadOutDirsFromCheck = true
      },
      procMacro = {
        enable = true
      }
    }
  }
}

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = true,
    signs = true,
    update_in_insert = true
  }
)

-- npm i -g vscode-css-languageserver-bin
nvim_lsp.cssls.setup {
  on_init = custom_on_init
}

-- npm i -g vscode-html-languageserver-bin
nvim_lsp.html.setup {
  on_init = custom_on_init,
  capabilities = capabilities
}

local eslint_d = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"}
}

local rustExe = "rustfmt"
local rustArgs = "--emit=stdout"
local rustStdin = true

local rustfmt = {
  formatCommand = rustExe .. rustArgs .. "${INPUT}",
  formatStdin = rustStdin
}

local prettierArgs = {"--stdin", "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"}

local prettier = {
  formatCommand = "./node_modules/.bin/prettier" .. table.concat(prettierArgs, " "),
  formatStdin = true
}

local languages = {
  typescript = {prettier, eslint_d},
  javascript = {prettier, eslint_d},
  typescriptreact = {prettier, eslint_d},
  ["typescript.tsx"] = {prettier, eslint_d},
  javascriptreact = {prettier, eslint_d},
  ["javascript.jsx"] = {prettier, eslint_d},
  yaml = {prettier},
  json = {prettier},
  html = {prettier},
  scss = {prettier},
  css = {prettier},
  markdown = {prettier},
  rust = {rustfmt},
  python = {
    {
      formatCommand = "black",
      formatStdin = true
    },
    {
      formatCommand = "isort",
      formatStdin = true
    }
  }
}

nvim_lsp.efm.setup {
  init_options = {documentFormatting = true},
  filetypes = vim.tbl_keys(languages),
  root_dir = custom_root_dir(),
  settings = {
    languages = languages
  }
}

require "compe".setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = "enable",
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = true,
  source = {
    path = true,
    buffer = true,
    nvim_lsp = true,
    nvim_lua = true,
    spell = true
  }
}

require("lspsaga").init_lsp_saga(
  {
    error_sign = "▊",
    warn_sign = "▊",
    hint_sign = "▊",
    infor_sign = "▊",
    dianostic_header_icon = "   ",
    code_action_icon = "",
    finder_definition_icon = "  ",
    finder_reference_icon = "  ",
    definition_preview_icon = "  ",
    border_style = 1,
    rename_prompt_prefix = "❱❱",
    rename_action_keys = {
      quit = {"<C-c>", "<esc>"},
      exec = "<CR>" -- quit can be a table
    }
  }
)
require("lspkind").init(
  {
    with_text = true,
    symbol_map = {
      Text = "  ",
      Method = "  ",
      Function = "  ",
      Constructor = "  ",
      Variable = "[]",
      Class = "  ",
      Interface = " 蘒",
      Module = "  ",
      Property = "  ",
      Unit = " 塞 ",
      Value = "  ",
      Enum = " 練",
      Keyword = "  ",
      Snippet = "  ",
      Color = "",
      File = "",
      Folder = " ﱮ ",
      EnumMember = "  ",
      Constant = "  ",
      Struct = "  "
    }
  }
)

vim.g.completion_matching_strategy_list = {"exact", "substring", "fuzzy"}
opt("o", "completeopt", "menu,menuone,noselect")

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col(".") - 1
  if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
    return true
  else
    return false
  end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn["compe#complete"]()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", {silent = true})
keymap("n", "gr", ":Lspsaga rename<CR>")
keymap("n", "gs", ":Lspsaga signature_help<CR>")
keymap("n", "<leader>e", ":Lspsaga diagnostic_jump_next<CR>", {silent = true})
keymap("n", "<leader>cd", ":Lspsaga show_line_diagnostics<CR>", {silent = true})
keymap("n", "K", ":Lspsaga hover_doc<CR>", {silent = true})
keymap("i", "<C-Space>", "compe#complete()", {silent = true, expr = true})
keymap("i", "<CR>", 'compe#confirm("<CR>")', {silent = true, expr = true})
