return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp'
  },
  config = function()
    local cmp = require("cmp")

    cmp.setup({
      completion = {
        completeopt = 'menu,menuone,noinsert'
      },
      window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'buffer' },
      })
    })

    -- `/` cmdline setup.
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- `:` cmdline setup.
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      }),
      matching = { disallow_symbol_nonprefix_matching = false }
    })

    -- vim.api.nvim_set_hl(0, "CmpItemAbbr", { guifg = "Orange" })
    -- vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { guifg = "Orange" })
    -- vim.api.nvim_set_hl(0, "CmpItemKind", { guifg = "Orange" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", {bg="#3B4252"}) -- removes border's background in neo-tree plugin
    -- guibg=NONE guifg=Orange

    -- Setup lspconfig.
    -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- require('lspconfig')[%YOUR_LSP_SERVER%].setup({
    --   capabilities = capabilities
    -- })

  end
}
