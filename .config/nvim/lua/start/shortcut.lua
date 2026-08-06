local api = vim.api
local utils = require('start.utils')

local M = {}

local SHORTCUT = {
  { desc = ' Empty', key = 'e', action = 'enew' },
  { desc = ' Quit', key = 'q', action = 'q' },
}

local function build_line()
  local res = ''
  local meta = {}
  local pos = 0
  local SPACE = '   '

  for i, item in ipairs(SHORTCUT) do
    if i > 1 then
      res = res .. SPACE
      pos = pos + #SPACE
    end

    local piece = string.format("%s[%s]", item.desc, item.key)
    local start = pos
    res = res .. piece
    pos = pos + #piece
    table.insert(meta, {item = item, start_idx = start, end_idx = pos })
  end
  return res, meta
end

function M.render(config)
  local raw, metas = build_line()
  local start_idx = api.nvim_buf_line_count(config.bufnr)
  api.nvim_buf_set_lines(config.bufnr, start_idx, -1, false, {''})
  local line_idx = start_idx + 1
  api.nvim_buf_set_lines(config.bufnr, line_idx, line_idx, false, utils.center_align({ raw }))

  local rendered = api.nvim_buf_get_lines(config.bufnr, line_idx, -1, false)[1]
  local found = rendered:find(raw, 1, true)
  local pad = math.max(0, found-1)

  for _, meta in ipairs(metas) do
    local item = meta.item

    utils.map_key(config, item.key, function()
      utils.run_action(item.action)
    end)

    api.nvim_buf_add_highlight(
      config.bufnr, 0, 'Comment',
      line_idx, pad + meta.start_idx, pad + meta.end_idx
    )
  end
end

return M
