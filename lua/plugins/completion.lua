-- Nvim Cmp
--
-- https://github.com/hrsh7th/nvim-cmp/
-- https://github.com/saadparwaiz1/cmp_luasnip
-- https://github.com/rafamadriz/friendly-snippets
-- https://github.com/hrsh7th/nvim-cmp
--

---------------------------------------------------------------------------------
-- LAZY SETUP
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
local snippets = {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
}

---------------------------------------------------------------------------------
local comp = {
  "hrsh7th/nvim-cmp",
}

---------------------------------------------------------------------------------
-- CONFIGURATION
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
function comp.config()
  local cmp = require("cmp")
  require("luasnip.loaders.from_vscode").lazy_load()

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-g>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" }, -- For luasnip users.
    }, {
      { name = "buffer" },
    }),
  })
end

return { snippets, comp }
