vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap
map("n", "<C-h>", "<C-w>h", {noremap = true, silent = false})
map("n", "<C-l>", "<C-w>l", {noremap = true, silent = false})
map("n", "<C-j>", "<C-w>j", {noremap = true, silent = false})
map("n", "<C-k>", "<C-w>k", {noremap = true, silent = false})

map("n", "<C-c>", ":bd!<CR>", {noremap = true, silent = false})

map("i", "jk", "<ESC>", {noremap = true, silent = false})
map("i", "kj", "<ESC>", {noremap = true, silent = false})

map("n", "<leader>f", ":Format<CR>", {noremap = true, silent = true})

map("n", "<leader>e", ":NvimTreeToggle<CR>", {noremap = true, silent = true})
map("n", "<leader>S", ":source $MYVIMRC<CR>", {noremap = true, silent = true})
map("n", "<leader>hh", ":split<CR>", {noremap = true, silent = true})
map("n", "<leader>vv", ":vsplit<CR>", {noremap = true, silent = true})
map("v", "<C-g>", '"_d', {noremap = true, silent = true})
map("v", "<C-p>", '"_dP', {noremap = true, silent = true})

map("v", "<", "<gv", {noremap = true, silent = false})
map("v", ">", ">gv", {noremap = true, silent = false})

map("n", "<leader>sr", ':lua require("spectre").open()<CR>', {noremap = true, silent = false})
map("n", "<leader>sw", ':lua require("spectre").open_visual({select_word=true})<CR>', {noremap = true, silent = false})
map("v", "<leader>s", ':lua require("spectre").open_visual()<CR>', {noremap = true, silent = false})
map("n", "<leader>sp", 'viw:lua require("spectre").open_file_search()<CR>', {noremap = true, silent = false})

map("n", "C-a", "<Plug>(dial-increment)", {noremap = true, silent = false})
map("n", "C-x", "<Plug>(dial-decrement)", {noremap = true, silent = false})

map("v", "C-a", "<Plug>(dial-increment)", {noremap = true, silent = false})
map("v", "C-x", "<Plug>(dial-decrement)", {noremap = true, silent = false})
map("v", "gC-a", "<Plug>(dial-increment-additional)", {noremap = true, silent = false})
map("v", "gC-x", "<Plug>(dial-decrement-additional)", {noremap = true, silent = false})
