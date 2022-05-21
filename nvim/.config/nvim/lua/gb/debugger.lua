-- vim.keymap.set("n", "<leader>da", ":call vimspector#Launch()<CR>")
-- vim.keymap.set("n", "<leader>dd", ":TestNearest -strategy=jest<CR>")
-- vim.keymap.set("n", "<leader>dc", ":call GotoWindow(g:vimspector_session_windows.code)<CR>")
-- vim.keymap.set("n", "<leader>dv", ":call GotoWindow(g:vimspector_session_windows.variables)<CR>")
-- vim.keymap.set("n", "<leader>dw", ":call GotoWindow(g:vimspector_session_windows.watches)<CR>")
-- vim.keymap.set("n", "<leader>ds", ":call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>")
-- vim.keymap.set("n", "<leader>do", ":call GotoWindow(g:vimspector_session_windows.output)<CR>")
-- vim.keymap.set("n", "<leader>d?", ":call AddToWatch()<CR>")
-- vim.keymap.set("n", "<leader>dx", ":call vimspector#Reset()<CR>")
-- vim.keymap.set("n", "<leader>dX", ":call vimspector#ClearBreakpoints()<CR>")
-- vim.keymap.set("n", "<S-h>", ":call vimspector#StepOut()<CR>")
-- vim.keymap.set("n", "<S-l>", ":call vimspector#StepInto()<CR>")
-- vim.keymap.set("n", "<S-j>", ":call vimspector#StepOver()<CR>")
-- vim.keymap.set("n", "<leader>d_", ":call vimspector#Restart()<CR>")
-- vim.keymap.set("n", "<leader>dn", ":call vimspector#Continue()<CR>")
-- vim.keymap.set("n", "<leader>drc", ":call vimspector#RunToCursor()<CR>")
-- vim.keymap.set("n", "<leader>dh", ":call vimspector#ToggleBreakpoint()<CR>")
-- vim.keymap.set("n", "<leader>de", ":call vimspector#ToggleConditionalBreakpoint()<CR>")
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
vim.keymap.set("n", "<leader>da", function() require'gb.debugHelper'.attach() end, {silent = true})
vim.keymap.set("n", "<leader>dx", function() require('dap').terminate() end, {silent = true})
vim.keymap.set("n", "<S-h>", function() require('dap').step_out() end, {silent = true})
vim.keymap.set("n", "<S-l>", function() require('dap').step_into() end, {silent = true})
vim.keymap.set("n", "<S-j>", function() require('dap').step_over() end, {silent = true})
vim.keymap.set("n", "<leader>dh", function() require('dap').toggle_breakpoint() end, {silent = true})
vim.keymap.set("n", "<leader>dn", function () require('dap').continue() end, {silent = true})
vim.keymap.set("n", "<leader>drc", function() require('dap').run_to_cursor() end, {silent = true})
require("telescope").load_extension("dap")
vim.keymap.set("n", "<leader>ds", "<cmd>Telescope dap frames<cr>", {silent = true})
vim.keymap.set("n", "<leader>db", "<cmd>Telescope dap list_breakpoints<cr>", {silent = true})
vim.keymap.set("n", "<leader>di", function() require"dap.ui.widgets".hover() end, {silent = true})
vim.keymap.set(
  "n",
  "<leader>d?",
  function() local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes) end,
  {silent = true}
)

vim.g.dap_virtual_text = true

require("nvim-dap-virtual-text").setup()
