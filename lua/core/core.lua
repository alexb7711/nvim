-- Turn on terminal gui colors
vim.opt.termguicolors = true

-- Highlight paired braces
vim.opt.showmatch = true

-- Vertical Bar
vim.opt.colorcolumn = "81"

-- Tabs instead of spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

-- Enable mouse support
vim.opt.mouse = "a"

-- Cleanup completion menu (move to lsp?)
vim.opt.completeopt = "menuone,noselect"

-- Display whitespace
vim.opt.listchars = "tab:¦ ,trail:·,extends:>,precedes:<"
vim.opt.list = true

-- Searching

vim.opt.path = vim.opt.path + "**"
vim.opt.wildmenu = true
vim.opt.ignorecase = true
vim.opt.smartcase = false
