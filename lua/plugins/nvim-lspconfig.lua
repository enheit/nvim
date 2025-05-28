return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
    ensure_installed = { "lua_ls", "rust_analyzer", "zls", "clangd", "ts_ls" },
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    {
      "neovim/nvim-lspconfig",
      config = function()
        require('lspconfig').lua_ls.setup {
          settings = {
            Lua = {
              runtime = {
                -- Tell the language server to use the version of Lua that Neovim uses
                version = 'LuaJIT',
                path = vim.split(package.path, ';'),
              },
              diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
              },
              workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false
              },
              -- Do not send telemetry data containing the file path
              telemetry = {
                enable = false,
              },
            },
          },
        }

        vim.api.nvim_create_autocmd('LspAttach', {
          group = vim.api.nvim_create_augroup('UserLspConfig', {}),
          callback = function(ev)
            vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

            local opts = { buffer = ev.buf }

            vim.keymap.set('n', 'gd', "<cmd>Telescope lsp_definitions<cr>", opts)
            vim.keymap.set('n', 'gr', "<cmd>Telescope lsp_references<cr>", opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', '<space>cr', vim.lsp.buf.rename, opts)
            vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)

            vim.keymap.set('n', '<space>f', function()
              vim.lsp.buf.format { async = true }
            end, opts)
          end,
        })
      end,
    },
  },
}
