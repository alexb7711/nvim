-- =============================================================================
-- ┏━╸ ╻┏━╸ ╻  ╻
-- ┃  ┏┛┃  ╺╋╸╺╋╸
-- ┗━╸╹ ┗━╸ ╹  ╹
-- =============================================================================

-- =============================================================================
-- Functions
-- =============================================================================
function CFormatBuffer()
   local format_file = vim.fn.findfile('.clang-format', vim.fn.expand('%:p:h'))
   if format_file ~= "" then
      local cursor_pos = vim.fn.getpos('.')
      vim.fn.system("clang-format -style=file:" .. format_file .. " -i " .. vim.fn.expand("%"))
      vim.fn.setpos('.', cursor_pos)
      vim.cmd('edit') -- Reread the file
   end
end

-- ==============================================================================
-- Configuration
-- ==============================================================================

-- Text wrapping
vim.opt_local.wrap = true

-- Indentation
vim.opt_local.smartindent = false

vim.opt_local.autoindent = true
vim.opt_local.cindent = true
vim.o.cinoptions = "b1(0,W4,m1"
vim.o.cinkeys = vim.o.cinkeys .. "0=break"

vim.opt_local.expandtab = true
vim.opt_local.softtabstop = 3
vim.opt_local.shiftwidth = 3

-- Code folding
vim.opt_local.foldmethod = "indent"

-- Formatting
vim.opt_local.formatprg = "clang-format"

-- =============================================================================
-- Commands
-- =============================================================================

-- =============================================================================
-- Auto-commands
-- =============================================================================

local cc_augroup = vim.api.nvim_create_augroup("CCGroup", { clear = true })
vim.api.nvim_create_autocmd({"BufWritePost"}, {
   group = cc_augroup,
   pattern = {"*.cpp", '*.c', '*.hpp', '*.h'},
   callback = CFormatBuffer,
})
