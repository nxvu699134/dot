local o = vim.opt

o.shortmess = 'csa' -- disable some stuff on shortmess

-- for better completion
o.completeopt = { "menu", "menuone", "noselect", "noinsert" }
o.pumheight = 10 -- limit completion items
o.signcolumn = 'yes:1'
o.splitright = true
o.splitbelow = true
o.ignorecase = true
o.smartcase = true
o.showmode = false
o.clipboard = 'unnamedplus'-- Sync with system clipboard
o.laststatus = 2
o.ttyfast = true
o.autoread = true
o.hidden = true -- keep hidden buffers
o.cmdheight = 1
o.scrolloff = 2
o.sidescroll = 2
o.sidescrolloff = 15
o.relativenumber = true
o.wrap = true
o.swapfile = false
o.writebackup = false

--I suffered bad experience for diagnostic messages when it's default 4000.
o.updatetime = 400

--Solve vim ESC delay
o.timeoutlen = 400
o.ttimeoutlen = 0

local INDENT = 2
vim.o.shiftwidth = INDENT
vim.o.tabstop = INDENT
vim.o.softtabstop = INDENT
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.breakindent = true
--
-- stolen from tjdevries
o.formatoptions = o.formatoptions
	- "a" -- Auto formatting is BAD.
	- "t" -- Don't auto format my code. I got linters for that.
	+ "c" -- In general, I like it when comments respect textwidth
	+ "q" -- Allow formatting comments w/ gq
	- "o" -- O and o, don't continue comments
	- "r" -- But do continue when pressing enter.
	+ "n" -- Indent past the formatlistpat, not underneath it.
	+ "j" -- Auto-remove comments if possible.
	- "2" -- I'm not in gradeschool anymore

vim.opt.diffopt = vim.opt.diffopt + 'vertical'
