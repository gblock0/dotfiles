local centerpad = require("centerpad")
vim.keymap.set("n", "<leader>ct", function ()  centerpad.toggle({ leftpad = 50, rightpad = 50 }) end, {silent = true, noremap = true} )
