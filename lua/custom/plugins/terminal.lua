local M = {}

vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = true
  end,
})

vim.keymap.set('n', '<leader>st', function()
  if vim.bo.buftype == 'terminal' then
    vim.cmd 'close'
    return
  end

  vim.cmd 'botright split | term'
  vim.cmd 'wincmd J'
  pcall(vim.api.nvim_win_set_height, 0, 15)
end, { desc = 'Open Small Terminal' })

return M
