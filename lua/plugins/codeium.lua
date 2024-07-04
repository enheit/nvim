return {
  'Exafunction/codeium.vim',
  event = 'BufEnter',
  config = function ()
    -- Accept AI suggestion
    vim.keymap.set('i', '<M-l>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })

    -- Show next availalbe AI suggestion
    vim.keymap.set('i', '<M-]>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })

    -- Show previous availalbe AI suggestion
    vim.keymap.set('i', '<M-[>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
  end
}
