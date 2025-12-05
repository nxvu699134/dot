local map = vim.api.nvim_set_keymap

map('n', '<esc>', ':noh<return><esc>', {noremap = true})
map('n', '<Space><Space>', ':w<CR>', {})
map('n', 'q', '<Nop>', {})

--Navigate buffer vim
map('', '<space>h', '<C-W><C-H>', {silent = true})
map('', '<space>j', '<C-W><C-J>', {silent = true})
map('', '<space>k', '<C-W><C-K>', {silent = true})
map('', '<space>l', '<C-W><C-L>', {silent = true})

--Move window vim
map('', '<space>wh', [[:lua require('configs.utils').swap_win('h')<CR>]], {silent = true})
map('', '<space>wj', [[:lua require('configs.utils').swap_win('j')<CR>]], {silent = true})
map('', '<space>wk', [[:lua require('configs.utils').swap_win('k')<CR>]], {silent = true})
map('', '<space>wl', [[:lua require('configs.utils').swap_win('l')<CR>]], {silent = true})

-- Make wrap line navigate more EZ
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

map("n", "<leader>c", "gc", {noremap = false, desc = "Toggle comment"})
map("v", "<leader>c", "gc", {noremap = false, desc = "Toggle comment"})
map("n", "<leader>cc", "gcc", {noremap = false, desc = "Toggle comment current line"})


-- Nvim tree
map('', '<leader>ls', ':NvimTreeToggle<CR>', {silent = true})

-- Gitsigns
map('', '<Leader>gb', ':Gitsigns blame<CR>',{})

-- LSP
map("n", "<leader>jf", "<cmd>Lspsaga lsp_finder<CR>", { noremap = true, silent = true })
map("n", "<leader>f", "<cmd>Lspsaga code_action<CR>", {noremap = true, silent = true })
map("v", "<leader>f", "<cmd>Lspsaga code_action<CR>", {noremap = true, silent = true })
map("n", "<leader>jr", "<cmd>Lspsaga rename<CR>", {noremap = true, silent = true })
map("n","<leader>jd", "<cmd>vsp | Lspsaga goto_definition<CR>", {noremap = true, silent = true })
map("n", "<leader>ei", "<cmd>Lspsaga show_line_diagnostics<CR>", {noremap = true, silent = true })
map("n", "<leader>eo", "<cmd>Lspsaga show_buf_diagnostics<CR>", {noremap = true, silent = true })
map("n", "<leader>ep", "<cmd>Lspsaga diagnostic_jump_prev<CR>", {noremap = true, silent = true })
map("n", "<leader>en", "<cmd>Lspsaga diagnostic_jump_next<CR>", {noremap = true, silent = true })
map("n","<leader>o", "<cmd>Lspsaga outline<CR>", {noremap = true, silent = true })
map("n", "<leader>h", "<cmd>Lspsaga hover_doc<CR>", {noremap = true, silent = true })
