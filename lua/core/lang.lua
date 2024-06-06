--===============================================================================
--Variables
--===============================================================================

-- Programming languages
ProgLang = {
  "*.c",
  "*.cpp",
  "*.h",
  "*.hpp",
  "*.lua",
  "*.m",
  "*.mk",
  "*.py",
  "*.rs",
  "*.sh",
  "*.toml",
  "*.yml",
  "makefile",
}

-- Markup/Writing Languages
TextLang = {
  "*.md",
  "*.tex",
  "*.txt",
}

-- All languages
local languages = ProgLang

for _, t in ipairs(TextLang) do
  table.insert(languages, t)
end

--===============================================================================
-- Common Language Configuration
--===============================================================================

--------------------------------------------------------------------------------
--Tabs instead of spaces
--------------------------------------------------------------------------------
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

--------------------------------------------------------------------------------
--Formatting
--------------------------------------------------------------------------------
vim.opt.textwidth = 80

--------------------------------------------------------------------------------
-- Format buffer before saving the file
--------------------------------------------------------------------------------
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = languages,
  callback = function()
    vim.lsp.buf.format()
  end,
})

--------------------------------------------------------------------------------
-- Delete trailing whitespace before saving
--------------------------------------------------------------------------------
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = languages,
  callback = function()
    -- Save cursor position to restore later
    local curpos = vim.api.nvim_win_get_cursor(0)

    -- Search and replace trailing whitespaces
    vim.cmd([[keeppatterns %s/\s\+$//e]])
    vim.api.nvim_win_set_cursor(0, curpos)
  end,
})

--------------------------------------------------------------------------------
--Display whitespace
--------------------------------------------------------------------------------
vim.opt.listchars = "tab:¦ ,trail:·,extends:>,precedes:<"
vim.opt.list = true

--------------------------------------------------------------------------------
--Highlight current line
--------------------------------------------------------------------------------
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
  pattern = languages,
  callback = function()
    vim.opt_local.cursorline = true
  end,
})

vim.api.nvim_create_autocmd({ "WinLeave" }, {
  pattern = languages,
  callback = function()
    vim.opt_local.cursorline = false
  end,
})

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
    vim.opt_local.spell = true
  end,
})

--===============================================================================
-- Load Language Specific Configurations
--===============================================================================
require("core.lang.prog")
require("core.lang.text")
