function GenerateUUID()
  local uuid = "\"" .. vim.fn.system('uuidgen'):gsub('%s', '') .. "\""
  local uuidLength = string.len(uuid)

  local mode = vim.api.nvim_get_mode()["mode"]

  local rowIndex, columnIndex = unpack(vim.api.nvim_win_get_cursor(0)) -- TODO: See how to replace deprecated unpack @ Roman


  local adjustedRowIndex = rowIndex - 1
  local adjustedColumnIndex;

  if columnIndex == 0 then
    adjustedColumnIndex = columnIndex
  else
    if mode == "i" then
      adjustedColumnIndex = columnIndex
    else
      adjustedColumnIndex = columnIndex + 1
    end
  end

  vim.api.nvim_buf_set_text(0, adjustedRowIndex, adjustedColumnIndex, adjustedRowIndex, adjustedColumnIndex, { uuid })

  -- Move cursor at the end of the inserted uuid (mimic the behavior of p)
  vim.api.nvim_win_set_cursor(0, { rowIndex, columnIndex + uuidLength })
end

vim.keymap.set("n", '<M-i>', '<cmd>lua GenerateUUID()<cr>')
vim.keymap.set("i", '<M-i>', '<cmd>lua GenerateUUID()<cr>')
