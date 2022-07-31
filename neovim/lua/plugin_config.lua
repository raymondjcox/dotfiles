local map_key = vim.api.nvim_set_keymap
local api = vim.api

-- Telescope configuration
map_key('n', '<leader>f', "<cmd>lua require('telescope.builtin').find_files({ path_display = {shorten = 8} })<cr>", { noremap = true })
map_key('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep({ path_display = {shorten = 8} })<cr>", { noremap = true })
map_key('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>", { noremap = true })
map_key('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>", { noremap = true })

-- Automatically format w/ Neoformat
api.nvim_exec([[
  autocmd BufWritePre *.rs Neoformat
  autocmd BufWritePre *.js Neoformat
  autocmd BufWritePre *.ts Neoformat
  autocmd BufWritePre *.tsx Neoformat
  autocmd BufWritePre *.html Neoformat
]], false)

-- Treesitter config
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust", "typescript", "javascript" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

require('lualine').setup({ options = {theme = 'nightfox', path = 1} })

require('lint').linters_by_ft = {
  typescript = {'eslint'},
  typescriptreact = {'eslint'}
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
