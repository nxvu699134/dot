local api = vim.api
local utils = require('start.utils')
local M = {}

local function default_header()
  local header =
[[
                 ░░░░░░░░░
             ░░▒▒▒▒▓▓▓▓▓▒▒▒▒░░
           ░░▒▒▓▓▓▓█████▓▓▓▓▒▒░░
         ░░▒▒▓▓▓▓█████████▓▓▓▓▒▒░░
         ░░▒▒▓▓██ _oo0oo_ ██▓▓▒▒░░
       ░░▒▒▓▓██  o8888888o  ██▓▓▒▒░░
       ░░▒▒▓▓██  88" • "88  ██▓▓▒▒░░
       ░░▒▒▓▓██  (| -_- |)  ██▓▓▒▒░░
         ░░▒▒▓▓█ 0\  =  /0 █▓▓▒▒░░
         ░░▒▒▓▓___/`---´\___▓▓▒▒░░
           ░░.´ \\|     |// `.░░
            / \\||| 卐  |||// \
           / _||||| -:- |||||_ \
          |   | \\\  -  /// |   |
          | \_|  ''\---/''  |_/ |
          \  .-\__  '-'  ___/-. /
        ___`. .'  /--.--\  '. .´___
     ."" '<  `.___\_<|>_/___.´  >' "".
    | | :  `- \`.:`\ _ /´:.´/ -´  : | |
    \  \ `_.   \_ __\ /__ _/   ._´ /  /
=====`-.____`.___ \_____/ ___.´____.-´=====
                  `=---=´

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            阿弥陀佛 - अमिताभ
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                卐 阮春武
]]
  return vim.split(header, '\n', { plain = true, trimempty = true })
end


function M.render(config)
  local header = default_header()
  api.nvim_buf_set_lines(config.bufnr, 0, -1, false, utils.center_align(utils.element_align(header)))

  for i, _ in ipairs(header) do
    api.nvim_buf_add_highlight(config.bufnr, 0, 'StartHeader', i - 1, 0, -1)
  end
end

return M
