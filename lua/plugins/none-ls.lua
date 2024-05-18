-- none-ls
--
-- https://github.com/nvimtools/none-ls.nvim
--

--------------------------------------------------------------------------------
-- LAZY SETUP
---------------------------------------------------------------------------------
local none = {
	"nvimtools/none-ls.nvim",
}

---------------------------------------------------------------------------------
-- CONFIGURATION
---------------------------------------------------------------------------------
function none.config()
	local null_ls = require("null-ls")
	local mason_reg = require("mason-registry")
	local installed_packages = mason_reg.get_installed_package_names()

	-- Install required packages
	local packages = {
		"stylua",
		"black",
		"clang-format",
	}

	---- Check if the listed packages are installed
	for t, p in ipairs(packages) do
		if not installed_packages[t] then
			vim.cmd("MasonInstall " .. p)
		end
	end

	-- Configure NULL
	null_ls.setup({
		sources = {
			null_ls.builtins.completion.spell,

			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.black,
			null_ls.builtins.formatting.clang_format,
		},
	})
end

return none
