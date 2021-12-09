local keymap = require("gb.utils").map
-- keymap("n", "<leader>da", ":call vimspector#Launch()<CR>")
-- keymap("n", "<leader>dd", ":TestNearest -strategy=jest<CR>")
-- keymap("n", "<leader>dc", ":call GotoWindow(g:vimspector_session_windows.code)<CR>")
-- keymap("n", "<leader>dv", ":call GotoWindow(g:vimspector_session_windows.variables)<CR>")
-- keymap("n", "<leader>dw", ":call GotoWindow(g:vimspector_session_windows.watches)<CR>")
-- keymap("n", "<leader>ds", ":call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>")
-- keymap("n", "<leader>do", ":call GotoWindow(g:vimspector_session_windows.output)<CR>")
-- keymap("n", "<leader>d?", ":call AddToWatch()<CR>")
-- keymap("n", "<leader>dx", ":call vimspector#Reset()<CR>")
-- keymap("n", "<leader>dX", ":call vimspector#ClearBreakpoints()<CR>")
-- keymap("n", "<S-h>", ":call vimspector#StepOut()<CR>")
-- keymap("n", "<S-l>", ":call vimspector#StepInto()<CR>")
-- keymap("n", "<S-j>", ":call vimspector#StepOver()<CR>")
-- keymap("n", "<leader>d_", ":call vimspector#Restart()<CR>")
-- keymap("n", "<leader>dn", ":call vimspector#Continue()<CR>")
-- keymap("n", "<leader>drc", ":call vimspector#RunToCursor()<CR>")
-- keymap("n", "<leader>dh", ":call vimspector#ToggleBreakpoint()<CR>")
-- keymap("n", "<leader>de", ":call vimspector#ToggleConditionalBreakpoint()<CR>")
-- vim.g.vimspector_base_dir = vim.fn.expand("$HOME/.config/nvim/vimspector-config")
-- vim.g.vimspector_sidebar_width = 120
-- vim.g.vimspector_bottombar_height = 10

local dap = require("dap")
dap.adapters.node2 = {
  type = "executable",
  command = "node",
  args = {os.getenv("HOME") .. "/src/vscode-node-debug2/out/src/nodeDebug.js"}
}
dap.defaults.fallback.terminal_win_cmd = "80vsplit new"

vim.fn.sign_define("DapBreakpoint", {text = "🟥", texthl = "", linehl = "", numhl = ""})
vim.fn.sign_define("DapBreakpointRejected", {text = "🟦", texthl = "", linehl = "", numhl = ""})
vim.fn.sign_define("DapStopped", {text = "⭐️", texthl = "", linehl = "", numhl = ""})
keymap("n", "<leader>da", "lua require'gb.debugHelper'.attach()", {silent = true, cmd_cr = true})
keymap("n", "<leader>dx", "lua require('dap').terminate()", {silent = true, cmd_cr = true})
keymap("n", "<S-h>", "lua require('dap').step_out()", {silent = true, cmd_cr = true})
keymap("n", "<S-l>", "lua require('dap').step_into()", {silent = true, cmd_cr = true})
keymap("n", "<S-j>", "lua require('dap').step_over()", {silent = true, cmd_cr = true})
keymap("n", "<leader>dh", "lua require('dap').toggle_breakpoint()", {silent = true, cmd_cr = true})
keymap("n", "<leader>dn", "lua require('dap').continue()", {silent = true, cmd_cr = true})
keymap("n", "<leader>drc", "lua require('dap').run_to_cursor()", {silent = true, cmd_cr = true})
require("telescope").load_extension("dap")
keymap("n", "<leader>ds", "Telescope dap frames", {silent = true, cmd_cr = true})
keymap("n", "<leader>db", "Telescope dap list_breakpoints", {silent = true, cmd_cr = true})
keymap("n", "<leader>di", 'lua require"dap.ui.widgets".hover()', {silent = true, cmd_cr = true})
keymap(
  "n",
  "<leader>d?",
  'lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)',
  {silent = true, cmd_cr = true}
)

vim.g.dap_virtual_text = true

require("nvim-dap-virtual-text").setup()
