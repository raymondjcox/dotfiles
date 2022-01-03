local map_key = vim.api.nvim_set_keymap
local api = vim.api

-- Telescope configuration
map_key('n', '<leader>f', "<cmd>lua require('telescope.builtin').find_files()<cr>", { noremap = true })
map_key('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", { noremap = true })
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

require('lualine').setup({ options = {theme = 'tokyonight'} })

