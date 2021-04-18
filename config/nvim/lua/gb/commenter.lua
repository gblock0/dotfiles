local keymap = vim.api.nvim_set_keymap

require("kommentary.config").configure_language(
  "default",
  {
    prefer_single_line_comments = true
  }
)
vim.g.kommentary_create_default_mappings = 0

--vim.g.NERDSpaceDelims = 1
--keymap('n', '<leader>ci', ':<plug>NERDCommenterToggle<CR>', {noremap = true})
keymap("n", "<leader>ci", "<Plug>kommentary_line_default", {})
keymap("v", "<leader>ci", "<Plug>kommentary_visual_default", {})
