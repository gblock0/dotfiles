return {
  "voldikss/vim-floaterm",
  config = function()
    vim.api.nvim_set_var("floaterm_width", 0.9)
    vim.api.nvim_set_var("floaterm_height", 0.9)

    set_nmap("<C-g>", "<cmd>FloatermToggle<CR>")
    vim.keymap.set("t", "<C-g>", "<C-\\><C-n><cmd>FloatermToggle<CR>")
  end
}
