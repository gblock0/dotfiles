local prettierCmd = "./node_modules/.bin/prettier --config .prettierrc --write"
local tempfile_dir = vim.fn.expand("~/.formatter-nvim-tmp-files")
local onlyPrettierCmdOpts = {
  {
    cmd = {
      prettierCmd
    },
    tempfile_dir = tempfile_dir
  }
}

return {

  {
    "lukas-reineke/lsp-format.nvim",
    opts = {
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
          cmd = { prettierCmd },
          tempfile_dir = tempfile_dir,
          start_pattern = "^```json$",
          end_pattern = "^```$",
          target = "current"
        },
        {
          cmd = { prettierCmd },
          tempfile_dir = tempfile_dir,
          start_pattern = "^```typescript$",
          end_pattern = "^```$",
          target = "current"
        }
      },
      rust = {
        {
          cmd = { "rustfmt" },
          tempfile_dir = tempfile_dir
        }
      }
    }
  }
}
