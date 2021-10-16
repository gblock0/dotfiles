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

nvim_lsp.vimls.setup {}

--must have run: npm install -g typescript
nvim_lsp.tsserver.setup {
  -- This makes sure tsserver is not used for formatting
  -- on_attach = nvim_lsp.tsserver_on_attach,
  on_attach = function(client)
    if client.config.flags then
      client.config.flags.allow_incremental_sync = true
    end
    client.resolved_capabilities.document_formatting = false
    require "lsp_signature".on_attach()
  end,
  capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  root_dir = nvim_lsp.util.root_pattern("tsconfig.json", ".git"),
  settings = {documentFormatting = false},
  on_init = custom_on_init
}

nvim_lsp.rust_analyzer.setup {}

--must run: npm install -g pyright
nvim_lsp.pyright.setup {
  on_init = custom_on_init,
  on_attach = function(client)
    require "lsp_signature".on_attach()
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
  on_init = custom_on_init
}

-- npm i -g vscode-langservers-extracted
nvim_lsp.html.setup {
  on_init = custom_on_init
}

nvim_lsp.eslint.setup {}

local cmp = require("cmp")
cmp.setup {
  sources = {
    {name = "nvim_lsp"},
    {name = "buffer"},
    {name = "nvim_lua"},
    {name = "path"},
    {name = "vsnip"}
  },
  snippet = {
    expand = function(args)
      -- For `vsnip` user.
      vim.fn["vsnip#anonymous"](args.body)
    end
  },
  formatting = {
    format = function(entry, vim_item)
      -- fancy icons and a name of kind
      vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
      -- set a name for each source
      vim_item.menu =
        ({
        buffer = "   (Buffer)",
        nvim_lsp = "   (LSP)",
        nvim_lua = "[Lua]"
      })[entry.source.name]
      return vim_item
    end
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

vim.g.vsnip_snippet_dir = vim.fn.stdpath "config" .. "/snippets"

vim.fn.sign_define("LspDiagnosticsSignError", {text = "▊"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "▊"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "▊"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "▊"})

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

keymap("n", "gd", "lua vim.lsp.buf.definition()", {silent = true, cmd_cr = true})
keymap("n", "gR", "lua vim.lsp.buf.rename()", {cmd_cr = true})
keymap("n", "gr", "LspTrouble lsp_references", {cmd_cr = true})
keymap("n", "<leader>e", "lua vim.lsp.diagnostic.goto_next()", {silent = true, cmd_cr = true})
keymap("n", "<leader>cd", "lua vim.lsp.diagnostic.show_line_diagnostics()", {silent = true, cmd_cr = true})
keymap("n", "K", "lua vim.lsp.buf.hover()", {silent = true, cmd_cr = true})
