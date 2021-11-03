local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use {
    'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end
  }

  use {
    'is0n/fm-nvim',
    config = function() require('setup.lf') end
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('setup.gitsigns') end
  }

  use {
    'neovim/nvim-lspconfig',
    config = function() require('setup.lsp') end
  }

  use {
    'vhyrro/neorg',
    requires = { 'nvim-lua/plenary.nvim' },
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
