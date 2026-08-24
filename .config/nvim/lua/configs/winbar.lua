local M = {}
local schema = require('theme.colors').get({theme = vim.o.background})
local u = require('configs.utils')
local fn = vim.fn

local function truncate(path, len)
  if #path <= len then return path end
  local res = string.sub(path, -len)
  local slash_idx = string.find(res, "/")
  if not slash_idx then
    return '..' .. string.sub(res, -(#res-2))
  else
    return string.sub(res, slash_idx + 1)
  end
end

local function get_file_name(max_len)
  local name = fn.expand('%:.')
  if name == '' or name == nil then name = '[No Name]' end
  local ro_icon = vim.bo.readonly and ' ' or ''
  local icon = "󰈚 "
  local ok, devicons = pcall(require, "nvim-web-devicons")
  if ok then
    local ic = devicons.get_icon(name)
    icon = (ic ~= nil and ic .. " ") or icon
  end

  local modified_icon = '   '
  if vim.bo.modifiable then
    if vim.bo.modified then
      modified_icon = '[+]'
    end
  end
  return string.format(" %s%s%s %%#WinBarUnsave#%s ", ro_icon, icon, truncate(name, max_len), modified_icon)
end

local WIN_MARGIN = 12
local exclude_ft = {NvimTree = true, start = true}
function M.active_bar(bufnr)
  -- double %% to get % in string
  -- pattern is %#HighlightGroup#sometext
  local ft = vim.bo[bufnr].filetype
  if exclude_ft[ft] then return "" end
  local win_width = fn.winwidth(fn.bufwinid(bufnr)) - WIN_MARGIN
  return string.format("%%#WinBarStick#▌%%#WinBar#%s", get_file_name(win_width))
end

function M.inactive_bar(bufnr)
  local ft = vim.bo[bufnr].filetype
  if exclude_ft[ft] then return "" end
  local win_width = fn.winwidth(fn.bufwinid(bufnr)) - WIN_MARGIN
  return string.format("%%#WinBarStickInactive#▌%%#WinBarNC#%s", get_file_name(win_width))
end

function M.setup()
  local WinBar = vim.api.nvim_create_augroup("WinBar", { clear = true })

  vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
    group = WinBar,
    callback = function(ev)
      vim.opt_local.winbar = "%{%v:lua.require('configs.winbar').active_bar(" .. ev.buf .. ")%}"
    end,
  })

  vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
    group = WinBar,
    callback = function(ev)
      vim.opt_local.winbar = "%{%v:lua.require('configs.winbar').inactive_bar(" .. ev.buf .. ")%}"
    end,
  })
end

return M
