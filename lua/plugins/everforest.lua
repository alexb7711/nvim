--- Everforest
--
-- https://github.com/sainnhe/everforest
--
--

--------------------------------------------------------------------------------
-- LAZY SETUP
---------------------------------------------------------------------------------
local ever = {
  "sainnhe/everforest",
  name = "everforest",
  priority = 1000,
}

---------------------------------------------------------------------------------
-- CONFIGURATION
---------------------------------------------------------------------------------
function ever.config()
  vim.g.everforest_enable_italic = true
  vim.cmd.colorscheme('everforest')
end

return ever
