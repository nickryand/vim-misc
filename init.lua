if vim.fn.filereadable("~/.config/nvim/plugins.lua") == 0 then
  require('plugins')
end

-- Map leader to space
vim.g.mapleader = " "

-- tab configuration
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- search settings
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true

-- Other options
vim.opt.number = true
vim.opt.autoread = true
vim.opt.backspace = "2"
vim.opt.hidden = true
vim.opt.laststatus = 2
vim.opt.list = true
vim.opt.listchars = { tab = '› ', eol = '¬', trail = '⋅' }
vim.opt.ruler = true
vim.opt.scrolloff = 999
vim.opt.showmatch = true
vim.opt.showmode = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.title = true
vim.opt.visualbell = true

-- Cleanup Whitespace
vim.api.nvim_command([[ autocmd BufWritePre * :%s/\s\+$//e ]])

-- Window reize management
-- noremap <C-w>+ :resize +5<CR>
-- noremap <C-w>- :resize -5<CR>
-- noremap <C-w>< :vertical:resize -5<CR>
-- noremap <C-w>> :vertical:resize +5<CR>
vim.api.nvim_set_keymap('n', '<C-w>-', ':resize -5<CR>',  { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-w>+', ':resize +5<CR>',  { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-w><', ':vertical:resize -5<CR>',  { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-w>>', ':vertical:resize +5<CR>',  { noremap = true, silent = true})

-- Setup backup, swap and undo directories
local data_path = vim.fn.stdpath('data')
for index, directory in pairs({'backup', 'swap', 'undo'})
do
    local path = data_path .. '/' .. directory
    if vim.fn.isdirectory(path) == 0 then
       vim.fn.mkdir(path, "p", "0700")
    end
end
vim.opt.backupdir = data_path .. '/backup'
vim.opt.directory = data_path .. '/swap'
vim.opt.undodir = data_path .. '/undo'
vim.opt.backup = true
vim.opt.undofile = true
vim.opt.writebackup = true

-- Setup vscode theme
vim.g.vscode_style = "dark"
vim.cmd([[colorscheme vscode]])

-- Bufferline Configuration with buffer navigation bindings
require('bufferline').setup{
    options = {
        numbers = "buffer_id",
        diagnostics = "nvim_lsp",
        offsets = {{filetype = "NvimTree", text = "File Explorer"}},
        show_close_icon = false,
    },
}
vim.api.nvim_set_keymap('n', 'bn', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'bp', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'mn', ':BufferLineMoveNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'mp', ':BufferLineMovePrev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'Bp', ':BufferLinePick<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'Bc', ':BufferLinePickClose<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'Br', ':BufferLineCloseRight<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'Bl', ':BufferLineCloseLeft<CR>', { noremap = true, silent = true })

-- nvim-tree
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_root_folder_modifier = ':~'
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_disable_window_picker = 1
vim.g.nvim_tree_icon_padding = ' '
vim.g.nvim_tree_window_picker_exclude = { filetype = {'packer', 'qf'}, buftype = {'terminal'} }
vim.g.nvim_tree_special_files = {}
vim.g.nvim_tree_special_files["README.md"] = 1
vim.g.nvim_tree_special_files["Makefile"] = 1
vim.g.nvim_tree_special_files["MAKEFILE"] = 1
require('nvim-tree').setup {
  follow = true,
  open_on_tab = true,
  auth_close = true,
  ignore_ft_on_setup = { 'startify', 'dashboard' },
  view = {
    width = 30,
  },
  update_to_buf_dir = {
    enable = true,
    auto_open = true,
  },
  git = {
    enable = true,
    ignore = true,
  },
  update_cwd = true,
}
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>r', ':NvimTreeRefresh<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>n', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
vim.opt.termguicolors = true
vim.cmd([[highlight NvimTreeFolderIcon guibg=blue]])

-- Comment setup and bindings
require('nvim_comment').setup({comment_empty = false})

-- tree-sitter
-- require('nvim-treesitter.configs').setup({
-- })
