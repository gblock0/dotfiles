return {
  "kevinhwang91/nvim-hlslens",
  config = function()
    require("hlslens").setup()
    vim.keymap.set("", "n", "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>",
      { silent = true })
    vim.keymap.set("", "N", "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>",
      { silent = true })
    vim.keymap.set("", "*", "*<Cmd>lua require('hlslens').start()<CR>")
    vim.keymap.set("", "#", "#<Cmd>lua require('hlslens').start()<CR>")
    vim.keymap.set("", "g*", "g*<Cmd>lua require('hlslens').start()<CR>")
    vim.keymap.set("", "g#", "g#<Cmd>lua require('hlslens').start()<CR>")
  end
}
