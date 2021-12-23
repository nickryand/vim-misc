-- Setup the proper file detection
--
vim.cmd("au BufNewFile,BufRead *.tf           set filetype=terraform syntax=hcl")

vim.bo.shiftwidth = 2
vim.bo.tabstop = 2
vim.bo.softtabstop = 2
vim.bo.expandtab = true

