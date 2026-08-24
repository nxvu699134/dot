local c = require('theme.colors').get({theme = vim.o.background})
local u = require('configs.utils')

local modes = {
  n       = { text = ' ORMAL',  color = c.pine },
  i       = { text = 'NSERT',   color = c.rose },
  c       = { text = ' 󰌀 XEC ',    color = c.love },
  v       = { text = ' ISUAL ',  color = c.iris },
  V       = { text = '󰘤 VISUAL', color = c.iris },
  ['']  = { text = ' VISUAL', color = c.iris },
  R       = { text = 'ƦEPLACE',  color = c.gold },
}


local function get_current_mode()
  local cur = vim.api.nvim_get_mode().mode or "n"
  local info = modes[cur] or modes.n
  u.nvim_hl("StatusLineMode", { bg=info.color, bold=true })
  return info.text
end

local function get_lsp_count()
  if vim.tbl_isempty(vim.lsp.get_clients({buffer=0})) then
    return ''
  end

  local severity = vim.diagnostic.severity
  local counts = {
    { severity = severity.ERROR,   icon = " ", group = "StatusLineLspError" },
    { severity = severity.WARN,    icon = " ", group = "StatusLineLspWarn" },
    { severity = severity.INFO,    icon = " ", group = "StatusLineLspInfo" },
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

local function get_git_status()
  local git = vim.b.gitsigns_status_dict
  if not git then return "%#StatusLineOverlay# 󱓌 " end
  local branch = "%#StatusLineOverlay#  " .. git.head
  local added = ""
  if git.added and git.added > 0 then
    added = " %#StatusLineGitAdd#+" .. git.added
  end

  local changed = ""
  if git.changed and git.changed > 0 then
    changed = " %#StatusLineGitChange#~" .. git.changed
  end

  local removed = ""
  if git.removed and git.removed > 0 then
    removed = " %#StatusLineGitRemove#-" .. git.removed
  end

  return string.format("%s%s%s%s ", branch, added, changed, removed)
end

local function get_ln_col()
  local pos = vim.api.nvim_win_get_cursor(0)
  return string.format("%3d :%2d ", pos[1], pos[2])
end

local KB_SIZE = 1024
local MB_SIZE = 104856
local function get_file_info()
  local ft = vim.bo.filetype
  local size = math.max(vim.fn.line2byte(vim.fn.line('$') + 1) - 1, 0)
  local size_str = ""
  if size < KB_SIZE then
    size_str = string.format('%dB', size)
  elseif size < MB_SIZE then
    size_str = string.format('%.2f KB', size / KB_SIZE)
  else
    size_str = string.format('%.2f MB', size / MB_SIZE)
  end
  return string.format("%%#StatusLineOverlay# %s %%#StatusLineOverlayMuted#│ %%#StatusLineOverlay#%s ", ft, size_str)
end

local M = {}

local sep = {
  left = "",
  right = "",
}

M.active_line = function()
  -- double %% to get % in string
  -- pattern is %#HighlightGroup#sometext
  return string.format("%%#StatusLineMode# %s ", get_current_mode())
      .. get_git_status()
      .. "%#StatusLine#"
      .. string.format(" %s", get_lsp_count())
      .. "%=" -- Right section
      .. get_file_info()
      .. string.format("%%#StatusLineMode# %s", get_ln_col())
      .. " %P "
end

M.setup = function()
  local Statusline = vim.api.nvim_create_augroup("Statusline", { clear = true })
  vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter", "DiagnosticChanged" }, {
    group = Statusline,
    callback = function()
      vim.opt_local.statusline = "%!v:lua.require('configs.statusline').active_line()"
    end,
  })
end

return M
