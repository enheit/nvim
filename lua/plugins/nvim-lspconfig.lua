return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")

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

        -- vim.keymap.set('n', '<space>f', "<cmd>PrettierAsync<cr>", opts)

        vim.keymap.set('n', '<space>f', function()
          vim.lsp.buf.format { async = true }
        end, opts)
      end,
    })

    -- golang lsp
    require'lspconfig'.gopls.setup{}

    -- configure lua lsp
    lspconfig["lua_ls"].setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          }
        }
      }
    })

    local function organize_imports()
      local params = {
        command = "_typescript.organizeImports",
        arguments = { vim.api.nvim_buf_get_name(0) },
        title = ""
      }
      vim.lsp.buf.execute_command(params)
    end

    -- configure TypeScript lsp
    lspconfig["tsserver"].setup({
      on_attach = on_attach,
      capabilities = capabilities,
      commands = {
        OrganizeImports = {
          organize_imports,
          description = "Organize Imports"
        }
      }
    })

    -- configure HTML lsp
    lspconfig["html"].setup({})

    -- configure JSON lsp
    lspconfig["jsonls"].setup({})

    -- configure TailwindCSS lsp
    lspconfig["tailwindcss"].setup({})

    lspconfig["eslint"].setup({})
  end
}


-- Unusuded bindings that may be helpful in future
-- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
-- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
-- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
-- local on_attach = function(_, _)
--   -- vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { noremap = true })
--   -- vim.keymap.set('n', '<leader>ca', vim.lsp.code_action, { noremap = true })
--   --
--   -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true })
--   -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {noremap = true})
--   -- vim.keymap.set('n', 'gr', require('telescope.builtin').lsp.references, {noremap = true})
--   -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, {noremap = true})
-- end
