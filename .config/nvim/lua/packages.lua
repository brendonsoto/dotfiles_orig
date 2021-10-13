local fn = vim.fn
local g = vim.g
local map = vim.api.nvim_set_keymap

local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path})
end

require "paq" {

  "dense-analysis/ale";
  "jiangmiao/auto-pairs";
  -- "rbgrouleff/bclose.vim";
  "hrsh7th/cmp-buffer";
  "hrsh7th/cmp-nvim-lsp";
  "mattn/emmet-vim";
  "junegunn/goyo.vim";
  "ellisonleao/gruvbox.nvim";
  -- "morhetz/gruvbox";
  -- "neovimhaskell/haskell-vim";
  -- "sheerun/html5.vim";
  -- "itchyny/lightline.vim";
  "rktjmp/lush.nvim";
  "tmhedberg/matchit";
  "vhyrro/neorg";
  "hrsh7th/nvim-cmp";
  "neovim/nvim-lspconfig";
  "nvim-telescope/telescope.nvim";
  "nvim-telescope/telescope-fzy-native.nvim";
  {"nvim-treesitter/nvim-treesitter", run="TSUpdate"};
  "savq/paq-nvim";
  "nvim-lua/plenary.nvim";
  "junegunn/rainbow_parentheses.vim";
  -- "francoiscabrol/ranger.vim";
  "mtth/scratch.vim";
  "gcmt/taboo.vim";
  "preservim/tagbar";
  "tomtom/tcomment_vim";
  -- "leafgarland/typescript-vim";
  -- "hail2u/vim-css3-syntax";
  "easymotion/vim-easymotion";
  "tpope/vim-endwise";
  "tpope/vim-fugitive";
  "airblade/vim-gitgutter";
  -- "pangloss/vim-javascript";
  -- "elzr/vim-json";
  "adelarsq/vim-matchit";
  -- "tpope/vim-rails";
  "vim-ruby/vim-ruby";
  "mhinz/vim-startify";
  "tpope/vim-surround";
  -- "posva/vim-vue";
  {"lervag/vimtex", opt=true};

}

-- Ale
-- g.ale_linters = {
--   cucumber = {},
--   javascript = { 'eslint', 'tsserver' },
--   typescript = { 'eslint', 'tsserver' },
--   typescriptreact = { 'eslint', 'tsserver' },
--   vue = { 'vls', 'eslint' },
-- }
g.ale_linters_explicit = 1
g.ale_disable_lsp = 1
g.ale_fixers = {
  ['*'] = { 'remove_trailing_lines', 'trim_whitespace' },
  javascript = { 'prettier' },
  typescript = { 'prettier' },
  typescriptreact = { 'prettier' },
  vue = { 'prettier' },
  elixir = { 'mix_format' }
}
g.ale_fix_on_save = 1
map('n', '[a', ':ALEPreviousWrap<cr>', options)
map('n', ']a', ':ALENextWrap<cr>', options)

-- Emmet
g.user_emmet_settings = {
  ['javascript.jsx'] = { extends = 'jsx' }
}

-- Javascript
-- g.javascript_plugin_jsdoc = 1
-- g.javascript_plugin_flow = 1

-- JSX
-- g.jsx_ext_required = 0

-- Pangloss Javascript
-- g.javascript_plugin_jsdoc = 1

-- Rainbow Parenthesis
g['rainbow#pairs'] = {
  {'(', ')'},
  {'[', ']'},
  {'{', '}'}
}

-- Ranger
-- g.bclose_no_plugin_maps = 1 -- undo bclose <Space>bd mapping
-- g.ranger_command_override = 'ranger --cmd "set show_hidden=true"'
-- g.ranger_replace_netrw = 1

-- Startify
g.startify_bookmarks = {
  {w = '~/vimwiki/index.md'},
  {m = '~/dotfiles/my_wiki/index.md'},
  {z = '~/dotfiles/meine_zettlekasten/index.md'},
}

-- Tagbar
g.tagbar_use_cache = 0
g.tagbar_map_showproto = ''
g.tagbar_width = math.max(35, fn.winwidth(0) / 5)
g.tagbar_autofocus = 1
g.tagbar_show_tag_count = 1
g.tagbar_wrap = 0
map('n', '<Leader>tt', ':TagbarToggle<cr>', options) -- options is global -- see keymaps.lua

-- Vue
g.vue_pre_processors = { 'scss', 'typescript' }

-- Neorg
require('setup.cmp')
require('setup.lsp')
require('setup.neorg')
require('setup.telescope')
require('setup.treesitter')