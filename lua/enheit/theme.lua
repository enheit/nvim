vim.api.nvim_set_hl(0, "Normal", { bg="none" }) -- #04110d
vim.api.nvim_set_hl(0, "NormalFloat", {bg="#0d3427" }) -- removes border's background in neo-tree plugin
vim.api.nvim_set_hl(0, "Constant", { fg="#22c55e" })
vim.api.nvim_set_hl(0, "Statement", { fg="#ca8f2f" }) -- #ca8f2f
vim.api.nvim_set_hl(0, "Special", { fg="#ffffff" })
vim.api.nvim_set_hl(0, "Identifier", { fg="#ffffff" })
vim.api.nvim_set_hl(0, "LineNr", { fg="#22c55e" })
vim.api.nvim_set_hl(0, "Comment", { fg="#304740" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { fg="#22c55e" })
vim.api.nvim_set_hl(0, "ErrorMsg", { bg="#ef4444" })
vim.api.nvim_set_hl(0, "Visual", { bg="#0a291f" })
vim.api.nvim_set_hl(0, "PMenu", { bg="#0a291f" })
vim.api.nvim_set_hl(0, "PMenuSel", { bg="#ca8f2f", fg="#ffffff" })
vim.api.nvim_set_hl(0, "PMenuSbar", { bg="#0d392b" })
vim.api.nvim_set_hl(0, "StatusLine", { bg="none" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg="none", fg="#ffffff" })
vim.api.nvim_set_hl(0, "Directory", { fg="#ca8f2f" })
vim.api.nvim_set_hl(0, "MatchParen", { bg="#0a291f" })
vim.api.nvim_set_hl(0, "Search", { bg="#eab308", fg="#000000" })
vim.api.nvim_set_hl(0, "NonText", { fg="#ffffff" })
vim.api.nvim_set_hl(0, "CursorLine", { bg="#0a291f" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg="#ca8f2f" })

vim.api.nvim_set_hl(0, "DiagnosticError", { fg="#ef4444" })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg="#f97316" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { fg="#ef4444", undercurl=true })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { fg="#f97316", undercurl=true })

vim.api.nvim_set_hl(0, "NeoTreeCursorLine", { bg="#0a291f" })
vim.api.nvim_set_hl(0, "NeoTreeFloatNormal", { bg="none" })
vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { fg="#ffffff" })

vim.api.nvim_set_hl(0, "@tag.tsx", { fg="#22c55e" })
vim.api.nvim_set_hl(0, "@type.tsx", { fg="#22c55e" })
vim.api.nvim_set_hl(0, "@function.typescript", { bold=true })
vim.api.nvim_set_hl(0, "@function.method.typescript", { bold=true })
vim.api.nvim_set_hl(0, "@function.tsx", { bold=true })
vim.api.nvim_set_hl(0, "@string.typescript", { italic=true, fg="#22c55e" })
vim.api.nvim_set_hl(0, "Type", { fg="#22c55e" })

-- neo-tree
vim.api.nvim_set_hl(0, "NvimTreeRootFolder", { fg="#ffffff" })
vim.api.nvim_set_hl(0, "NvimTreeSpecialFile", { fg="#ffffff" })
vim.api.nvim_set_hl(0, "NvimTreeGitDeletedIcon", { fg="#ef4444" })
vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg="#ca8f2f" })
vim.api.nvim_set_hl(0, "NvimTreeGitDirtyIcon", { fg="#eab308" })
vim.api.nvim_set_hl(0, "NvimTreeGitNewIcon", { fg="#333333" })


