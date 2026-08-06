local api, fn = vim.api, vim.fn
local utils = require('start.utils')
local g = vim.api.nvim_create_augroup('start', { clear = true })

local M = {}

local function setup_start_buf(config)
  local opts = {
    ['bufhidden'] = 'wipe',
    ['colorcolumn'] = '',
    ['foldcolumn'] = '0',
    ['matchpairs'] = '',
    ['buflisted'] = false,
    ['cursorcolumn'] = false,
    ['cursorline'] = false,
    ['list'] = false,
    ['number'] = false,
    ['relativenumber'] = false,
    ['spell'] = false,
    ['swapfile'] = false,
    ['readonly'] = false,
    ['filetype'] = 'start',
    ['wrap'] = false,
    ['signcolumn'] = 'no',
  }
  for opt, val in pairs(opts) do
    vim.opt_local[opt] = val
  end

  -- ui flags
  vim.opt.laststatus = 0
  vim.opt.showtabline = 0
  vim.opt.winbar = ''

  vim.bo[config.bufnr].modifiable = false
  vim.bo[config.bufnr].modified = false
end

local function save_user_options(config)
  local cursorline = vim.opt.cursorline:get()
  local laststatus = vim.opt.laststatus:get()
  local showtabline = vim.opt.showtabline:get()
  local winbar = vim.opt.winbar:get()

  api.nvim_create_autocmd('Filetype', {
    group = g,
    pattern = {'start'},
    callback = function(ev)
      api.nvim_create_autocmd('BufLeave', {
        group = g,
        callback = function()
          vim.opt.cursorline = cursorline
          vim.opt.laststatus = laststatus
          vim.opt.showtabline = showtabline
          vim.opt.winbar = winbar
          api.nvim_del_augroup_by_id(g)
        end
      })
    end
  })
end

local function gen_screen(config)
  require('start.header').render(config)
  require('start.shortcut').render(config)
  require('start.mru').render(config)

  utils.align_vertical_center(config)
end

local function main()
  local bufnr = api.nvim_get_current_buf()
  local winid = api.nvim_get_current_win()
  api.nvim_win_set_buf(winid, bufnr)
  local config = {
    bufnr = bufnr,
    winid = winid
  }

  save_user_options(config)
  gen_screen(config)
  setup_start_buf(config)
end

function M.setup()
  api.nvim_create_autocmd('VimEnter', {
    group = g,
    callback = function()
      for _, v in pairs(vim.v.argv) do
        if v == '-' then
          vim.g.read_from_stdin = 1
          break
        end
      end
    end,
  })

  api.nvim_create_autocmd('UIEnter', {
    group = g,
    callback = function()
      if
        fn.argc() == 0
        and api.nvim_buf_get_name(0) == ''
        and vim.g.read_from_stdin == nil
      then
        main()
      end
    end,
})
end

return M
