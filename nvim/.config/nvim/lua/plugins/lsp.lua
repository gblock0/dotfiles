-- Infers the full executable path based on shell command name
local read_exec_path = function(exec_name)
  local handle = io.popen("which " .. exec_name)
  if handle ~= nil then
    local result = handle:read("*a"):gsub("\n", "")
    handle:close()
    return result
  end

  return ""
end

local servers = {
  bashls = {
    -- bash
  },
  cssls = {
    -- css
  },
  cssmodules_ls = {
    -- css modules
  },
  dockerls = {
    -- docker
  },
  docker_compose_language_service = {
    -- docker compose
  },
  eslint = {
    -- eslint
  },
  jsonls = {
    -- json
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
  },
  lua_ls = {
    -- lua
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      diagnostics = {
        globals = { "vim" }
      }
    },
  },
  html = {
    -- html
  },
  marksman = {
    -- markdown
  },
  pyright = {
    -- python
    python = {
      -- Use the locally available python executable. Enables using pyright from an activated venv.
      pythonPath = read_exec_path("python"),
    },
  },
  rust_analyzer = {
    -- rust
    -- to enable rust-analyzer settings visit:
    -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      checkOnSave = {
        allFeatures = true,
        command = "clippy",
      },
    },
  },
  taplo = {
    -- toml
  },
  terraformls = {
    -- teraform
  },
  vimls = {
    -- vim
  },
  yamlls = {
    -- yaml
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

local signs = { "Error", "Warn", "Hint", "Info" }
for _, type in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = "▊ ", texthl = hl, numhl = hl })
end

return {
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {}
  },
  "nvim-lua/lsp-status.nvim",
  {
    "neovim/nvim-lspconfig",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      local cmp = require("cmp")
      local lspkind = require("lspkind")

      -- LSP
      -- This function gets run when an LSP connects to a particular buffer.
      local on_attach = function(_, bufnr)
        local nmap = function(keys, func, desc)
          if desc then
            desc = "LSP: " .. desc
          end

          set_nmap(keys, func, desc, bufnr)
        end

        local function format_file()
          local current_path = vim.fn.expand("%")
          if string.find(current_path, ".tsx?$") == nil then
            vim.lsp.buf.format()
          else
            vim.cmd(":EslintFixAll")
          end
        end

        nmap("<leader>f", format_file, "[F]ormat file")

        nmap("<leader>gR", vim.lsp.buf.rename, "[R]ename")
        nmap("<leader>ca", vim.lsp.buf.code_action, "Code [A]ction")

        nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
        nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
        nmap("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
        nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")

        -- See `:help K` for why this keymap
        nmap("K", vim.lsp.buf.hover, "Hover Documentation")
        -- nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

        -- Lesser used LSP functionality
        nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

        nmap("<leader>e", vim.diagnostic.goto_next, "Go to next diagnostic")

        -- disable tsserver so it does not conflict with prettier
        -- if client.name == "tsserver" then
        --   client.server_capabilities.document_formatting = false
        -- end
      end

      -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      -- Install servers used
      mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(servers),
      })

      local flags = {
        allow_incremental_sync = true,
        debounce_text_changes = 200,
      }

      mason_lspconfig.setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({
            flags = flags,
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
          })
        end,
      })

      cmp.setup({
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
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        mapping = {
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping(cmp.mapping.complete({}), { "i", "c" }),
          ['<CR>'] = function(fallback)
            if cmp.visible() then
              cmp.confirm()
            else
              fallback()
            end
          end,
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { "i", "s" }),
        },
        sources = {
          { name = "nvim_lsp",               priority = 8 },
          { nane = "buffer",                 priority = 7 },
          { name = "path" },
          { name = 'nvim_lsp_signature_help' }
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
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp-signature-help",
    }
  },
  "nvim-lua/lsp_extensions.nvim",
  "onsails/lspkind-nvim",
  {
    "simrat39/rust-tools.nvim",
    config = function()
      local rt = require("rust-tools")
      rt.setup({})
      rt.inlay_hints.enable()
    end
  },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {}
  },
  "williamboman/mason-lspconfig.nvim",

  -- Setup LuaLsp for neovim development
  {
    "folke/neodev.nvim",
    opts = {}
  }
}
