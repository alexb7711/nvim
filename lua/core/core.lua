-- Turn on terminal gui colors
vim.opt.termguicolors = true

-- Copy to clipboard
vim.opt.clipboard = "unnamedplus"

-- Enable mouse support
vim.opt.mouse = "a"

-- Cleanup completion menu (move to lsp?)
vim.opt.completeopt = "menuone,noselect"

-- Searching
vim.opt.path = vim.opt.path + "**"
vim.opt.wildmenu = true
vim.opt.ignorecase = true
vim.opt.smartcase = false
