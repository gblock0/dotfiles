return
{
  "folke/noice.nvim",
  opts =
  {
    messages = {
      -- Messages shown by lsp servers
      enabled = false,
    },
    cmdline = {
      format = {
        search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
        search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
      },
    },
    views = {
      notify = {
        position = "90%",                             -- Set the position to bottom right
        -- Optional: You can customize the size, border, and other properties
        size = { width = "auto", height = "auto" },   -- Example size settings
        border = "double",                            -- Example border style
      },
    },
    -- presets = {
    --   lsp_doc_border = true, -- add a border to hover docs and signature help
    -- },
    -- messages = {
    --   enabled = false
    -- },
    -- lsp = {
    --   progress = {
    --     enabled = false
    --   },
    --   filter = {
    --     { event = "msg_show", kind = "lsp",             hide = true },
    --     -- You might need to specify other kinds of LSP messages you want to hide
    --     -- For example, for diagnostic messages:
    --     { event = "msg_show", kind = "lsp_diagnostics", hide = true },
    --   },
    --   -- routes = {
    --   --   { filter = { event = "msg_show", kind = "echo" },          opts = { skip = false } },
    --   --   { filter = { event = "msg_show", kind = "echomsg" },       opts = { skip = false } },
    --   --   { filter = { event = "msg_show", kind = "echoerr" },       opts = { skip = false } },
    --   --   { filter = { event = "msg_show", kind = "lua_error" },     opts = { skip = false } },
    --   --   { filter = { event = "msg_show", kind = "rpc_error" },     opts = { skip = false } },
    --   --   { filter = { event = "msg_show", kind = "return_prompt" }, opts = { skip = false } },
    --   --   { filter = { event = "msg_show", kind = "wmsg" },          opts = { skip = false } },
    --   --   -- Disable noice for other message types
    --   --   { filter = { event = "msg_show" },                         opts = { skip = true } },
    --   -- },
    -- },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  }
}
