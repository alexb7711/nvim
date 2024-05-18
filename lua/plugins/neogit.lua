-- Neogit
--
-- https://github.com/NeogitOrg/neogit
--

---------------------------------------------------------------------------------
-- LAZY SETUP
---------------------------------------------------------------------------------
local neogit = {
  "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration
    }
}

---------------------------------------------------------------------------------
-- CONFIGURATION
---------------------------------------------------------------------------------
function neogit.config()
  -- Keymap
  vim.keymap.set('n', '<leader>b', ':neogit filesystem toggle right<CR>')
end

return neogit
