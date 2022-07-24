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
