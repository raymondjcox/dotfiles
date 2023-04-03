local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.localleader = ","

-- Quickly edit configs
keymap("n", "<leader>v", ":e ~/.config/nvim/init.lua<CR>", opts)
keymap("n", "<leader>z", ":e ~/.zshrc<CR>", opts)

-- Turn off highlight
keymap("n", "<leader>h", ":noh<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Telescope
keymap(
  "n",
  "<leader>f",
  "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
  opts
)
keymap("n", "<leader>g", "<cmd>Telescope live_grep<cr>", opts)
