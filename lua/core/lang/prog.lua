--------------------------------------------------------------------------------
--Formatting
--------------------------------------------------------------------------------
vim.api.nvim_create_autocmd({ "BufEnter", "BufCreate" }, {
  pattern = ProgLang,
  callback = function()
    vim.opt.formatoptions = "cnjr"
  end,
})

--------------------------------------------------------------------------------
-- Text width
--------------------------------------------------------------------------------
vim.api.nvim_create_autocmd({ "BufEnter", "BufCreate" }, {
  pattern = ProgLang,
  callback = function()
    vim.opt_local.textwidth = 80
  end,
})

--------------------------------------------------------------------------------
--Vertical Bar
--------------------------------------------------------------------------------
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = ProgLang,
  callback = function()
    vim.opt.colorcolumn = "81"
  end,
})
