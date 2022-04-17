local utils = require("gb.utils")
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

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.vimls.setup {}

nvim_lsp.jsonls.setup {
  cmd = {"vscode-json-language-server", "--stdio"},
  on_attach = function (client)
    require "lsp-format".on_attach(client)
  end,
  capabilities = capabilities,
  filetypes = {"json", "jsonc"},
  settings = {
    json = {
      -- Schemas https://www.schemastore.org
      schemas = {
        {
          fileMatch = {"package.json"},
          url = "https://json.schemastore.org/package.json"
        },
        {
          fileMatch = {"tsconfig*.json"},
          url = "https://json.schemastore.org/tsconfig.json"
        },
        {
          fileMatch = {
            ".prettierrc",
            ".prettierrc.json",
            "prettier.config.json"
          },
          url = "https://json.schemastore.org/prettierrc.json"
        },
        {
          fileMatch = {".eslintrc", ".eslintrc.json"},
          url = "https://json.schemastore.org/eslintrc.json"
        },
        {
          fileMatch = {".babelrc", ".babelrc.json", "babel.config.json"},
          url = "https://json.schemastore.org/babelrc.json"
        },
        {
          fileMatch = {"lerna.json"},
          url = "https://json.schemastore.org/lerna.json"
        },
        {
          fileMatch = {"now.json", "vercel.json"},
          url = "https://json.schemastore.org/now.json"
        },
        {
          fileMatch = {
            ".stylelintrc",
            ".stylelintrc.json",
            "stylelint.config.json"
          },
          url = "http://json.schemastore.org/stylelintrc.json"
        }
      }
    }
  }
}

--must have run: npm install -g typescript
nvim_lsp.tsserver.setup {
  -- This makes sure tsserver is not used for formatting
  -- on_attach = nvim_lsp.tsserver_on_attach,
  on_attach = function(client)
    if client.config.flags then
      client.config.flags.allow_incremental_sync = true
    end
    client.resolved_capabilities.document_formatting = false
    require "lsp-format".on_attach(client)
  end,
  capabilities = capabilities,
  root_dir = nvim_lsp.util.root_pattern("tsconfig.json", ".git"),
  -- cmd = {
  --   "typescript-language-server",
  --   "--tsserver-log-file",
  --   vim.env.HOME .. "/src/tsserver.log",
  --   "--tsserver-log-verbosity",
  --   "verbose",
  --   "--stdio"
  -- },
  settings = {documentFormatting = false},
  on_init = custom_on_init
}

nvim_lsp.rust_analyzer.setup {
  on_attach = function (client)
    require "lsp-format".on_attach(client)
  end
}

--must run: npm install -g pyright
nvim_lsp.pyright.setup {
  on_init = custom_on_init,
  on_attach = function(client)
    require "lsp-format".on_attach(client)
  end
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

-- npm i -g vscode-langservers-extracted
nvim_lsp.cssls.setup {
  on_init = custom_on_init,
  -- Need capabilities for snippets/completion
  capabilities = capabilities
}

-- npm i -g vscode-langservers-extracted
nvim_lsp.html.setup {
  on_init = custom_on_init
}

nvim_lsp.eslint.setup {}

local cmp = require("cmp")
local lspkind = require("lspkind")
cmp.setup {
  sources = { 
    {name = "nvim_lsp"},
    {name = "vsnip"},
    {name = "buffer"},
    {name = "nvim_lua"},
    {name = "path"},
    { name = 'nvim_lsp_signature_help' }
  },
  snippet = {
    expand = function(args)
      -- For `vsnip` user.
      vim.fn["vsnip#anonymous"](args.body)
    end
  },
  comparators = {
    cmp.config.compare.recently_used,
    cmp.config.compare.locality,
    cmp.config.compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
    cmp.config.compare.offset,
    cmp.config.compare.order,
  },
  formatting = {
    format = lspkind.cmp_format(
      {
        mode = "symbol_text",
        maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        -- The function below will be called before any actual modifications from lspkind
        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
        before = function(entry, vim_item)
          vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind
          -- set a name for each source
          vim_item.menu =
            ({
            buffer = " (Buffer)",
            nvim_lsp = " (LSP)",
            nvim_lua = " (Lua)",
            path = " (Path)",
            -- path = " (Vsnip)"
          })[entry.source.name]
          return vim_item
        end
      }
    )
  },
  mapping = {
    ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "s"}),
    ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "s"}),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm(
      {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true
      }
    )
  }
}

-- vim.g.vsnip_snippet_dir = vim.fn.stdpath "config" .. "/snippets"

local signs = {"Error", "Warn", "Hint", "Info"}
for index, type in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, {text = "▊ ", texthl = hl, numhl = hl})
end

vim.g.completion_matching_strategy_list = {"exact", "substring", "fuzzy"}
opt("o", "completeopt", "menu,menuone,noselect")

keymap("n", "gd", "lua vim.lsp.buf.definition()", {silent = true, cmd_cr = true})
keymap("n", "gR", "lua vim.lsp.buf.rename()", {cmd_cr = true})
keymap("n", "gr", ":lua require'telescope.builtin'.lsp_references({cwd= vim.fn.expand('%:h')})", {cmd_cr = true})
-- keymap("n", "gr", "Telescope lsp_references({cwd: utils.buffer_dir()})", {cmd_cr = true})
keymap("n", "<leader>e", "lua vim.lsp.diagnostic.goto_next()", {silent = true, cmd_cr = true})
keymap("n", "<leader>cd", "lua vim.lsp.diagnostic.show_line_diagnostics()", {silent = true, cmd_cr = true})
keymap("n", "K", "lua vim.lsp.buf.hover()", {silent = true, cmd_cr = true})
