local M = {}

function M.nvim_hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

function M.hl_table(t)
  for group, opts in pairs(t) do
    M.nvim_hl(group, opts)
  end
end

function M.swap_win(arg)
  -- :h winnr for more info
  local next_win = vim.fn.win_getid(vim.fn.winnr(arg))
  local next_buf = vim.api.nvim_win_get_buf(next_win)
  local cur_buf = vim.api.nvim_win_get_buf(vim.fn.win_getid())
  vim.cmd("buffer " .. next_buf)
  vim.fn.win_gotoid(next_win)
  vim.cmd("buffer " .. cur_buf)
end

return M
