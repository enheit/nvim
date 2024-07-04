-- nvim default settings
-- vim.diagnostic.config({ virtual_text = false }) --  disable virtaul text of LSP
vim.api.nvim_set_option("clipboard", "unnamedplus")

vim.g.colors_name="three3"
vim.o.termguicolors = true
-- vim.o.cmdheight = 1

-- Used for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.wo.number = true
vim.wo.wrap = false
vim.wo.signcolumn = "number"

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.laststatus = 3
vim.bo.softtabstop = 2
vim.opt.cursorline = true
