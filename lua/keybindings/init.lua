vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap
map("n", "<C-h>", "<C-w>h", { noremap = true, silent = false })
map("n", "<C-l>", "<C-w>l", { noremap = true, silent = false })
map("n", "<C-j>", "<C-w>j", { noremap = true, silent = false })
map("n", "<C-k>", "<C-w>k", { noremap = true, silent = false })

map("n", "<C-c>", "<C-w>c", { noremap = true, silent = false })
map("n", "<C-g>", ":Bdelete<CR>", { noremap = true, silent = false })
map("n", "<C-G>", ":Bdelete!<CR>", { noremap = true, silent = false })

-- map("i", "jk", "<ESC>", { noremap = true, silent = false })
-- map("i", "kj", "<ESC>", { noremap = true, silent = false })

map("n", "<leader>F", ":Format<CR>", { noremap = true, silent = true })
map("n", "<leader>f", ":Telescope find_files theme=dropdown<cr>", { noremap = true, silent = true })
map("n", "<leader>r", ":Telescope live_grep theme=dropdown<cr>", { noremap = true, silent = true })
-- map("n", "<leader>e", ":NvimTreeToggle<CR>", {noremap = true, silent = true})
-- map("n", "gcc", ":CommentToggle<CR>", {noremap = true, silent = true})
-- map("v", "gc", ":CommentToggle<CR>", {noremap = true, silent = true})
map("n", "<leader>hh", ":split<CR>", { noremap = true, silent = true })
map("n", "<leader>rr", ":Recompile<CR>", { noremap = true, silent = true })
map("n", "<leader>gg", ":Neogit<CR>", { noremap = true, silent = true })
map("n", "<leader>vv", ":vsplit<CR>", { noremap = true, silent = true })
map("n", "<leader>mv", ":call man#get_page_from_cword('vertical', v:count)<CR>", { noremap = true, silent = true })
map("n", "K", ":call man#get_page_from_cword('vertical', v:count)<CR>", { noremap = true, silent = true })
map("n", "<leader>m", ":call man#get_page_from_cword('horizontal', v:count)<CR>", { noremap = true, silent = true })
map("v", "<C-g>", '"_d', { noremap = true, silent = true })
map("n", "<C-p>", '"_dP', { noremap = true, silent = true })

map("v", "<", "<gv", { noremap = true, silent = false })
map("v", ">", ">gv", { noremap = true, silent = false })

-- map("n", "<leader>sr", ':lua require("spectre").open()<CR>', {noremap = true, silent = false})
-- map("n", "<leader>sw", ':lua require("spectre").open_visual({select_word=true})<CR>', {noremap = true, silent = false})
-- map("v", "<leader>s", ':lua require("spectre").open_visual()<CR>', {noremap = true, silent = false})
-- map("n", "<leader>sp", 'viw:lua require("spectre").open_file_search()<CR>', {noremap = true, silent = false})

map("n", "C-a", "<Plug>(dial-increment)", { noremap = true, silent = false })
map("n", "C-x", "<Plug>(dial-decrement)", { noremap = true, silent = false })

map("v", "C-a", "<Plug>(dial-increment)", { noremap = true, silent = false })
map("v", "C-x", "<Plug>(dial-decrement)", { noremap = true, silent = false })
map("v", "gC-a", "<Plug>(dial-increment-additional)", { noremap = true, silent = false })
map("v", "gC-x", "<Plug>(dial-decrement-additional)", { noremap = true, silent = false })
map("n", "<leader>dw", "<cmd>lua require('diaglist').open_all_diagnostics()<cr>", { noremap = true, silent = false })
map("n", "<leader>d0", "<cmd>lua require('diaglist').open_buffer_diagnostics()", { noremap = true, silent = false })
map("n", "<leader>E", "<cmd>e ~/.config/nvim/<cr>", { noremap = true, silent = false })
map("n", "<C-Left>", ":vertical resize +3<CR>", { noremap = true, silent = true })
map("n", "<C-Right>", ":vertical resize -3<CR>", { noremap = true, silent = true })
map("n", "<C-Up>", ":resize +3<CR>", { noremap = true, silent = true })
map("n", "<C-Down>", ":resize -3<CR>", { noremap = true, silent = true })
map(
    "n",
    "<leader>tp",
    ":lua require('toggleterm.terminal').Terminal:new({cmd = 'python', direction = 'float'}):toggle() <CR>",
    { noremap = true, silent = true }
)
map(
    "n",
    "<leader>tl",
    ":lua require('toggleterm.terminal').Terminal:new({cmd = 'lazygit', direction = 'float'}):toggle()<CR>",
    { noremap = true, silent = true }
)

map(
    "n",
    "<leader>tt",
    ":lua require('toggleterm.terminal').Terminal:new({direction = 'float'}):toggle()<CR>",
    { noremap = true, silent = true }
)

-- map("n", "<leader>e", ":lua require('dirbuf').open(vim.fn.input('Directory: ', '', 'dir'))<CR>", {noremap = true, silent = true})
map("n", "<leader>e", ":e .<CR>", { noremap = true, silent = true })

map("n", "<A-j>", ":MoveLine(1)<CR>", { noremap = true, silent = true })
map("n", "<A-k>", ":MoveLine(-1)<CR>", { noremap = true, silent = true })
map("v", "<A-j>", ":MoveBlock(1)<CR>", { noremap = true, silent = true })
map("v", "<A-k>", ":MoveBlock(-1)<CR>", { noremap = true, silent = true })
map("n", "<A-l>", ":MoveHChar(1)<CR>", { noremap = true, silent = true })
map("n", "<A-h>", ":MoveHChar(-1)<CR>", { noremap = true, silent = true })
map("v", "<A-l>", ":MoveHBlock(1)<CR>", { noremap = true, silent = true })
map("v", "<A-h>", ":MoveHBlock(-1)<CR>", { noremap = true, silent = true })

map("n", "<Tab>", ":bn<cr>", { noremap = true, silent = true })
map("n", "<S-Tab>", ":bp<cr>", { noremap = true, silent = true })
