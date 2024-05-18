local text_files = {
  "*.cpp",
  ".hpp",
  "*.c",
  "*.h",
  "*.rs",
  "*.sh",
  "*.py",
  "*.lua",
  "*.m",
  "*.txt",
  "makefile",
  "*.md",
}

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

-- Convert PDFs to text
vim.api.nvim_create_autocmd("BufReadPre", {
  pattern = { "*.pdf" },
  callback = function()
    vim.opt.ro = true
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = { "*.pdf" },
  callback = function()
    vim.cmd('%!pdftotext -nopgbrk -layout -q -eol unix "%" - ')
  end,
})

-- Format buffer before saving the file
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format()
  end,
})
