-- =============================================================================
-- ╻  ┏━┓┏━┓
-- ┃  ┗━┓┣━┛
-- ┗━╸┗━┛╹
-- =============================================================================

-- -----------------------------------------------------------------------------
-- LSP Supported Languages
-- -----------------------------------------------------------------------------
vim.lsp.enable({
   'cc',
   'python',
   'lua',
   'bash',
})

-- -----------------------------------------------------------------------------
-- LSP Configuration
-- -----------------------------------------------------------------------------
vim.api.nvim_create_autocmd('LspAttach', {
   group = vim.api.nvim_create_augroup('lsp_group', {}),
   callback = function(args)
      local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

      -- Set up a default configuration
      vim.lsp.config('*', {
         root_markers = { '.git' },
      })

      -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
      if client:supports_method('textDocument/completion') then
         vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
         vim.keymap.set('i', '<C-Space>', function() vim.lsp.completion.get() end)
      end
   end,
})

-- -----------------------------------------------------------------------------
-- LSP Diagnostics
-- -----------------------------------------------------------------------------
vim.diagnostic.config({
   virtual_lines = {
      current_line = true,
   },
})
