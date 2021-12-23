
vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.expandtab = false

-- Delve debugger key bindings
vim.api.nvim_set_keymap('n', 'dp', ':DlvToggleBreakpoint<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'dt', ':DlvToggleTracepoint<CR>', { noremap = true, silent = true })

