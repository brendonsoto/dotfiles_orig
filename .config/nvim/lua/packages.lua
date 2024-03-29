local fn = vim.fn
local g = vim.g

local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path})
end

require "paq" {

  "dense-analysis/ale";
  -- "jiangmiao/auto-pairs";
  "hrsh7th/cmp-buffer";
  "hrsh7th/cmp-cmdline";
  "hrsh7th/cmp-nvim-lsp";
  "hrsh7th/cmp-path";
  "saadparwaiz1/cmp_luasnip";
  "numToStr/Comment.nvim";
  -- "mattn/emmet-vim";
  "junegunn/goyo.vim";
  "ellisonleao/gruvbox.nvim";
  -- "neovimhaskell/haskell-vim";
  -- "sheerun/html5.vim";
  "is0n/fm-nvim";
  "L3MON4D3/LuaSnip";
  "rktjmp/lush.nvim";
  "vhyrro/neorg";
  "windwp/nvim-autopairs";
  "hrsh7th/nvim-cmp";
  "neovim/nvim-lspconfig";
  "nvim-telescope/telescope.nvim";
  "nvim-telescope/telescope-fzy-native.nvim";
  {"nvim-treesitter/nvim-treesitter", run="TSUpdate"};
  "p00f/nvim-ts-rainbow";
  "savq/paq-nvim";
  "nvim-lua/plenary.nvim";
  "ahmedkhalf/project.nvim";
  "gcmt/taboo.vim";
  -- "preservim/tagbar";
  -- "leafgarland/typescript-vim";
  -- "hail2u/vim-css3-syntax";
  "easymotion/vim-easymotion";
  -- "tpope/vim-endwise";
  -- "tpope/vim-fugitive";
  "lewis6991/gitsigns.nvim";
  -- "pangloss/vim-javascript";
  -- "elzr/vim-json";
  -- "tpope/vim-rails";
  -- "vim-ruby/vim-ruby";
  "mhinz/vim-startify";
  "tpope/vim-surround";
  -- "posva/vim-vue";
  {"lervag/vimtex", opt=true};
  "folke/which-key.nvim";

}

-- Ale
g.ale_linters = {
  cucumber = {},
  javascript = { 'eslint' },
  typescript = { 'eslint' },
  typescriptreact = { 'eslint' },
  vue = { 'vls', 'eslint' },
}
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

-- Emmet
-- g.user_emmet_settings = {
--   ['javascript.jsx'] = { extends = 'jsx' }
-- }

-- Javascript
-- g.javascript_plugin_jsdoc = 1
-- g.javascript_plugin_flow = 1

-- JSX
-- g.jsx_ext_required = 0

-- Pangloss Javascript
-- g.javascript_plugin_jsdoc = 1

-- Rainbow Parenthesis
-- g['rainbow#pairs'] = {
--   {'(', ')'},
--   {'[', ']'},
--   {'{', '}'}
-- }

-- -- Startify
g.startify_bookmarks = {
  {w = '~/vimwiki/index.md'},
  {m = '~/dotfiles/my_wiki/index.md'},
  {z = '~/dotfiles/meine_zettlekasten/index.md'},
}

-- Tagbar
-- g.tagbar_use_cache = 0
-- g.tagbar_map_showproto = ''
-- g.tagbar_width = math.max(35, fn.winwidth(0) / 5)
-- g.tagbar_autofocus = 1
-- g.tagbar_show_tag_count = 1
-- g.tagbar_wrap = 0

-- Vue
-- g.vue_pre_processors = { 'scss', 'typescript' }

-- Neorg
require('Comment').setup()
require('setup.autopairs')
require('setup.cmp')
require('setup.gitsigns')
require('setup.lf')
require('setup.lsp')
require('setup.neorg')
require('setup.project')
require('setup.telescope')
require('setup.treesitter')
require('setup.which-key') -- Keymaps here!
