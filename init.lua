vim.cmd('filetype plugin indent on')
vim.cmd('syntax enable')

vim.o.encoding = 'utf-8'

vim.o.backupdir = vim.env.HOME .. "/.local/share/nvim/backups"
vim.o.directory = vim.env.HOME .. "/.local/share/nvim/swaps"
vim.o.undodir = vim.env.HOME .. "/.local/share/nvim/undo"

-- Basic settings
vim.o.autoindent = true
vim.o.hidden = true
vim.o.history = 1000
vim.o.startofline = false
vim.o.diffopt = 'filler'
vim.o.clipboard = 'unnamedplus'
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.undofile = true
vim.o.lazyredraw = true
vim.o.expandtab = true
vim.o.wrap = false
vim.o.incsearch = true
vim.o.scrolloff = 3
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.wrapscan = true
vim.o.visualbell = true
vim.o.winheight = 5
vim.o.winminheight = 5
vim.o.inccommand = 'nosplit'
vim.o.cmdheight = 2
vim.o.updatetime = 300
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.g.mapleader = ','
-- vim.o.listchars = 'tab:▸\ ,trail:▫'
-- vim.o.shortmess+=c

-- Reload init.lua easily
_G.load = function(file)
    require('plenary.reload').reload_module(file, true)
    return require(file)
end
vim.api.nvim_set_keymap('n', '<leader>sv', '<cmd>luafile $MYVIMRC<CR>', { noremap = true })

-- Keyboard shortcuts
vim.api.nvim_set_keymap('n', '<leader>v', ':e ~/.config/nvim/init.lua<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>z', ':e ~/.zshrc<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>f', ':Files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>h', ':noh<CR>', { noremap = true })

-- Use rg for fzf
vim.env.FZF_DEFAULT_COMMAND = 'rg --files --follow --glob "!.git/*"'

-- Automatically format w/ Neoformat
vim.api.nvim_exec([[
  autocmd BufWritePre *.rs Neoformat
  autocmd BufWritePre *.js Neoformat
  autocmd BufWritePre *.ts Neoformat
  autocmd BufWritePre *.tsx Neoformat
]], false)

require('packer').startup(function()
  use{'wbthomason/packer.nvim'}
  use{'neovim/nvim-lspconfig'}
  use{'junegunn/fzf', dir = '~/.fzf', run = './install --all'}
  use{'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use{'junegunn/fzf.vim'}
  use{'mhinz/vim-startify'}
  use{'tpope/vim-surround'}
  use{'tpope/vim-repeat'}
  use{'tpope/vim-fugitive'}
  use{'sbdchd/neoformat'}
  use{'roman/golden-ratio'}
  use{'scrooloose/nerdcommenter'}
  use{'pangloss/vim-javascript'}
  use{'leafgarland/typescript-vim'}
  use{'christoomey/vim-tmux-navigator'}
  use{'nvim-lua/completion-nvim'}
  use{'hrsh7th/nvim-compe'}
  use{'folke/tokyonight.nvim'}
  use{'nvim-lua/plenary.nvim'}
  use{'windwp/nvim-ts-autotag'}
  use{'kyazdani42/nvim-web-devicons'}
  use{
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
end)

require('lualine').setup({ options = {theme = 'tokyonight'} })

vim.g.tokyonight_style = 'night'
vim.cmd('colorscheme tokyonight')

local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = { "pyright", "rust_analyzer", "tsserver" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach=on_attach }
end

-- Treesitter highlighting / config setup
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { }, -- List of parsers to ignore installing
  highlight = {
    enable = true,  -- false will disable the whole extension
    disable = { },  -- list of language that will be disabled
    additional_vim_regex_highlighting = false,
  },
  autotag = {
    enable = true
  }
}

-- Compe setup
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    nvim_lsp = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

--This line is important for auto-import
vim.api.nvim_set_keymap('i', '<cr>', 'compe#confirm("<cr>")', { expr = true })
vim.api.nvim_set_keymap('i', '<c-space>', 'compe#complete()', { expr = true })
