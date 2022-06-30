-- Testing helpers
local jester = require('jester');
jester.setup({
  path_to_jest_run = 'node_modules/.bin/jest',
  terminal_cmd = ':below split | terminal'
})
vim.keymap.set("n", "<leader>tt", function () jester.run() end)
vim.keymap.set("n", "<leader>tf", function () jester.run_file() end)
vim.keymap.set("n", "<leader>td", function () jester.debug() end)

function _G.go_to_test_file(typeOfSplit)
  local current_path = vim.fn.expand("%")
  if string.find(current_path, ".ts$") == nil then
    print "Only TS files are supported"
    return
  end
  local is_test_file = string.find(current_path, ".test.ts$") ~= nil
  local test_file_path = string.gsub(current_path, ".ts$", ".test.ts")
  local vsplit_command = "vsplit "
  local split_command = "below split "
  if is_test_file then
    test_file_path = string.gsub(current_path, ".test.ts$", ".ts")
    vsplit_command = "vsplit "
    split_command = "below "
  end

  if typeOfSplit == "v" then
    return vim.api.nvim_command(":" .. vsplit_command .. test_file_path)
  else
    return vim.api.nvim_command(":" .. split_command .. test_file_path)
  end
end

vim.keymap.set("n", "<leader>ts", ":lua go_to_test_file()<CR>", {silent = true})
vim.keymap.set("n", "<leader>tw", ':lua go_to_test_file("v")<CR>', {silent = true})
