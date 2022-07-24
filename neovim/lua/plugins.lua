local execute = vim.api.nvim_command
local fn = vim.fn

require('packer').startup(function()
  use{'wbthomason/packer.nvim'}
  use{'neovim/nvim-lspconfig'}
  use{'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use{'mhinz/vim-startify'}
  use{'tpope/vim-surround'}
  use{'tpope/vim-repeat'}
  use{'tpope/vim-fugitive'}
  use{'sbdchd/neoformat'}
  use{'scrooloose/nerdcommenter'}
  use{'pangloss/vim-javascript'}
  use{'leafgarland/typescript-vim'}
  use{'christoomey/vim-tmux-navigator'}
  use{'hrsh7th/nvim-compe'}
  use{'folke/tokyonight.nvim'}
  use{'morhetz/gruvbox'}
  use{'EdenEast/nightfox.nvim'}
  use{'nanotech/jellybeans.vim'}
  use{'sjl/badwolf'}
  use{'nvim-lua/plenary.nvim'}
  use{'kyazdani42/nvim-web-devicons'}
  use{'mfussenegger/nvim-lint'}
  use{
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
end)


