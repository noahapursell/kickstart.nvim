local M = {}

local term_buf = nil

vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = true
  end,
})

vim.keymap.set('n', '<leader>tt', function()
  if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_buf(win) == term_buf then
        vim.api.nvim_win_close(win, true)
        return
      end
    end

    vim.cmd 'botright split'
    vim.api.nvim_win_set_buf(0, term_buf)
  else
    vim.cmd 'botright split | term'
    term_buf = vim.api.nvim_get_current_buf()
  end
  vim.cmd 'wincmd J'
  pcall(vim.api.nvim_win_set_height, 0, 15)
end, { desc = 'Toggle Terminal' })

vim.keymap.set('t', 'jj', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })

return M
