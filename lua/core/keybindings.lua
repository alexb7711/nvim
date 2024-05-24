-- Leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Terminal
vim.keymap.set("n", "<leader>pt", ":split<bar>term<CR><C-w>J:resize10<CR>")
