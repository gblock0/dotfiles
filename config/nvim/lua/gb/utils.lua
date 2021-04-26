local M = {}
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

-- Wrapping around nvim_set_keymap
-- Defaults to noremap, adds `<CMD>` and `<CR>` around rhs
-- @param mode Mode to remap
-- @param lhs Hotkey to map command to
-- @param rhs Command to map to a hotkey
-- @param opts Options
function M.map(mode, lhs, rhs, opts)
  local options = {noremap = true, cmd_cr = false}
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end

  if options.cmd_cr then
    rhs = "<CMD>" .. rhs
  end

  if options.cmd_cr then
    rhs = rhs .. "<CR>"
  end

  options.cmd_cr = nil
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function M.opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= "o" then
    scopes["o"][key] = value
  end
end

return M
