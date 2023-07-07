local nvim_lsp = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

nvim_lsp.terraformls.setup {
  on_attach = function(client)
    require "lsp-format".on_attach(client)
  end
}

nvim_lsp.vimls.setup {}

nvim_lsp.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
}

nvim_lsp.jsonls.setup {
  cmd = { "vscode-json-language-server", "--stdio" },
  on_attach = function(client)
    require "lsp-format".on_attach(client)
  end,
  capabilities = capabilities,
  filetypes = { "json", "jsonc" },
  settings = {
    json = {
      -- Schemas https://www.schemastore.org
      schemas = {
        {
          fileMatch = { "package.json" },
          url = "https://json.schemastore.org/package.json"
        },
        {
          fileMatch = { "tsconfig*.json" },
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
          fileMatch = { ".eslintrc", ".eslintrc.json" },
          url = "https://json.schemastore.org/eslintrc.json"
        },
        {
          fileMatch = { ".babelrc", ".babelrc.json", "babel.config.json" },
          url = "https://json.schemastore.org/babelrc.json"
        },
        {
          fileMatch = { "lerna.json" },
          url = "https://json.schemastore.org/lerna.json"
        },
        {
          fileMatch = { "now.json", "vercel.json" },
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

nvim_lsp.rust_analyzer.setup {
  on_attach = function(client)
    require "lsp-format".on_attach(client)
  end
}

-- Infers the full executable path based on shell command name
local read_exec_path = function(exec_name)
  local handle = io.popen("which " .. exec_name)
  local result = handle:read("*a"):gsub("\n", "")
  handle:close()
  return result
end

--must run: npm install -g pyright
nvim_lsp.pyright.setup {
  on_attach = function(client)
    require "lsp-format".on_attach(client)
  end,
  settings = {
    python = {
      -- Use the locally available python executable. Enables using pyright from an activated venv.
      pythonPath = read_exec_path("python"),
    },
  },
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
  capabilities = capabilities
}

-- npm i -g vscode-langservers-extracted
nvim_lsp.html.setup {}

nvim_lsp.eslint.setup {
  -- on_attach = function(client)
  -- local group = vim.api.nvim_create_augroup("Eslint", {})
  -- vim.api.nvim_create_autocmd("BufWritePre", {
  --   group = group,
  --   pattern = "*.ts,*.tsx,*.js",
  --   command = "EslintFixAll",
  --   desc = "Run eslint when saving buffer.",
  -- })
  -- end,
  capabilities = capabilities, -- declared elsewhere
}

nvim_lsp.rust_analyzer.setup {}

local cmp = require("cmp")
local lspkind = require("lspkind")
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end
cmp.setup {
  sources = {
    { name = "nvim_lsp",               priority = 8 },
    { name = "buffer",                 priority = 6 },
    { name = "nvim_lua",               priority = 6 },
    { name = "path" },
    { name = 'nvim_lsp_signature_help' }
  },
  snippet = {
    expand =
        function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end,
  },
  sorting = {
    priority_weight = 2.0,
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.locality,
      cmp.config.compare.kind,
      -- compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
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
              })[entry.source.name]
          return vim_item
        end
      }
    )
  },
  mapping = {
    ['<Tab>'] = function(fallback)
      if not cmp.select_next_item() then
        if vim.bo.buftype ~= 'prompt' and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if not cmp.select_prev_item() then
        if vim.bo.buftype ~= 'prompt' and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,
    ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { 'i' }),
    ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { 'i' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<CR>'] = function(fallback)
      if cmp.visible() then
        cmp.confirm()
      else
        fallback()
      end
    end
  }
}

local signs = { "Error", "Warn", "Hint", "Info" }
for _, type in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = "▊ ", texthl = hl, numhl = hl })
end

vim.g.completion_matching_strategy_list = { "exact", "substring", "fuzzy" }
vim.opt.completeopt = "menu,menuone,noselect"

local function format_file()
  local current_path = vim.fn.expand("%")
  if string.find(current_path, ".tsx?$") == nil then
    vim.lsp.buf.format()
  else
    vim.cmd(":EslintFixAll")
  end
end

vim.keymap.set("n", "<leader>f", format_file, { silent = true })
vim.keymap.set("n", "gd", function() vim.lsp.buf.references() end, { silent = true })
vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, { silent = true })
vim.keymap.set("n", "gR", function() vim.lsp.buf.rename() end)
vim.keymap.set("n", "gr", function() require 'telescope.builtin'.lsp_references({ cwd = vim.fn.expand('%:h') }) end)
-- vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references({cwd: utils.buffer_dir()})<cr>")
vim.keymap.set("n", "<leader>e", function() vim.diagnostic.goto_next() end, { silent = true })
vim.keymap.set("n", "<leader>cd", function() vim.diagnostic.show_line_diagnostics() end, { silent = true })
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { silent = true })
vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end)
