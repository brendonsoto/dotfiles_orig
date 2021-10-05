local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local env = vim.env
local g = vim.g
local set = vim.opt -- to set options

vim.api.nvim_exec([[
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
]], false)

-- Colours!!
cmd 'source ~/.config/nvim/theme.vim'
-- Autoconfig
cmd 'source ~/.config/nvim/autocmds.vim'
-- Lightline specific
cmd 'source ~/.config/nvim/lightline.vim'

set.clipboard:append('unnamedplus') -- Use the clipboard register + in addition to the default
set.completeopt = {'menu', 'menuone', 'noselect'}
set.expandtab = true
set.hidden = true
set.history = 50
set.ignorecase = true
set.inccommand = "split"
set.joinspaces = false
set.linebreak = true
set.list = true
set.modeline = false
set.mouse = "a"
set.number = true
set.path = "$PWD/**"
set.relativenumber = true
set.scrolloff = 4
set.shiftround = true
set.shiftwidth = 2
set.shiftwidth = 2
set.showmatch = true
set.smartcase = true
set.smartindent = true
set.splitbelow = true
set.splitright = true
set.swapfile = false
set.tabstop = 2
set.termguicolors = true
set.undofile = true
set.undolevels = 100
set.undoreload = 1000
