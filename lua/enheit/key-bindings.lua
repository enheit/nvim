-- nvim
vim.api.nvim_set_keymap('x', 'p', 'P', { noremap = true })      -- remap p with P to prevent yanking after replace
vim.api.nvim_set_keymap('n', 'n', 'o<esc>', { noremap = true }) -- insert a new line below the cursor without entering the insert mode
vim.api.nvim_set_keymap('n', 'N', 'O<esc>', { noremap = true }) -- insert a new line above the cursor without entering the insert mode
vim.api.nvim_set_keymap('n', "X", '<cmd>lua vim.diagnostic.open_float()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', "<leader>xx", '<cmd>Telescope diagnostics<cr>', { noremap = true })

-- telescope
vim.api.nvim_set_keymap('n', '<leader><leader>', '<cmd>Telescope find_files<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>sg', '<cmd>Telescope live_grep<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>Telescope lsp_document_symbols symbols=class,method,constructor,function<cr>',
  { noremap = true })

-- toggleterm
vim.api.nvim_set_keymap('n', '<leader>sg', '<cmd>Telescope live_grep<cr>', { noremap = true })
-- vim.api.nvim_set_keymap("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })

-- aerial
vim.api.nvim_set_keymap("n", "<leader>a", "<cmd>AerialToggle!<cr>", { noremap = true })

-- lsp-config
vim.keymap.set('n', '<leader>co', "<cmd>OrganizeImports<cr>", { noremap = true })

-- Normal mode mappings to navigate between splits
vim.api.nvim_set_keymap('n', '<M-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-l>', '<C-w>l', { noremap = true, silent = true })

-- Terminal mode mappings to navigate between splits
vim.api.nvim_set_keymap('t', '<M-h>', [[<C-\><C-n><C-w>h]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<M-j>', [[<C-\><C-n><C-w>j]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<M-k>', [[<C-\><C-n><C-w>k]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<M-l>', [[<C-\><C-n><C-w>l]], { noremap = true, silent = true })

-- Normal mode mappings to resize split panes
vim.api.nvim_set_keymap('n', '<M-s>', ':resize -2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-t>', ':resize +2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-,>', ':vertical resize -2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-.>', ':vertical resize +2<CR>', { noremap = true, silent = true })

-- Normal mode mapping to clear search highlighting
vim.api.nvim_set_keymap('n', '<Esc>', ':noh<CR>', { noremap = true, silent = true })

vim.api.nvim_create_autocmd("TermEnter", {
  callback = function()
    -- If the terminal window is lazygit, we do not make changes to avoid clashes
    if string.find(vim.api.nvim_buf_get_name(0), "lazygit") then
      return
    end

    vim.keymap.set("t", "<ESC>", function()
      vim.cmd("stopinsert")
    end, { buffer = true })
  end,
})

-- Git Blame
vim.api.nvim_set_keymap('n', '<leader>gb', '<cmd>GitBlameToggle<cr>', { noremap = true, silent = true })
