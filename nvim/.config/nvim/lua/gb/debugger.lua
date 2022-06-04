local dap = require("dap")
local dapui = require("dapui").setup()
require("telescope").load_extension("dap")
require("nvim-dap-virtual-text").setup()
local function attach()
  print("attaching")
  dap.run(
    {
      type = "node2",
      request = "attach",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      skipFiles = {"<node_internals>/**/*.js"}
    }
  )
end

local function debugJest(testName, filename)
  print("starting " .. testName .. " in " .. filename)
  dap.run(
    {
      type = "node2",
      request = "launch",
      cwd = vim.fn.getcwd(),
      runtimeArgs = {"--inspect-brk", "node_modules/.bin/jest", "--no-coverage", "-t", testName, "--", filename},
      sourceMaps = true,
      protocol = "inspector",
      skipFiles = {"<node_internals>/**/*.js"},
      console = "integratedTerminal",
      port = 9229
    }
  )
end

dap.adapters.node2 = {
  type = "executable",
  command = "node",
  args = {os.getenv("HOME") .. "/src/vscode-node-debug2/out/src/nodeDebug.js"}
}

vim.fn.sign_define("DapBreakpoint", {text = "🟥", texthl = "", linehl = "", numhl = ""})
vim.fn.sign_define("DapBreakpointRejected", {text = "🟦", texthl = "", linehl = "", numhl = ""})
vim.fn.sign_define("DapStopped", {text = "⭐️", texthl = "", linehl = "", numhl = ""})
vim.keymap.set("n", "<leader>da", function() attach() end, {silent = true})
vim.keymap.set("n", "<leader>dx", function() require('dap').terminate() end, {silent = true})
vim.keymap.set("n", "<S-h>", function() require('dap').step_out() end, {silent = true})
vim.keymap.set("n", "<S-l>", function() require('dap').step_into() end, {silent = true})
vim.keymap.set("n", "<S-j>", function() require('dap').step_over() end, {silent = true})
vim.keymap.set("n", "<leader>dh", function() require('dap').toggle_breakpoint() end, {silent = true})
vim.keymap.set("n", "<leader>dn", function () require('dap').continue() end, {silent = true})
vim.keymap.set("n", "<leader>db", "<cmd>Telescope dap list_breakpoints<cr>", {silent = true})
vim.keymap.set("n", "<leader>di", function() require"dap.ui.widgets".hover() end, {silent = true})

-- Auto open dap ui when dap is attached
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

