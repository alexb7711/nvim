-- Telescope Bibtex
--
-- https://github.com/nvim-telescope/telescope-bibtex.nvim
--

--------------------------------------------------------------------------------
-- LAZY SETUP
---------------------------------------------------------------------------------
local telebib = {
	"nvim-telescope/telescope-bibtex.nvim",
	requires = {
		{ "nvim-telescope/telescope.nvim" },
	},
	dependencies = { { "nvim-lua/plenary.nvim" } },
}

---------------------------------------------------------------------------------
-- CONFIGURATION
---------------------------------------------------------------------------------
function telebib.config()
	require("telescope").load_extension("bibtex")

	vim.api.nvim_create_autocmd("BufEnter", {
		pattern = { "*.tex" },
		callback = function()
			vim.keymap.set("i", "<C-s>", "<cmd>:Telescope bibtex<CR>")
		end,
	})
end

return telebib
