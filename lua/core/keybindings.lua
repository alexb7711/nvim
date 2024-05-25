-- Leader Key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Terminal 
vim.keymap.set("n", "<leader>pt", ":split<bar>term<CR><C-w>J:resize10<CR>")

--------------------------------------------------------------------------------
--
-- WORKSPACE MANAGEMENT
--
--------------------------------------------------------------------------------

-- Create window panes

vim.keymap.set('n', '<leader>sv', ':vsplit<Enter>')
vim.keymap.set('n', '<leader>sh', ':split<Enter>')

-- Change size of window panes

vim.keymap.set('n', '<C-k>', '<C-w>+')
vim.keymap.set('n', '<C-j>', '<C-w>-')
vim.keymap.set('n', '<C-h>', '<C-w><')
vim.keymap.set('n', '<C-l>', '<C-w>>')

-- Changing window pane

vim.keymap.set('n', '<leader>h', '<C-w>h')
vim.keymap.set('n', '<leader>l', '<C-w>l')
vim.keymap.set('n', '<leader>k', '<C-w>k')
vim.keymap.set('n', '<leader>j', '<C-w>j')

-- Create/Close/Duplicate Tabs

vim.keymap.set('n', '<leader>tn', ':tabe<CR>')
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>')
vim.keymap.set('n', '<leader>to', ':tabonly<CR>')
vim.keymap.set('n', '<leader>tm', ':tabmove<SPACE>')
vim.keymap.set('n', '<leader>tl', ':tabnext<CR>')
vim.keymap.set('n', '<leader>th', ':tabprevious<CR>')
vim.keymap.set('n', '<leader>td', ":let @\" = expand(\"%\")<CR>:tabe<CR>:e <C-r>\"<CR>")
