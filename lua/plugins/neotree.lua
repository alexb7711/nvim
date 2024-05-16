-- Neotree
--
-- https://github.com/nvim-neo-tree/neo-tree.nvim
--

---------------------------------------------------------------------------------
-- LAZY SETUP
---------------------------------------------------------------------------------
local neotree = {
  "nvim-neo-tree/neo-tree.nvim", branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  lazy = false,
}

---------------------------------------------------------------------------------
-- CONFIGURATION
---------------------------------------------------------------------------------
function neotree.config()
  -- Keymap
  vim.keymap.set('n', '<leader>b', ':Neotree filesystem toggle right<CR>')
end

return neotree
