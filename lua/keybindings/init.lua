vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap
map("n", "<C-h>", "<C-w>h", {noremap = true, silent = false})
map("n", "<C-l>", "<C-w>l", {noremap = true, silent = false})
map("n", "<C-j>", "<C-w>j", {noremap = true, silent = false})
map("n", "<C-k>", "<C-w>k", {noremap = true, silent = false})

map("n", "<C-c>", ":bd<CR>", {noremap = true, silent = false})

map("i", "jk", "<ESC>", {noremap = true, silent = false})
map("i", "kj", "<ESC>", {noremap = true, silent = false})

map("n", "<leader>f", ":Format<CR>", {noremap = true, silent = true})
map("n", "<leader>F", ":Telescope find_files<cr>", {noremap = true, silent = true})
map("n", "<leader>e", ":NvimTreeToggle<CR>", {noremap = true, silent = true})
map("n", "<leader>S", ":source $MYVIMRC<CR>", {noremap = true, silent = true})
map("n", "<leader>hh", ":split<CR>", {noremap = true, silent = true})
map("n", "<leader>vv", ":vsplit<CR>", {noremap = true, silent = true})
map("v", "<C-g>", '"_d', {noremap = true, silent = true})
map("n", "<C-p>", '"_dP', {noremap = true, silent = true})

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
map("n", "<leader>dw", "<cmd>lua require('diaglist').open_all_diagnostics()<cr>", {noremap = true, silent = false})
map("n", "<leader>d0", "<cmd>lua require('diaglist').open_buffer_diagnostics()", {noremap = true, silent = false})

-- local terminal = require("toggleterm.terminal").Terminal
-- local toggle_lazygit = function()
--     local lazygit = terminal:new({cmd = "lazygit", direction = "float"})
--     return lazygit:toggle()
-- end

map(
    "n",
    "<leader>tl",
    ":lua require('toggleterm.terminal').Terminal:new({cmd = 'lazygit', direction = 'float'}):toggle()<CR>",
    {noremap = true, silent = false}
)
