local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Packer and any colorscheme related packages at top
-- Rest are alphabetical (past the /)
return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'folke/tokyonight.nvim'

  -- use {
  --   'windwp/nvim-autopairs',
  --   after = 'nvim-cmp',
  --   config = function() require('setup.autopairs') end
  -- }

  use {
    'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip'
    },
    config = function() require('setup.cmp') end
  }

  use {
    'is0n/fm-nvim',
    config = function() require('setup.lf') end
  }

  use 'ggandor/lightspeed.nvim'

  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('setup.gitsigns') end
  }

  use {
    'neovim/nvim-lspconfig',
    config = function() require('setup.lsp') end
  }

  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

  use {
    'vhyrro/neorg',
    requires = { 'nvim-lua/plenary.nvim', 'nvim-neorg/neorg-telescope' },
    config = function() require('setup.neorg') end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('setup.telescope') end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require('setup.treesitter') end
  }

  -- Key Maps!
  use {
    'folke/which-key.nvim',
    config = function() require('setup.which-key') end
  }

  -- Automatically set up configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)
