_G.open_dir = function ()
    local db = require("dirbuf")
    -- local cpath = vim.fs.dirname(vim.api.nvim_buf_get_name(0))
    local new_path = vim.fn.input("Enter path: ", "", "dir")
    print(new_path)
    -- db.open(new_path)
    -- vim.api.nvim_set_current_dir(new_path)
end
