local wk = require("which-key")
local mappings = {
    q = {":q<cr>", "Quit"},
    Q = {":wq<cr>", "Save & Quit"},
    w = {":w<cr>", "Save"},
    x = {":bdelete<cr>", "Close"},
    E = {":e $MYVIMRC<cr>", "Edit config"},
    F = {":Telescope find_files<cr>", "Telescope Find Files"},
    R = {":Telescope live_grep<cr>", "Telescope Live Grep"},
    S = {":source $MYVIMRC<cr>", "Source VIMRC"},
    f = {":Format<cr>", "Format Document"},
    D = {":lua vim.lsp.buf.type_definition()<cr>", "Get Type Definition"},
    sr = {':lua require("spectre").open()<CR>', "Search and Replace"},
    sw = {':lua require("spectre").open()<CR>', "Search and Replace current word"},
    sp = {'viw:lua require("spectre").open_file_search()<CR>', "Search and Replace current word"}
}
local opts = {prefix = "<leader>"}
wk.register(mappings, opts)
