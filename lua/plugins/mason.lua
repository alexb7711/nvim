-- Mason
--
-- https://github.com/williamboman/mason.nvim
--

--------------------------------------------------------------------------------
-- LAZY SETUP
---------------------------------------------------------------------------------
local mason = {
  -- Mason
    "williamboman/mason.nvim"
}

---------------------------------------------------------------------------------
-- CONFIGURATION
---------------------------------------------------------------------------------
function mason.config()
  require("mason").setup()
end

return mason
