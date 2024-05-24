--- Everforest
--
-- https://github.com/neanias/everforest-nvim
--
--

--------------------------------------------------------------------------------
-- LAZY SETUP
---------------------------------------------------------------------------------
local ever = {
  "neanias/everforest-nvim",
  version = false,
  lazy = false,
  priority = 1000,
}

---------------------------------------------------------------------------------
-- CONFIGURATION
---------------------------------------------------------------------------------
function ever.config()
  require("everforest").setup({
    background = "hard",
    transparent_background_level = 1,
    enable_italic = true,
    spell_foreground = true,
  })

  vim.o.background = 'dark'
  vim.cmd.colorscheme('everforest')
end

return ever
