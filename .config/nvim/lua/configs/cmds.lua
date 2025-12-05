-- Highlight yanked text for 250ms
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("Yank", { clear = true }),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { timeout = 250, higroup = "Visual" }
  end,
})

-- Remove trailing whitespace on save
vim.g.strip_whitespace = true
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("Whitespace", { clear = true }),
  pattern = "*",
  callback = function()
      vim.cmd([[%s/\s\+$//e]])
  end,
})

--Statusline
local Statusline = vim.api.nvim_create_augroup("Statusline", { clear = true })

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
  group = Statusline,
  callback = function()
    vim.opt_local.statusline = "%!v:lua.require('configs.statusline').active_line()"
  end,
})

vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
  group = Statusline,
  callback = function()
    vim.opt_local.statusline = "%{%v:lua.require('configs.statusline').inactive_line()%}"
  end,
})

vim.api.nvim_create_autocmd({ "FileType", "WinEnter", "BufEnter", "WinLeave", "BufLeave"}, {
  group = Statusline,
  pattern = { "NvimTree_1", "startify" },
  callback = function()
    vim.opt_local.statusline = "%{%v:lua.require('configs.statusline').empty_line()%}"
  end,
})

--Auto sync with tmux theme
-- Thank to those guys
--https://www.reddit.com/r/neovim/comments/1feskw8/how_to_send_a_vim_commandlua_code_to_all_neovim/
vim.api.nvim_create_autocmd("Signal", {
  group = vim.api.nvim_create_augroup("ToggleOnSIGUSR1", {}),
  pattern = "SIGUSR1",
  callback = function()
    if vim.o.background == 'dark' then
      vim.o.background = 'light'
      vim.cmd[[colorscheme light]]
    else
      vim.o.background = 'dark'
      vim.cmd[[colorscheme dark]]
    end
    require("plenary.reload").reload_module("configs.statusline")
  end,
})
