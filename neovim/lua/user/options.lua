local options = {
  fileencoding = "utf-8",
  swapfile = false,
  --undofile = true,
  autoindent = true,
  smartindent = true,
  history = 1000,
  clipboard = 'unnamedplus',
  ignorecase = true,
  smartcase = true,
  --lazyredraw = true,
  expandtab = true,
  wrap = false,
  linebreak = true,
  incsearch = true,
  shiftwidth = 2,
  tabstop = 3,
  background = 'dark',
  updatetime = 300
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
