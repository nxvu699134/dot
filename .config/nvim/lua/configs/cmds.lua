-- Highlight yanked text for 250ms
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("Yank", { clear = true }),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { timeout = 250, higroup = "Visual" }
  end,
})

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("Whitespace", { clear = true }),
  pattern = "*",
  callback = function()
      vim.cmd([[%s/\s\+$//e]])
  end,
})

--Auto sync with tmux theme
-- Thanks to those guys
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
    require("lazy").reload({ plugins = {
        'indent-blankline.nvim',
        'telescope.nvim',
        'flash.nvim',
        'nvim-tree.lua'
      }
    })
  end,
})
