--------------------------------------------------------------------------------
--Formatting
--------------------------------------------------------------------------------
vim.api.nvim_create_autocmd({ "BufEnter", "BufCreate" }, {
	pattern = TextLang,
	callback = function()
		vim.opt.formatoptions = "atnjrw"
	end,
})

--------------------------------------------------------------------------------
-- Text width
--------------------------------------------------------------------------------
vim.api.nvim_create_autocmd({ "BufEnter", "BufCreate" }, {
	pattern = TextLang,
	callback = function()
		vim.opt_local.textwidth = 100
	end,
})

--------------------------------------------------------------------------------
--Vertical Bar
--------------------------------------------------------------------------------
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = TextLang,
	callback = function()
		vim.opt_local.colorcolumn = "101"
	end,
})
