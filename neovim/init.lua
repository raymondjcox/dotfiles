local g = vim.g
local cmd = vim.cmd
local api = vim.api
local map_key = vim.api.nvim_set_keymap
local function opt(o, v)
  vim.o[o] = v
end

-- Basic settings
g.mapleader = ','

---- off due to treesitter automatically disabling this
--cmd('filetype plugin indent on')
--cmd('syntax enable')

opt('encoding', 'utf-8')
opt('backupdir', vim.env.HOME .. "/.local/share/nvim/backups")
opt('directory', vim.env.HOME .. "/.local/share/nvim/swaps")
opt('undodir', vim.env.HOME .. "/.local/share/nvim/undo")
opt('autoindent', true)
opt('smartindent', true)
opt('history', 1000)
opt('diffopt', 'filler')
opt('clipboard', 'unnamedplus')
opt('ignorecase', true)
opt('smartcase', true)
opt('undofile', true)
opt('lazyredraw', true)
opt('expandtab', true)
opt('wrap', false)
opt('incsearch', true)
opt('shiftwidth', 2)
opt('softtabstop', 2)
opt('wrapscan', true)
opt('visualbell', true)
opt('inccommand', 'nosplit')
opt('cmdheight', 1)

-- Keyboard shortcuts
map_key('n', '<leader>v', ':e ~/.config/nvim/init.lua<CR>', { noremap = true })
map_key('n', '<leader>z', ':e ~/.zshrc<CR>', { noremap = true })
map_key('n', '<leader>h', ':noh<CR>', { noremap = true })
map_key('n', '<leader>p', ':e ~/.config/nvim/lua/plugins.lua<CR>', { noremap = true })
map_key('n', '<leader>n', ':e ~/.config/nvim/lua/plugin_config.lua<CR>', { noremap = true })
map_key('n', '<leader>l', ':e ~/.config/nvim/lua/lsp.lua<CR>', { noremap = true })

-- All plugins & config
require('plugins')
require('plugin_config')
require('lsp')

-- Colorscheme
cmd('colorscheme nightfox')
opt('termguicolors', true)
opt('background', 'dark')
