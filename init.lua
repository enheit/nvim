-- lazy.nvim configuration
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({ "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable releas
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- lazy.nvim initialization
require("enheit.defaults")
require("enheit.theme")
require("enheit.random-uuid")
require("enheit.key-bindings")
require("lazy").setup("plugins")

