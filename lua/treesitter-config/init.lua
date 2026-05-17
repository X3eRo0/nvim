require("nvim-treesitter").setup({
    install_dir = vim.fn.stdpath("data") .. "/site",
})

local group = vim.api.nvim_create_augroup("user-treesitter", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    group = group,
    callback = function(args)
        pcall(vim.treesitter.start, args.buf)
    end,
})
