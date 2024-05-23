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
