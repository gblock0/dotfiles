return
{
  "folke/noice.nvim",
  config = function()
    require("noice").setup({
      cmdline = {
        format = {
          search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
          search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
        },
      },
      presets = {
        lsp_doc_border = true,   -- add a border to hover docs and signature help
      },
      messages = {
        enabled = false
      },
      lsp = {
        progress = {
          enabled = false
        }
      }
    })
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  }
}
