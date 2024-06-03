-- Lualine
--
-- https://github.com/nvim-lualine/lualine.nvim -- --
--

--------------------------------------------------------------------------------
-- LAZY SETUP
---------------------------------------------------------------------------------
local lualine = {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

---------------------------------------------------------------------------------
-- CONFIGURATION
---------------------------------------------------------------------------------
function lualine.config()
  require("lualine").setup()
end

return lualine
