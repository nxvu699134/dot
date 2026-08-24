local M = {}

local dark_palette = {
  base    = "#232136",
  surface = "#2a273f",
  overlay = "#393552",
  muted   = "#6e6a86",
  subtle  = "#908caa",
  text    = "#e0def4",
  love    = "#eb6f92",
  gold    = "#f6c177",
  rose    = "#ea9a97",
  pine    = "#4896B5",
  foam    = "#88D1D0",
  iris    = "#c4a7e7",
  hl_low  = "#2a283e",
  hl_mid  = "#44415a",
  hl_high = "#56526e",
}

local light_palette = {
  base    = "#faf4ed",
  surface = "#fffaf3",
  overlay = "#f2e9e1",
  muted   = "#9893a5",
  subtle  = "#797593",
  text    = "#464261",
  love    = "#b4637a",
  gold    = "#ea9d34",
  rose    = "#d7827e",
  pine    = "#286983",
  foam    = "#56949f",
  iris    = "#907aa9",
  hl_low  = "#f4ede8",
  hl_mid  = "#dfdad9",
  hl_high = "#cecacd",
}

M.get = function(opts)
  local c = opts.theme == 'light' and vim.deepcopy(light_palette) or vim.deepcopy(dark_palette)
  local u = require('theme.utils')

  c.diag = {
    danger  = {fg=c.love, bg=u.rgba_to_rgb(c.love, c.base,  0.1)},
    warning = {fg=c.gold, bg=u.rgba_to_rgb(c.gold, c.base,  0.1)},
    info    = {fg=c.pine, bg=u.rgba_to_rgb(c.pine, c.base,  0.1)},
    hint    = {fg=c.foam, bg=u.rgba_to_rgb(c.foam, c.base,  0.1)},
  }

  return c
end

return M
