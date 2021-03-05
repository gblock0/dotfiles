local utils = require 'nutils'
keymap = utils.map
function _G.gb_run_format_and_save()
  vim.cmd('Neoformat')
  vim.cmd('w')
end

keymap('n', '<leader>f', ':lua gb_run_format_and_save()<CR>')
