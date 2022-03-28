-- Testing helpers
local keymap = require("gb.utils").map
local jest_opts = "{path_to_jest = 'node_modules/.bin/jest --selectProjects unitTests',terminal_cmd = ':below split | terminal'}"
keymap("n", "<leader>tt", "lua require('jester').run(" .. jest_opts .. ")", {silent = true, cmd_cr = true})
keymap("n", "<leader>tf", "lua require('jester').run_file(" .. jest_opts .. ")", {silent = true, cmd_cr = true})
keymap("n", "<leader>td", "lua require('jester').debug(" .. jest_opts .. ")", {silent = true, cmd_cr = true})

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

keymap("n", "<leader>ts", ":lua go_to_test_file()<CR>", {silent = true})
keymap("n", "<leader>tw", ':lua go_to_test_file("v")<CR>', {silent = true})
