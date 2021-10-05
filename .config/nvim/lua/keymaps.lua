local g = vim.g
local map = vim.api.nvim_set_keymap

map('n', '<Space>', '', {})
g.mapleader = ' '
options = {noremap = true}

-- Navigation
map('n', '<leader>h', '<C-w>h', options)
map('n', '<leader>j', '<C-w>j', options)
map('n', '<leader>k', '<C-w>k', options)
map('n', '<leader>l', '<C-w>l', options)
map('n', 'j', 'gj', options)
map('n', 'k', 'gk', options)
-- From T-Pope's Unimpaired
map('n', '[b', ':bprev<cr>', options)
map('n', ']b', ':bnext<cr>', options)
map('n', '[t', ':tabp<cr>', options)
map('n', ']t', ':tabn<cr>', options)

-- Easy open, close, and save
map('n', '<leader>e', ':e ', options)
map('n', '<leader>w', ':w<cr>', options)
map('n', '<leader>q', ':q<cr>', options)
map('n', '<leader>Q', ':qa<cr>', options)

-- Copy + Paste
map('n', '<leader>y', 'y "+y', options)
map('n', '<leader>p', 'p "+p', options)

-- Window splitting
map('n', '<leader>sh', ':split<cr>', options)
map('n', '<leader>sv', ':vs<cr>', options)
map('n', '<leader>st', ':tab split<cr>', options)

-- Remove highlighting
map('n', '<leader>/', ':nohl<cr>', options)

-- Easy search for visually selected text
map('v', '//', 'y/<c-r>"<cr>', options)
