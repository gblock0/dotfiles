-- autocmd BufWritePost set in init.vim
local keymap = require("gb.utils").map

local prettierCmd = "prettier -w"

local onlyPrettierCmdOpts = {
  {
    cmd = {
      prettierCmd
    }
  }
}

local tsJsCmdOpts = {
  {
    cmd = {
      prettierCmd,
      "./node_modules/.bin/eslint_d --fix"
    }
  }
}

require "format".setup {
  ["*"] = {
    {
      cmd = {
        -- remove trailing whitespace
        "sed -i 's/[ \t]*$//'"
      }
    }
  },
  lua = {
    {
      cmd = {
        function(file)
          return string.format("luafmt -l 120 -i 2 -w replace %s", file)
        end
      }
    }
  },
  typescript = tsJsCmdOpts,
  typescriptreact = tsJsCmdOpts,
  javascript = tsJsCmdOpts,
  scss = onlyPrettierCmdOpts,
  css = onlyPrettierCmdOpts,
  html = onlyPrettierCmdOpts,
  markdown = onlyPrettierCmdOpts,
  rust = {
    {
      cmd = {"rustfmt"}
    }
  }
}
