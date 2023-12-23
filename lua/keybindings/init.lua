vim.g.mapleader = " "
local map = vim.keymap.set
-- map("n", "<C-h>", "<C-w>h", { noremap = true, silent = false })
-- map("n", "<C-l>", "<C-w>l", { noremap = true, silent = false })
-- map("n", "<C-j>", "<C-w>j", { noremap = true, silent = false })
-- map("n", "<C-k>", "<C-w>k", { noremap = true, silent = false })
-- map("n", "<C-c>", "<C-w>c", { noremap = true, silent = false })
--
map("n", "<C-g>", ":Bdelete<CR>", { noremap = true, silent = false })
map("n", "<C-G>", ":Bdelete!<CR>", { noremap = true, silent = false })

map("n", "<leader>rr", function()
    vim.cmd("make")
end, { noremap = true, silent = true })
map("n", "<leader>rb", function()
    local inp = vim.fn.input("set makeprg=")
    inp = inp:gsub("\\", "\\\\")
    inp = inp:gsub('"', '\\"')
    inp = inp:gsub(" ", "\\ ")
    inp = inp:gsub("|", "\\|")
    vim.cmd("set makeprg=" .. inp)
    vim.cmd("make")
end, { noremap = true, silent = true })

map("n", "<leader>rc", function()
    local inp = vim.fn.input("Command: ")
    if #inp == 0 then
        return
    end
    inp = inp:gsub('"', '\\"')
    inp = string.format(
        'TermExec cmd="%s" dir=%s direction=horizontal go_back=0 start_in_insert=1',
        inp,
        vim.g.current_dired_path
    )
    vim.g.saved_command = inp
    vim.cmd(inp)
end, { noremap = true, silent = true })

map("n", "<leader>cc", function()
    if vim.g.saved_command ~= nil then
        vim.cmd(vim.g.saved_command)
    else
        local inp = vim.fn.input("Command: ")
        if #inp == 0 then
            return
        end
        inp = inp:gsub('"', '\\"')
        inp = string.format(
            'TermExec cmd="%s" dir=%s direction=horizontal go_back=0 start_in_insert=1',
            inp,
            vim.g.current_dired_path
        )
        vim.g.saved_command = inp
    end
end, { noremap = true, silent = true })

map("n", "<leader>co", ":copen<CR>", { noremap = true, silent = true })
map("n", "<leader>cn", ":cnext<CR>", { noremap = true, silent = true })
map("n", "<leader>cp", ":cprev<CR>", { noremap = true, silent = true })
map("n", "<leader>cl", ":clist<CR>", { noremap = true, silent = true })

map("n", "<leader>F", ":Format<CR>", { noremap = true, silent = true })
map("n", "<leader>f", ':Telescope find_files theme=get_ivy prompt_title=""<cr>', { noremap = true, silent = true })
map("n", "<leader>b", ':Telescope buffers theme=get_ivy prompt_title=""<cr>', { noremap = true, silent = true })
map("n", "<leader>r", ':Telescope live_grep theme=get_ivy prompt_title=""<cr>', { noremap = true, silent = true })
map("n", "<leader>hh", ":split<CR>", { noremap = true, silent = true })
map("n", "<leader>gg", ":Neogit<CR>", { noremap = true, silent = true })
map("n", "<leader>vv", ":vsplit<CR>", { noremap = true, silent = true })
map("n", "<leader>mv", ":call man#get_page_from_cword('vertical', v:count)<CR>", { noremap = true, silent = true })
map("n", "<leader>m", ":call man#get_page_from_cword('horizontal', v:count)<CR>", { noremap = true, silent = true })
map("v", "<C-g>", '"_d', { noremap = true, silent = true })
map("n", "<C-p>", '"_dP', { noremap = true, silent = true })

map("v", "<", "<gv", { noremap = true, silent = false })
map("v", ">", ">gv", { noremap = true, silent = false })

map("n", "<leader>E", "<cmd>e ~/.config/nvim/<cr>", { noremap = true, silent = false })
map("n", "<C-Left>", ":vertical resize +3<CR>", { noremap = true, silent = true })
map("n", "<C-Right>", ":vertical resize -3<CR>", { noremap = true, silent = true })
map("n", "<C-Up>", ":resize +3<CR>", { noremap = true, silent = true })
map("n", "<C-Down>", ":resize -3<CR>", { noremap = true, silent = true })
map(
    "n",
    "<leader>tp",
    ":lua require('toggleterm.terminal').Terminal:new({cmd = 'python', direction = 'vertical'}):toggle() <CR>",
    { noremap = true, silent = true }
)
map(
    "n",
    "<leader>tv",
    ":lua require('toggleterm.terminal').Terminal:new({direction = 'vertical'}):toggle() <CR>",
    { noremap = true, silent = true }
)

map("n", "<leader>e", "<cmd>e .<CR>", { noremap = true, silent = true })
map("n", "<Tab>", ":bn<cr>", { noremap = true, silent = true })
map("n", "<S-Tab>", ":bp<cr>", { noremap = true, silent = true })
