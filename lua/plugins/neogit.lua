-- Neogit
--
-- https://github.com/NeogitOrg/neogit
--

---------------------------------------------------------------------------------
-- LAZY SETUP
---------------------------------------------------------------------------------
return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",  -- required
    "sindrets/diffview.nvim", -- optional - Diff integration
  },
  config = true,
}
