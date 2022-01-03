local g = vim.g
local cmd = vim.cmd
local api = vim.api
local map_key = vim.api.nvim_set_keymap
local function opt(o, v, scopes)
  vim.o[o] = v
end

-- Basic settings
g.mapleader = ','
cmd('filetype plugin indent on')
cmd('syntax enable')
opt('encoding', 'utf-8')
opt('backupdir', vim.env.HOME .. "/.local/share/nvim/backups")
opt('directory', vim.env.HOME .. "/.local/share/nvim/swaps")
opt('undodir', vim.env.HOME .. "/.local/share/nvim/undo")
opt('autoindent', true)
opt('hidden', true)
opt('history', 1000)
opt('startofline', false)
opt('diffopt', 'filler')
opt('clipboard', 'unnamedplus')
opt('ignorecase', true)
opt('smartcase', true)
opt('undofile', true)
opt('lazyredraw', true)
opt('expandtab', true)
opt('wrap', true)
opt('incsearch', true)
opt('scrolloff', 3)
opt('shiftwidth', 2)
opt('softtabstop', 2)
opt('wrapscan', true)
opt('visualbell', true)
opt('inccommand', 'nosplit')
opt('cmdheight', 2)
opt('updatetime', 300)
opt('completeopt', 'menuone,noinsert,noselect')

-- Colorscheme
g.tokyonight_style = 'night'
cmd('colorscheme tokyonight')
opt('termguicolors', true)
opt('background', 'dark')

-- Reload init.lua easily
_G.load = function(file)
    require('plenary.reload').reload_module(file, true)
    return require(file)
end
map_key('n', '<leader>sv', '<cmd>luafile $MYVIMRC<CR>', { noremap = true })

-- Keyboard shortcuts
map_key('n', '<leader>v', ':e ~/.config/nvim/init.lua<CR>', { noremap = true })
map_key('n', '<leader>z', ':e ~/.zshrc<CR>', { noremap = true })
map_key('n', '<leader>h', ':noh<CR>', { noremap = true })
map_key('n', '<leader>p', ':e ~/.config/nvim/lua/plugins.lua<CR>', { noremap = true })
map_key('n', '<leader>l', ':e ~/.config/nvim/lua/lsp.lua<CR>', { noremap = true })

-- All plugins & config
require('plugins')
require('plugin_config')
require('lsp')
