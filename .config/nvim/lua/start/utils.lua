local api = vim.api

local M = {}

local function get_max_len(contents)
  local max = -1
  for _, v in pairs(contents) do
    local len = api.nvim_strwidth(v)
    if len > max then
      max = len
    end
  end
  return max
end

function M.element_align(tbl)
  local max = get_max_len(tbl)
  local res = {}
  for _, item in pairs(tbl) do
    local len = api.nvim_strwidth(item)
    local times = math.floor((max - len) / api.nvim_strwidth(' '))
    item = item .. (' '):rep(times)
    table.insert(res, item)
  end
  return res
end


function M.center_align(tbl)
  local function fill_sizes(lines)
    local fills = {}
    for _, line in pairs(lines) do
      table.insert(fills, math.floor((vim.o.columns - api.nvim_strwidth(line)) / 2))
    end
    return fills
  end

  local centered_lines = {}
  local fills = fill_sizes(tbl)

  for i = 1, #tbl do
    local fill_line = (' '):rep(fills[i]) .. tbl[i]
    table.insert(centered_lines, fill_line)
  end

  return centered_lines
end

function M.get_icon(filename)
  local ok, devicons = pcall(require, 'nvim-web-devicons')
  if not ok then
    return nil
  end
  return devicons.get_icon(filename, nil, { default = true })
end

function M.generate_empty_table(length)
  local empty_tbl = {}
  if length == 0 then
    return empty_tbl
  end
  for _ = 1, length do
    table.insert(empty_tbl, '')
  end
  return empty_tbl
end

function M.run_action(action)
  if type(action) == 'function' then
    action()
  elseif type(action) == 'string' then
    vim.cmd(action)
  end
end

function M.map_key(config, key, callback)
  vim.keymap.set('n', key, callback,
    {
      buffer = config.bufnr,
      silent = true,
      nowait = true
    })
end

function M.align_vertical_center(config)
  local size = math.floor(vim.o.lines / 2)
  - math.ceil(api.nvim_buf_line_count(config.bufnr) / 2)
  - 2
  local fill = M.generate_empty_table(size)
  api.nvim_buf_set_lines(config.bufnr, 0, 0, false, fill)
end

return M
