vim.cmd("filetype plugin indent on")
vim.cmd("set laststatus=3") -- global statusline
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.hidden = true
vim.o.whichwrap = "b,s,<,>,[,],h,l"
vim.o.pumheight = 8
vim.o.fileencoding = "utf-8"
vim.o.cmdheight = 1
vim.o.inccommand = "nosplit"
vim.o.splitbelow = true
vim.o.splitright = true
vim.opt.termguicolors = true
vim.o.conceallevel = 0
vim.o.showtabline = 0
vim.o.showmode = true
vim.o.backup = false
vim.o.writebackup = true
vim.o.updatetime = 300
vim.o.timeoutlen = 500
vim.o.clipboard = "unnamedplus"
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.scrolloff = 3
vim.o.sidescrolloff = 5
vim.o.mouse = "a"
vim.wo.wrap = false
vim.wo.number = true
vim.o.cursorline = true
vim.wo.signcolumn = "yes"
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.expandtab = true
vim.bo.expandtab = true

-- blankline options

vim.opt.list = true
vim.opt.listchars:append("eol:↴")
-- vim.opt.listchars:append("space:⋅")

vim.g.ft_man_open_mode = "vert"
