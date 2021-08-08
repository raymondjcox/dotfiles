local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

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
  use{'nvim-lua/plenary.nvim'}
  use{'kyazdani42/nvim-web-devicons'}
  use{
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
end)


