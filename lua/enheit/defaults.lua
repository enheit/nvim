-- nvim default settings
-- vim.diagnostic.config({ virtual_text = false }) --  disable virtaul text of LSP
vim.api.nvim_set_option("clipboard", "unnamedplus")

vim.g.colors_name = "three3"
vim.o.termguicolors = true
-- vim.o.cmdheight = 1

-- Used for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.wo.number = true
vim.wo.wrap = false
-- NOTE: I changed it to "yes" to prevent file content to be shifted each time new sign from gitsigns plugin is added (appears) @ Roman
vim.wo.signcolumn = "yes" -- Previously it was "number"

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.laststatus = 3
vim.bo.softtabstop = 2
vim.opt.cursorline = true

-- Set split behavior for new windows
vim.opt.splitright = true -- Vertical splits open to the right
vim.opt.splitbelow = true -- Horizontal splits open below

-- vim.wo.colorcolumn = "120" -- Add ruler
