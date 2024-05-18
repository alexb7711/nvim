-- Treesitter
--
-- https://github.com/nvim-treesitter/nvim-treesitter
--

---------------------------------------------------------------------------------
-- LAZY SETUP
---------------------------------------------------------------------------------
local tree = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = true,
}

---------------------------------------------------------------------------------
-- CONFIGURATION
---------------------------------------------------------------------------------
function tree.config()
  local tree = require('nvim-treesitter.configs')

  tree.setup ({
    ensure_installed =
    {"c", "cpp", "rust",  -- Compiled languages
    "lua", "vim", "bash", "python", "matlab",  -- Scripting Languages
    "make", "cmake",  -- Build tools
    "markdown", "yaml", "zathurarc"}, -- Misc.

    sync_install = true,
    auto_install = true, -- Automatically install languages that is not in the list

    highlight = { enable = true, },
    indent = {enable = true },
  })
end

return tree
