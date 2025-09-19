require("util.buf_types")

-- =============================================================================
-- Commands
-- =============================================================================


-- =============================================================================
-- Auto Commands
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Auto save when leaving a buffer
-- -----------------------------------------------------------------------------
vim.api.nvim_create_autocmd("BufLeave", {
   pattern = { "*" },
   callback = function()
      vim.cmd("wall")
   end
})

-- -----------------------------------------------------------------------------
-- Cursorline
-- -----------------------------------------------------------------------------
local cursor_line_augroup = vim.api.nvim_create_augroup("CursorLine", { clear = true })
vim.api.nvim_create_autocmd({"InsertLeave", "WinEnter"}, {
   group = cursor_line_augroup,
   pattern = {"*"},
   callback = function()
      vim.opt_local.cursorline = true
   end
})
vim.api.nvim_create_autocmd({"InsertEnter", "WinLeave"}, {
   group = cursor_line_augroup,
   pattern = {"*"},
   callback = function()
      vim.opt_local.cursorline = false
   end
})

-- -----------------------------------------------------------------------------
-- Disable Word Wrap
-- -----------------------------------------------------------------------------
vim.api.nvim_create_autocmd({"BufEnter", "FocusGained", "InsertLeave"}, {
   pattern = ProgBuf,
   callback = function()
      vim.opt_local.wrap = false
   end
})

-- -----------------------------------------------------------------------------
-- Line Numbers
-- -----------------------------------------------------------------------------
vim.api.nvim_create_autocmd({"InsertLeave", "BufEnter"}, {
   pattern = ProgBuf,
   callback = function()
      vim.opt_local.number = true
      vim.opt_local.relativenumber = true
   end
})
vim.api.nvim_create_autocmd({"InsertEnter"}, {
   pattern = ProgBuf,
   callback = function()
      vim.opt_local.number = true
      vim.opt_local.relativenumber = false
   end
})

-- -----------------------------------------------------------------------------
-- Disable for terminal mode
-- -----------------------------------------------------------------------------
vim.api.nvim_create_autocmd ("TermOpen", {
   pattern = {"*"},
   callback = function() 
      vim.opt_local.number = true
      vim.opt_local.relativenumber = false
   end
})
vim.api.nvim_create_autocmd ({"BufEnter", "BufLeave", "FocusGained", "FocusLost"}, {
   pattern = {"term://*,*.pdf"},
   callback = function() 
      vim.opt_local.number = false
      vim.opt_local.relativenumber = false
   end
})

-- -----------------------------------------------------------------------------
-- Convert PDFs to text
-- -----------------------------------------------------------------------------
local pdf_txt_augroup = vim.api.nvim_create_augroup("PDF2TXT", { clear = true })
vim.api.nvim_create_autocmd("BufReadPre", {
  group = pdf_txt_augroup,
  pattern = { "*.pdf" },
  callback = function()
    -- Get the current buffer number
    local bufnr = vim.api.nvim_get_current_buf()
    --  Set the 'readonly' option for the current buffer to true
    vim.api.nvim_buf_set_option(bufnr, "readonly", true)
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  group = pdf_txt_augroup,
  pattern = { "*.pdf" },
  callback = function()
    vim.cmd('%!pdftotext -nopgbrk -layout -q -eol unix "%" - ')
  end,
})
