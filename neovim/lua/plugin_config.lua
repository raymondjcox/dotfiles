local map_key = vim.api.nvim_set_keymap
local api = vim.api

-- Telescope configuration
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  }
}
require('telescope').load_extension('fzf')
map_key('n', '<leader>f', "<cmd>lua require('telescope.builtin').find_files()<cr>", { noremap = true })
map_key('n', '<leader>g', "<cmd>lua require('telescope.builtin').live_grep()<cr>", { noremap = true })
map_key('n', '<leader>b', "<cmd>lua require('telescope.builtin').buffers()<cr>", { noremap = true })
map_key('n', '<leader>e', "<cmd>lua require('telescope.builtin').help_tags()<cr>", { noremap = true })

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
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true },
  incremental_selection = { enable = true }
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

require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  }
}
