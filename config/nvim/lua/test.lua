-- Testing helpers
local keymap = vim.api.nvim_set_keymap
keymap('n', '<leader>tt', ':TestNearest<CR>', { noremap = true})
keymap('n', '<leader>tf', ':TestFile<CR>', { noremap = true})

function _G.go_to_test_file(typeOfSplit)
  local testFilePath = string.gsub(vim.fn.expand('%'), '.ts$', '.test.ts')
  if typeOfSplit == 'v' then
    return vim.api.nvim_command(':rightbelow vsplit '..testFilePath)
  else
    return vim.api.nvim_command(':below split '..testFilePath)
  end

end

keymap('n', '<leader>ts', ':lua go_to_test_file()<CR>', {noremap = true, silent = true})
keymap('n', '<leader>tw', ':lua go_to_test_file("v")<CR>', {noremap = true, silent = true})
