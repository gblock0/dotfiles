local winbar_settings = {
  lualine_a = {
    {
      'filename',
      symbols = {
        modified = '',      -- Text to show when the file is modified.
        readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
        unnamed = '[No Name]', -- Text to show for unnamed buffers.
        newfile = '[New]',     -- Text to show for newly created file before first write
      }
    }
  }
}

require('lualine').setup({
  options = {
    globalstatus = true,
    section_separators = { left = ' ', right = ' '},
  },
  sections = {
    lualine_c = {},
    lualine_x = {
      function()
        local clients = {}
        for _, client in pairs(vim.lsp.buf_get_clients(0)) do
          clients[#clients + 1] = client.name
        end

        return table.concat(clients, ' '), ' '
      end
    },
  },
  inactive_winbar = winbar_settings,
  winbar = winbar_settings
})
