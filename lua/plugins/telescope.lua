return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local telescope = require('telescope')

    telescope.setup({
      defaults = {
        path_display = {
          "smart"
        },
      },
      pickers = {
        find_files = {
          previewer = false
        },
        diagnostics = {
          previewer = false,
        },
      },
    })
  end

}
