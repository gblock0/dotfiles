-- Swap file handling
return {
  {
    "gioele/vim-autoswap",
    config = function()
      vim.g.autoswap_detect_tmux = 1
    end
  }
}