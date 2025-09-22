-- =============================================================================
-- ┏━╸┏━╸┏┓╻╺┳╸┏━╸┏━┓┏━┓┏━┓╺┳┓
-- ┃  ┣╸ ┃┗┫ ┃ ┣╸ ┣┳┛┣━┛┣━┫ ┃┃
-- ┗━╸┗━╸╹ ╹ ╹ ┗━╸╹┗╸╹  ╹ ╹╺┻┛
-- =============================================================================

return {
   "smithbm2316/centerpad.nvim",
   config = function()
      local centerpad = require('centerpad')
      vim.api.nvim_set_keymap('n', '<leader>z', "<cmd>lua require'centerpad'.toggle{ leftpad = 70, rightpad = 70 }<cr>", { silent = true, noremap = true })
   end
}
