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
  local t = require("nvim-treesitter.configs")

  t.setup({
    ensure_installed = {
      "c",
      "cpp",
      "rust",
      "lua",
      "vim",
      "bash",
      "python",
      "matlab",
      "make",
      "cmake",
      "markdown",
      "yaml",
      "zathurarc",
    },

    ignore_install = { "latex" },

    sync_install = true,
    auto_install = true, -- Automatically install languages that is not in the list

    highlight = { enable = true },
    indent = { enable = true },
  })
end

return tree
