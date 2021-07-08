local keymap = vim.api.nvim_set_keymap

require("kommentary.config").configure_language(
  "default",
  {
    prefer_single_line_comments = true
  }
)

require("kommentary.config").configure_language(
  "typescriptreact",
  {
    single_line_comment_string = "auto",
    multi_line_comment_strings = "auto",
    hook_function = function()
      require("ts_context_commentstring.internal").update_commentstring()
    end
  }
)
vim.g.kommentary_create_default_mappings = 0

--vim.g.NERDSpaceDelims = 1
--keymap('n', '<leader>ci', ':<plug>NERDCommenterToggle<CR>', {noremap = true})
keymap("n", "<leader>ci", "<Plug>kommentary_line_default", {})
keymap("v", "<leader>ci", "<Plug>kommentary_visual_default", {})
