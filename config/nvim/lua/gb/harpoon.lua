require("harpoon").setup()

vim.keymap.set("n", "<leader>h", function() require('harpoon.mark').add_file() end, {silent = true})
vim.keymap.set("n", "<C-t>", function() require('harpoon.ui').toggle_quick_menu() end, {silent = true})
vim.keymap.set("n", "<leader>tc", function() require('harpoon.cmd-ui').toggle_quick_menu() end, {silent = true})

vim.keymap.set("n", "<C-f>", function() require('harpoon.ui').nav_file(1) end, {silent = true})
vim.keymap.set("n", "<C-d>", function() require('harpoon.ui').nav_file(2) end, {silent = true})
vim.keymap.set("n", "<C-s>", function() require('harpoon.ui').nav_file(3) end, {silent = true})
vim.keymap.set("n", "<C-a>", function() require('harpoon.ui').nav_file(4) end, {silent = true})

-- nnoremap <silent><leader>tu :lua require("harpoon.term").gotoTerminal(1)<CR>
-- nnoremap <silent><leader>te :lua require("harpoon.term").gotoTerminal(2)<CR>
-- nnoremap <silent><leader>cu :lua require("harpoon.term").sendCommand(1, 1)<CR>
-- nnoremap <silent><leader>ce :lua require("harpoon.term").sendCommand(1, 2)<CR>
