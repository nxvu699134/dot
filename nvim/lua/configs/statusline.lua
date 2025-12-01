local schema = require('configs.colorscheme').schema
local u = require('configs.utils')


local modes = setmetatable(
  {
    n       = { text = 'NOR', color = schema.blue },
    i       = { text = 'INS', color = schema.yellow },
    c       = { text = 'CMD', color = schema.orange },
    v       = { text = 'VIS', color = schema.purple },
    V       = { text = 'L·V', color = schema.purple },
    ['']  = { text = 'B·V', color = schema.purple },
    R       = { text = 'REP', color = schema.red },
  },
  { -- this is fallback if key not exist
    __index = function()
      return { text = 'UNK', color = schema.base[4]}
    end
  }
)

local sep = {
  open = "",
  close = "",
}

local function get_current_mode()
  local cur = vim.api.nvim_get_mode().mode or "n"
  local info = modes[cur] or modes.n
  u.nvim_hl("StatusLineMode", { fg = schema.bg, bg = info.color })
  u.nvim_hl("StatusLineSepMode", { fg = info.color })
  return info.text
end

local function get_file_info()
  local name = vim.fn.expand('%:t')
  if name == '' or name == nil then name = '[No Name]' end
  local ext = vim.fn.expand('%:e')
  local ro_icon = vim.bo.readonly and ' ' or ''
  local icon = "󰈚 "
  local ok, devicons = pcall(require, "nvim-web-devicons")
  if ok then
    local ic = devicons.get_icon(name)
    icon = (ic ~= nil and ic .. " ") or icon
  end

  if vim.bo.modifiable then
    if vim.bo.modified then
      u.nvim_hl("StatusLineFileName", { fg = schema.red, bg = schema.sl_bg1 })
    else
      u.nvim_hl("StatusLineFileName", { fg = schema.fg, bg = schema.sl_bg1 })
    end
  end
  return string.format(" %s%s%s ", ro_icon, icon, name)
end

local function get_lsp_count()
  if vim.tbl_isempty(vim.lsp.get_clients({buffer=0})) then
    return ''
  end

  local severity = vim.diagnostic.severity
  local counts = {
    { severity = severity.ERROR,   icon = " ", group = "StatusLineLspError" },
    { severity = severity.WARN,    icon = " ", group = "StatusLineLspWarn" },
    { severity = severity.INFO,    icon = " ", group = "StatusLineLspInfo" },
    { severity = severity.HINT,    icon = "󰛩 ", group = "StatusLineLspInfo" },
  }
  local ret = ''
  for _, v in ipairs(counts) do
    local n = #vim.diagnostic.get(0, { severity = v.severity })
    if n > 0 then
      ret = ret .. string.format("%%#%s#%s%d ", v.group, v.icon, n)
    end
  end
  return ret
end

local function get_ln_col()
  local pos = vim.api.nvim_win_get_cursor(0)
  return string.format("%3d :%2d ", pos[1], pos[2])
end

local M = {}

M.active_line = function()
  -- double %% to get % in string
  -- pattern is %#HighlightGroup#sometext
  return string.format("%%#StatusLineSepMode#%s", sep.open)
      .. string.format("%%#StatusLineMode#%s ", get_current_mode())
      .. string.format("%%#StatusLineFileName#%s", get_file_info())
      .. string.format("%%#StatusLineFileNameSep#%s", sep.close)
      .. "%#StatusLineBg#"
      .. string.format(" %s", get_lsp_count())
      .. "%=" -- Right section
      .. string.format("%%#StatusLineMode# %s", get_ln_col())
      .. " %P"
      .. string.format("%%#StatusLineSepMode#%s", sep.close)
end

M.inactive_line = function()
  return string.format("%%#StatusLineSepInactive#%s", sep.open)
      .. string.format("%%#StatusLineInactiveFileName#%s", get_file_info())
      .. "%#StatusLineBg#"
      .. "%=" -- Right section
      .. string.format("%%#StatusLineSepInactive#%s", sep.close)
end

M.empty_line = function()
  return ""
end

return M
