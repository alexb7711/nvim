--===============================================================================
-- Common Text File Configuration
--===============================================================================
--------------------------------------------------------------------------------
--Variables
--------------------------------------------------------------------------------

-- Programming languages
local prog_lang = {
  "*.cpp",
  "*.hpp",
  "*.c",
  "*.h",
  "*.rs",
  "*.sh",
  "*.py",
  "*.lua",
  "*.m",
  "makefile",
  "*.mk",
}

-- Markup/Writing Languages
local text_lang = {
  "*.txt",
  "*.md",
}

-- All languages
local languages = prog_lang

for _, t in ipairs(text_lang) do
  table.insert(languages, t)
end

--------------------------------------------------------------------------------
--Tabs instead of spaces
--------------------------------------------------------------------------------
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

--------------------------------------------------------------------------------
--Comment Formatting
--------------------------------------------------------------------------------
vim.opt.textwidth = 80

vim.api.nvim_create_autocmd({ "BufEnter", "BufCreate" }, {
  pattern = languages,
  callback = function()
    vim.opt.formatoptions = "cnj"
  end
})

--------------------------------------------------------------------------------
--Display whitespace
--------------------------------------------------------------------------------
vim.opt.listchars = "tab:¦ ,trail:·,extends:>,precedes:<"
vim.opt.list = true

--------------------------------------------------------------------------------
--Higlight current line
--------------------------------------------------------------------------------
vim.opt.cursorline = true

--------------------------------------------------------------------------------
--Highlight paired braces
--------------------------------------------------------------------------------
vim.opt.showmatch = true

--------------------------------------------------------------------------------
--Cursorline
--------------------------------------------------------------------------------
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  pattern = languages,
  callback = function()
    vim.cmd.cursorline = true
  end,
})

vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  pattern = languages,
  callback = function()
    vim.cmd.cursorline = false
  end,
})

--------------------------------------------------------------------------------
--Vertical Bar
--------------------------------------------------------------------------------
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = languages,
  callback = function()
    vim.opt.colorcolumn = "81"
  end
})

--------------------------------------------------------------------------------
--Sets numbering style
--------------------------------------------------------------------------------
vim.api.nvim_create_autocmd({ "InsertLeave", "BufEnter" }, {
  pattern = languages,
  callback = function()
    vim.opt_local.relativenumber = true
    vim.opt_local.number = false
  end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = languages,
  callback = function()
    vim.opt_local.relativenumber = false
    vim.opt_local.number = true
  end,
})

-- Spellcheck the buffer
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = languages,
  callback = function()
    vim.opt.spell = true
  end,
})
