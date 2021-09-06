-- autocmd BufWritePost set in init.vim
local keymap = require("gb.utils").map

local prettierCmd = "npx prettier --config .prettierrc -w"
local tempfile_dir = vim.fn.expand("~/.formatter-nvim-tmp-files")

local onlyPrettierCmdOpts = {
  {
    cmd = {
      prettierCmd
    },
    tempfile_dir = tempfile_dir
  }
}

local tsJsCmdOpts = {
  {
    cmd = {
      prettierCmd,
      "eslint_d --fix"
    },
    tempfile_dir = tempfile_dir
  }
}

require "format".setup {
  ["*"] = {
    {
      cmd = {
        -- remove trailing whitespace
        "sed -i 's/[ \t]*$//'"
      },
      tempfile_dir = tempfile_dir
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
  json = onlyPrettierCmdOpts,
  html = onlyPrettierCmdOpts,
  markdown = {
    {
      cmd = {
        prettierCmd
      },
      tempfile_dir = tempfile_dir
    },
    {
      cmd = {prettierCmd},
      tempfile_dir = tempfile_dir,
      start_pattern = "^```json$",
      end_pattern = "^```$",
      target = "current"
    },
    {
      cmd = {prettierCmd},
      tempfile_dir = tempfile_dir,
      start_pattern = "^```typescript$",
      end_pattern = "^```$",
      target = "current"
    }
  },
  rust = {
    {
      cmd = {"rustfmt"},
      tempfile_dir = tempfile_dir
    }
  }
}

keymap("n", "<leader>f", "Format", {silent = true, cmd_cr = true})
keymap("n", "<leader>F", "FormatWrite", {silent = true, cmd_cr = true})
