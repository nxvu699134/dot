local M = {}

local dark_palette = {
  none    = 'NONE',
  red    = "#fb4934",
  green  = "#b8bb26",
  yellow = "#fabd2f",
  blue   = "#78a9c0",
  purple = "#d3869b",
  cyan   = "#8ec07c",
  teal   = "#68a895",
  orange = "#fe8019",
  base = {
    "#282828",
    "#3c3836",
    "#423e3c",
    "#484442",
    "#bdae93",
    "#d5c4a1",
    "#ebdbb2",
    "#fbf1c7",
  },
  gray = {
    "#232323",
    "#282828",
    "#2e2e2e",
    "#353535",
    "#3f3f3f",
    "#444444",
    "#4b4b4b",
    "#4e4e4e",
    "#656565",
  },
}

local light_palette = {
  none    = 'NONE',
  red    = "#cc241d",
  green  = "#748c18",
  yellow = "#b57614",
  blue   = "#3d8ca8",
  purple = "#8f3f71",
  cyan   = "#076678",
  teal   = "#3d8270",
  orange = "#af3a03",
  base = {
    "#f2e5bc",
    "#e3d6ad",
    "#e5d8af",
    "#d8cba2",
    "#cabd94",
    "#574d47",
    "#3c3836",
    "#282828",
  },
  gray = {
    "#e8dbb2",
    "#f2e5bc",
    "#e3d6ad",
    "#e5d8af",
    "#d8cba2",
    "#cabd94",
    "#c0b38a",
    "#b6a980",
    "#a2956c",
  },
}

M.get = function(opts)
  local colors = opts.theme == 'light' and vim.deepcopy(light_palette) or vim.deepcopy(dark_palette)
  local u = require('configs.utils')

  colors.bg           =  colors.base[1]
  colors.bg_hl        =  colors.gray[5]
  colors.fg           =  colors.base[6]
  colors.fg_disabled  =  colors.gray[9]
  colors.fg_invert    =  colors.base[1]
  colors.sl_bg        =  colors.gray[3]
  colors.sl_bg1       =  colors.gray[5]
  colors.sl_fg        =  colors.base[5]

  colors.diag = {
    danger   =  {  fg  =  colors.red,     bg  =  u.rgba_to_rgb(colors.red,     colors.bg,  0.1)  },
    warning  =  {  fg  =  colors.yellow,  bg  =  u.rgba_to_rgb(colors.yellow,  colors.bg,  0.1)  },
    info     =  {  fg  =  colors.blue,    bg  =  u.rgba_to_rgb(colors.blue,    colors.bg,  0.1)  },
    hint     =  {  fg  =  colors.fg,      bg  =  u.rgba_to_rgb(colors.gray[8], colors.bg,  0.1)  },
  }

  return colors
end

return M
