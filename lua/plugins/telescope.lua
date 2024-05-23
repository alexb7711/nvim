-- Telescope
--
-- https://github.com/nvim-telescope/telescope.nvim
--

--------------------------------------------------------------------------------
-- LAZY SETUP
---------------------------------------------------------------------------------
local tele = {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6',
  dependencies = { {'nvim-lua/plenary.nvim'} },
}

---------------------------------------------------------------------------------
-- CONFIGURATION
---------------------------------------------------------------------------------
function tele.config()
  local tel = require('telescope.builtin')

  -- Keymap
  vim.keymap.set('n', '<leader>ff', tel.find_files, {})
  vim.keymap.set('n', '<leader>pf', tel.git_files, {})
  vim.keymap.set('n', '<leader>fg', tel.live_grep, {})
  vim.keymap.set('n', '<leader>fb', tel.buffers, {})
  vim.keymap.set('n', '<leader>fh', tel.help_tags, {})
end

return tele
