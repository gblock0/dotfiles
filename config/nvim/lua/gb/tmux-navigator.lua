vim.g.tmux_navigator_no_mappings = 1

vim.keymap.set("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>", {silent = true})
vim.keymap.set("n", "<c-j>", "<cmd>TmuxNavigateDown<cr>", {silent = true})
vim.keymap.set("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>", {silent = true})
vim.keymap.set("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>", {silent = true})
