keymap = require('nutils').map

require('gitsigns').setup({
  watch_index = {
    interval = 100
  },
})

keymap('n', '<leader>g', ':vertical Git<CR>')
