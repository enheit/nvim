return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- Mason LSP bridge
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      -- If you use nvim-cmp, you'll likely want to merge its capabilities
      -- capabilities = require('cmp_nvim_lsp').default_capabilities()

      local function organize_imports()
        local params = {
          command = "_typescript.organizeImports",
          arguments = { vim.api.nvim_buf_get_name(0) },
          title = ""
        }
        vim.lsp.buf.execute_command(params)
      end

      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "jsonls", "html", "cssls", "tailwindcss", "ts_ls", "rust_analyzer", "gopls", "eslint" }, -- Add all servers you want Mason to manage
        handlers = {
          -- Default handler for all servers not explicitly listed below.
          -- This will set up the server with default lspconfig options.
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = capabilities, -- Apply default capabilities
              -- Add any global LSP settings here
            })
          end,

          -- Custom handler for lua_ls
          lua_ls = function()
            lspconfig["lua_ls"].setup({
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim" }
                  },
                  workspace = {
                    checkThirdParty = false, -- Disable checking of third-party plugins if desired
                  },
                  telemetry = {
                    enable = false,
                  },
                }
              },
              capabilities = capabilities,
            })
          end,

          -- Custom handler for ts_ls (TypeScript Language Server)
          ts_ls = function()
            lspconfig["ts_ls"].setup({
              -- on_attach = on_attach, -- You would define on_attach function globally or here
              capabilities = capabilities,
              commands = {
                OrganizeImports = {
                  organize_imports,
                  description = "Organize Imports"
                }
              }
            })
          end,

          -- You can add custom handlers for other servers if needed
          -- For example, if you want specific settings for 'jsonls':
          -- jsonls = function()
          --   lspconfig["jsonls"].setup({
          --     settings = {
          --       json = {
          --         schemas = {
          --           {
          --             fileMatch = { "*.json" },
          --             url = "https://json.schemastore.org/package.json",
          --           },
          --         },
          --       },
          --     },
          --   })
          -- end,
        },
      })
    end,
  },

  "neovim/nvim-lspconfig",
  config = function()
    -- Your LspAttach autocommand remains here. This is good!
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

    -- IMPORTANT: If you use the `handlers` table in mason-lspconfig,
    -- you typically *don't* need these standalone lspconfig.setup calls here,
    -- unless they are for a server not managed by mason-lspconfig or you have
    -- a very specific reason to override mason-lspconfig's handler.
    -- In your original config, 'gopls' was not in ensure_installed, so its manual setup was correct.
    -- If you move 'gopls' to ensure_installed, you can move its setup to a handler.
    -- The example above moves all servers into ensure_installed, so these specific setups are now redundant.

    -- If 'on_attach' and 'capabilities' are used, they should be defined where they are accessible
    -- to the handlers, perhaps at the top of your mason-lspconfig config function.
  end
}
