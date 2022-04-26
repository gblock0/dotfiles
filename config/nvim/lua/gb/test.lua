-- Testing helpers
local jest_opts = {path_to_jest = 'node_modules/.bin/jest --selectProjects unitTests',terminal_cmd = ':below split | terminal'}
vim.keymap.set("n", "<leader>tt", function () require('jester').run(jest_opts) end, {silent = true})
vim.keymap.set("n", "<leader>tf", function () require('jester').run_file(jest_opts) end, {silent = true})
vim.keymap.set("n", "<leader>td", function () require('jester').debug(jest_opts) end, {silent = true})

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
