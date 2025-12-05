local u = require('configs.utils')

local M = {}

M.read_theme = function()
  local f = io.open(vim.env.HOME .. "/.config/alacritty/theme.json", "r")
  if not f then return nil end
  local content = f:read("*a")
  f:close()
  local ok, data = pcall(vim.json.decode, content)
  if not ok or type(data) ~= "table" then return nil end
  return data.theme
end

M.detect_theme = function()
  if M.read_theme() == 'light' then
    vim.cmd[[colorscheme light]]
  else
    vim.cmd[[colorscheme dark]]
  end
end

M.setup = function(opts)
  if vim.g.colors_name then
    vim.cmd 'hi clear'
  end

  if vim.fn.exists 'syntax_on' then
    vim.cmd 'syntax reset'
  end

  vim.g.theme = opts.theme
  vim.g.colors_name = opts.theme
  vim.o.background = opts.theme
  vim.o.termguicolors = true

  require('theme.base').setup(opts)
  require('theme.treesitter').setup()
end

return M
