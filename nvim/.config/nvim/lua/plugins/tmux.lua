return {
  {
    "christoomey/vim-tmux-navigator",

    config = function()
      vim.g.tmux_navigator_no_mappings = 1

      set_nmap("<c-h>", "<cmd>TmuxNavigateLeft<cr>")
      set_nmap("<c-j>", "<cmd>TmuxNavigateDown<cr>")
      set_nmap("<c-k>", "<cmd>TmuxNavigateUp<cr>")
      set_nmap("<c-l>", "<cmd>TmuxNavigateRight<cr>")
    end
  },
  -- Tmux Plugins
  "tmux-plugins/vim-tmux-focus-events",
  -- Allows navigation between vim and tmux
  "christoomey/vim-tmux-navigator",
}
