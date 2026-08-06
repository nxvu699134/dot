local api = vim.api
local utils = require('start.utils')
local ns = api.nvim_create_namespace('Start')
local cwd = vim.fn.fnamemodify(vim.loop.cwd(), ':p')

local M = {}

local function is_file_belong_cwd(file)
  -- Ensure both paths end with separator and are normalized
  local file_path = vim.fn.fnamemodify(file, ':p')
  local file_dir = vim.fn.fnamemodify(file_path, ':h') .. '/'
  return file_dir:sub(1, #cwd) == cwd
end

local function get_cwd_mru_list(top_k)
  local mru = {}
  for _, file in pairs(vim.v.oldfiles or {}) do
    local is_valid_file = file and vim.fn.filereadable(file) == 1
    if  is_valid_file and is_file_belong_cwd(file) then
      table.insert(mru, file)
      if #mru == top_k then
        break
      end
    end
  end
  return mru
end

local function mru_list(config)
  local LIMIT = 10

  local mru_header = string.format("  MRU %s", cwd)
  local list = {
    mru_header,
    ''
  }

  local metas = {}
  local mlist = get_cwd_mru_list(LIMIT)

  local LEFT_PAD = ' '

  for _, file in pairs(mlist) do
    local filename = vim.fn.fnamemodify(file, ':t')
    local icon, group = utils.get_icon(filename)
    icon = icon or ''
    trunked_file = vim.fn.fnamemodify(file, ':.')
    table.insert(metas,
      { icon_size = #icon,
        icon_group = group,
        file_name=filename,
        full_path=file
      })
    table.insert(list, LEFT_PAD .. icon .. ' ' .. trunked_file)
  end

  if #list == 2 then
    table.insert(list, '   ' .. '<empty>')
  end
  return list, metas
end

local function number_hotkey()
  local start = -1
  return function()
    start = start + 1
    return start
  end
end

local function content_start(line)
  local i = line:find('[^%s]')
  return i and (i - 1) or 0
end

function M.render(config)
  local mlist, metas = mru_list(config)

  local lines = {''}
  vim.list_extend(lines, mlist)

  lines = utils.element_align(lines)
  lines = utils.center_align(lines)

  local first_line = api.nvim_buf_line_count(config.bufnr)
  api.nvim_buf_set_lines(config.bufnr, first_line, -1, false, lines)

  -- lines[2] = MRU title, lines[4..] = file entries
  local header_line = first_line + 1;
  local header_col = content_start(lines[2])

  api.nvim_buf_add_highlight(config.bufnr, 0, 'StartMruTitle', header_line, 0, -1)
  api.nvim_buf_add_highlight(
    config.bufnr,
    0,
    'StartMruIcon',
    header_line,
    0,
    header_col + 2
  )

  api.nvim_win_set_cursor(config.winid, { header_line + 3, header_col })

  local hotkey = number_hotkey()
  local line_col = content_start(lines[4])
  local file_idx = header_line + 1;

  for i, meta in pairs(metas) do
    local line_idx = file_idx + i --i start at 1

    --hl file icon
    api.nvim_buf_add_highlight(config.bufnr, 0, meta.icon_group, line_idx, line_col, line_col + meta.icon_size)
    --hi file path
    api.nvim_buf_add_highlight(config.bufnr, 0, 'StartFilepath', line_idx, line_col + meta.icon_size + 1, -1)

    local key = tostring(hotkey())
    api.nvim_buf_set_extmark(config.bufnr, ns, line_idx, line_col, {
      virt_text = { { string.format("  [%s]  ", key), 'Number' } },
      virt_text_pos = 'inline',
    })

    local txt = api.nvim_buf_get_lines(config.bufnr, line_idx, -1, false)[1]
    local sfile, efile = txt:find(meta.file_name, 1, true)
    api.nvim_buf_add_highlight(config.bufnr, 0, 'StartFilename', line_idx, sfile -1, efile)

    utils.map_key(config, key, function()
      utils.run_action('edit ' .. meta.full_path)
    end)
  end
end

return M
