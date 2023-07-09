return {
  "szw/vim-maximizer",
  config = function()
    vim.g.maximizer_set_default_mapping = 0
    set_nmap("<leader>m", "<cmd>MaximizerToggle!<CR>", "Toggle Maximize Buffer")
  end
}
