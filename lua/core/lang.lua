--===============================================================================
-- Common Text File Configuration
--===============================================================================

local text_files = {
  "*.cpp",
  "*.hpp",
  "*.c",
  "*.h",
  "*.rs",
  "*.sh",
  "*.py",
  "*.lua",
  "*.m",
  "*.txt",
  "makefile",
  "*.mk",
  "*.md",
}

-- Tabs instead of spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

-- Comment Formatting
vim.opt.textwidth = 80
vim.opt.formatoptions = "acnj"

-- Display whitespace
vim.opt.listchars = "tab:¦ ,trail:·,extends:>,precedes:<"
vim.opt.list = true

-- Higlight current line
vim.opt.cursorline = true

-- Highlight paired braces
vim.opt.showmatch = true

-- Cursorline
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  pattern = text_files,
  callback = function()
    vim.cmd.cursorline = true
  end,
})

vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  pattern = text_files,
  callback = function()
    vim.cmd.cursorline = false
  end,
})

-- Vertical Bar
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = text_files,
  callback = function()
    vim.opt.colorcolumn = "81"
  end
})

-- Sets numbering style
vim.api.nvim_create_autocmd({ "InsertLeave", "BufEnter" }, {
  pattern = text_files,
  callback = function()
    vim.opt_local.relativenumber = true
    vim.opt_local.number = false
  end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = text_files,
  callback = function()
    vim.opt_local.relativenumber = false
    vim.opt_local.number = true
  end,
})

-- Spellcheck the buffer
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = text_files,
  callback = function()
    vim.opt.spell = true
  end,
})
