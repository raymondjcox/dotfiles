local execute = vim.api.nvim_command
local fn = vim.fn

require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use{'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'mhinz/vim-startify'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-fugitive'
  use 'sbdchd/neoformat'
  use 'scrooloose/nerdcommenter'
  use 'christoomey/vim-tmux-navigator'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'EdenEast/nightfox.nvim'
  use 'mfussenegger/nvim-lint'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use{
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
end)
