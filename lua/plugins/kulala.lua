-- In your plugin spec for Kulala:
return {
  "mistweaverco/kulala.nvim",
  ft = { "http", "rest" },
  keys = {
    -- Send the current request
    { "<leader>rs", "<cmd>lua require('kulala').run()<cr>",                     desc = "Kulala: Send Request" },
    -- Open Kulala scratchpad
    { "<leader>rb", "<cmd>lua require('kulala').scratchpad()<cr>",              desc = "Kulala: Open Scratchpad" },
    -- Jump to next request
    { "<leader>rn", "<cmd>lua require('kulala').jump_next()<cr>",               desc = "Kulala: Next Request" },
    -- Jump to previous request
    { "<leader>rp", "<cmd>lua require('kulala').jump_prev()<cr>",               desc = "Kulala: Prev Request" },
    -- Copy request as cURL
    { "<leader>rc", "<cmd>lua require('kulala').copy()<cr>",                    desc = "Kulala: Copy as cURL" },
    -- Paste from cURL
    { "<leader>rC", "<cmd>lua require('kulala').from_curl()<cr>",               desc = "Kulala: Paste from cURL" },
    -- Toggle headers/body view
    { "<leader>rt", "<cmd>lua require('kulala').toggle_view()<cr>",             desc = "Kulala: Toggle View" },
    -- Close Kulala window
    { "<leader>rq", "<cmd>lua require('kulala').close()<cr>",                   desc = "Kulala: Close Window" },
    -- Replay the last request
    { "<leader>rr", "<cmd>lua require('kulala').replay()<cr>",                  desc = "Kulala: Replay Last Request" },
    -- Show stats
    { "<leader>rS", "<cmd>lua require('kulala').show_stats()<cr>",              desc = "Kulala: Show Stats" },
    -- Download GraphQL schema
    { "<leader>rg", "<cmd>lua require('kulala').download_graphql_schema()<cr>", desc = "Kulala: Download GraphQL Schema" },
    -- Inspect current request
    { "<leader>ri", "<cmd>lua require('kulala').inspect()<cr>",                 desc = "Kulala: Inspect Request" },
  },
  opts = {
    global_keymaps = false, -- Important if you're defining your own keymaps here
  },
}
