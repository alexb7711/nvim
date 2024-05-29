-------------------------------------------------------------------------------
-- Convert PDFs to text
--------------------------------------------------------------------------------
vim.api.nvim_create_autocmd("BufReadPre", {
  pattern = { "*.pdf" },
  callback = function()
    vim.opt.ro = true
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = { "*.pdf" },
  callback = function()
    vim.cmd('%!pdftotext -nopgbrk -layout -q -eol unix "%" - ')
  end,
})

--------------------------------------------------------------------------------
-- Center window if its the only one display
--------------------------------------------------------------------------------
-- vim.api.nvim_create_autocmd({ "VimEnter", "WinEnter", "WinResized" }, {
--   pattern = TextLang,
--   callback = function()
--     -- Get the tab index
--     local tab_idx = vim.fn.tabpagenr() - 1
--
--     -- Get the table of windows of the current tab
--     local wins = vim.api.nvim_tabpage_list_wins(tab_idx)
--
--     -- If there is only one window and `zen-mode` is not enabled: enable `zen-mode`
--     if #wins == 1 then
--       require("zen-mode").toggle({
--         options = {
--           number = true,    -- disable number column
--           relativenumber = true, -- disable relative numbers
--           cursorline = true, -- disable cursorline
--           list = true,      -- disable whitespace characters
--         },
--         plugins = {
--           -- disable some global vim options (vim.o...)
--           -- comment the lines to not apply the options
--           options = {
--             enabled = true,
--             ruler = true, -- disables the ruler text in the cmd line area
--             showcmd = false, -- disables the command in the last line of the screen
--             -- you may turn on/off statusline in zen mode by setting 'laststatus'
--             -- statusline will be shown only if 'laststatus' == 3
--             laststatus = 3, -- turn off the statusline in zen mode
--           },
--         },
--         gitsigns = { enabled = true },
--       })
--     end
--   end,
-- })
