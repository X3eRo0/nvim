vim.g.mapleader = ' '
local map = vim.api.nvim_set_keymap
map('n', '<C-h>', '<C-w>h', {noremap = true, silent = false})
map('n', '<C-l>', '<C-w>l', {noremap = true, silent = false})
map('n', '<C-j>', '<C-w>j', {noremap = true, silent = false})
map('n', '<C-k>', '<C-w>k', {noremap = true, silent = false})

map('n', '<C-c>', ':bd!<CR>', {noremap = true, silent = false})

map('i', 'jk', '<ESC>', {noremap = true, silent = false})
map('i', 'kj', '<ESC>', {noremap = true, silent = false})

map('n', '<leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
map('n', '<leader>s', ':source $MYVIMRC<CR>', {noremap = true, silent = true})
map('n', '<leader>hh', ':split<CR>', {noremap = true, silent = true})
map('n', '<leader>vv', ':vsplit<CR>', {noremap = true, silent = true})

map('v', '<', '<gv', {noremap = true, silent = false})
map('v', '>', '>gv', {noremap = true, silent = false})

map('t', '<ESC>', '<C-\\><C-n>', {noremap = true, silent = false})

terminal = require('nvim-terminal').DefaultTerminal;
local silent = { silent = true }

vim.api.nvim_set_keymap('n', '<leader>t', ':lua NTGlobal["terminal"]:toggle()<cr>', silent)
vim.api.nvim_set_keymap('n', '<leader>1', ':lua NTGlobal["terminal"]:open(1)<cr>', silent)
vim.api.nvim_set_keymap('n', '<leader>+', ':lua NTGlobal["window"]:change_height(2)<cr>', silent)
vim.api.nvim_set_keymap('n', '<leader>-', ':lua NTGlobal["window"]:change_height(-2)<cr>', silent)
