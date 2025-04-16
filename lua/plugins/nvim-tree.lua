return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local nvimTree = require("nvim-tree")
    local api = require("nvim-tree.api")

    nvimTree.setup({
      disable_netrw = true,
      actions = {
        open_file = {
          quit_on_open = true,
        }
      },
      renderer = {
        icons = {
          git_placement = "after",
          glyphs = {
            git = {
              staged = "S",
              unstaged = "M",
              untracked = "U",
              deleted = "D"
            },
            folder = {
              arrow_closed = "",
              arrow_open = ""
            }
          }
        }
      },
      filters = {
        dotfiles = false
      }
    })

    vim.keymap.set("n", "<leader>e", function() api.tree.toggle({ current_window = true, find_file = true }) end,
      { noremap = true })
  end,
}
