-- Language Server Protocal
--
-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/williamboman/mason-lspconfig.nvim
--

--------------------------------------------------------------------------------
-- LAZY SETUP
---------------------------------------------------------------------------------
local lsp = {
  "neovim/nvim-lspconfig"
}

local mason_lsp = {
  -- Mason LSP config
    "williamboman/mason.lspconfig.nvim"
}

---------------------------------------------------------------------------------
-- CONFIGURATION
---------------------------------------------------------------------------------

-- Define LSP servers
Servers = {
  "clangd", "rust_analyzer",
  "autotools_ls", "cmake",
  "bashls", "pylsp", "matlab_ls", "lua_ls",
  "texlab", "marksman"}

function lsp.config()
  local nvim_lsp = require('lspconfig')

  -- Set up the servers
  for _, s in ipairs(Servers) do
    nvim_lsp[s].setup {
    flags = { debounce_text_changes = 150 }
    }
  end

  -- Keymaps
  vim.keymap.set('n', 'gD',  vim.lsp.buf.declaration, {})
  vim.keymap.set('n', 'gd',  vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
  vim.keymap.set('n', 'gi',  vim.lsp.buf.implementation, {})
  -- vim.keymap.set('n', '<C-k>',  vim.lsp.buf.signature_help, {})
  -- vim.keymap.set('n', '<leader>wa',  vim.lsp.buf.add_workspace_folder, {})
  -- vim.keymap.set('n', '<leader>wr',  vim.lsp.buf.remove_workspace_folder, {})
  -- vim.keymap.set('n', '<leader>D',  vim.lsp.buf.type_definition, {})
  vim.keymap.set('n', '<leader>rn',  vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca',  vim.lsp.buf.code_action, {})
  vim.keymap.set('n', 'gr',  vim.lsp.buf.references, {})
  -- vim.keymap.set('n', '<leader>e',  vim.lsp.diagnostic.show_line_diagnostics, {})
  -- vim.keymap.set('n', '[d',  vim.lsp.diagnostic.goto_prev, {})
  -- vim.keymap.set('n', ']d',  vim.lsp.diagnostic.goto_next, {})
  -- vim.keymap.set('n', '<leader>q',  vim.lsp.diagnostic.set_loclist, {})
  -- vim.keymap.set("n", "<leader>f",  vim.lsp.buf.formatting, {})
end

function mason_lsp.config()
  -- Ensure all the servers are installed
  require("mason-lspconfig").setup({
    ensure_installed = Servers
  })
end

return {lsp, mason_lsp}
