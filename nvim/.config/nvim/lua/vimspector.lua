local keymap = vim.api.nvim_set_keymap
keymap('n', '<leader>da', ':call vimspector#Launch()<CR>', {noremap = true})
keymap('n', '<leader>dd', ':TestNearest -strategy=jest<CR>', {noremap = true})
keymap('n', '<leader>dc', ':call GotoWindow(g:vimspector_session_windows.code)<CR>', {noremap = true})
keymap('n', '<leader>dv', ':call GotoWindow(g:vimspector_session_windows.variables)<CR>', {noremap = true})
keymap('n', '<leader>dw', ':call GotoWindow(g:vimspector_session_windows.watches)<CR>', {noremap = true})
keymap('n', '<leader>ds', ':call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>', {noremap = true})
keymap('n', '<leader>do', ':call GotoWindow(g:vimspector_session_windows.output)<CR>', {noremap = true})
keymap('n', '<leader>d?', ':call AddToWatch()<CR>', {noremap = true})
keymap('n', '<leader>dx', ':call vimspector#Reset()<CR>', {noremap = true})
keymap('n', '<leader>dX', ':call vimspector#ClearBreakpoints()<CR>', {noremap = true})
keymap('n', '<S-h>', ':call vimspector#StepOut()<CR>', {noremap = true})
keymap('n', '<S-l>', ':call vimspector#StepInto()<CR>', {noremap = true})
keymap('n', '<S-j>', ':call vimspector#StepOver()<CR>', {noremap = true})
keymap('n', '<leader>d_', ':call vimspector#Restart()<CR>', {noremap = true})
keymap('n', '<leader>dn', ':call vimspector#Continue()<CR>', {noremap = true})
keymap('n', '<leader>drc', ':call vimspector#RunToCursor()<CR>', {noremap = true})
keymap('n', '<leader>dh', ':call vimspector#ToggleBreakpoint()<CR>', {noremap = true})
keymap('n', '<leader>de', ':call vimspector#ToggleConditionalBreakpoint()<CR>', {noremap = true})
vim.g.vimspector_base_dir = vim.fn.expand('$HOME/.config/nvim/vimspector-config')
vim.g.vimspector_sidebar_width = 120
vim.g.vimspector_bottombar_height = 10

