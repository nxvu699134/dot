local function hex_to_rgb(hex)
  local hex_in_decimal = tonumber(string.sub(hex, 2), 16)
  local mask = 255
  return {
    r = bit.band(bit.rshift(hex_in_decimal, 16), mask),
    g = bit.band(bit.rshift(hex_in_decimal, 8), mask),
    b = bit.band(hex_in_decimal, mask),
  }
end

local function rgb_to_hex(r, g, b)
  return string.format("#%02X%02X%02X", r, g, b)
end

local function rgba_to_rgb(color_hex, background, alpha)
  -- Docs
  -- https://ciechanow.ski/alpha-compositing/
  local c = hex_to_rgb(color_hex)
  local bg = hex_to_rgb(background)
  local new_r = (1 - alpha) * bg.r + alpha * c.r
  local new_g = (1 - alpha) * bg.g + alpha * c.g
  local new_b = (1 - alpha) * bg.b + alpha * c.b
  return rgb_to_hex(new_r, new_g, new_b)
end

local function hsl_to_hex(h, s, l)
  s = s / 100
  l = l / 100
  local function k(n)
    return (n + h / 30) % 12
  end
  local a = s * math.min(l, 1 - l)
  local function f(n)
    return l - a * math.max(-1, math.min(k(n) - 3, math.min(9 - k(n), 1)))
  end
  return rgb_to_hex(math.floor(255 * f(0) + 0.5), math.floor(255 * f(8) + 0.5), math.floor(255 * f(4) + 0.5))
end

local function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

local function nvim_hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local function hl_table(t)
  for group, opts in pairs(t) do
    nvim_hl(group, opts)
  end
end


local function swap_win(arg)
  -- :h winnr for more info
  local next_win = vim.fn.win_getid(vim.fn.winnr(arg))
  local next_buf = vim.api.nvim_win_get_buf(next_win)
  local cur_buf = vim.api.nvim_win_get_buf(vim.fn.win_getid())
  vim.cmd("buffer " .. next_buf)
  vim.fn.win_gotoid(next_win)
  vim.cmd("buffer " .. cur_buf)
end

return {
	hex_to_rgb = hex_to_rgb,
	rgba_to_rgb = rgba_to_rgb,
  hsl_to_hex = hsl_to_hex,
  nvim_hl = nvim_hl,
  swap_win = swap_win,
  hl_table = hl_table,
}
