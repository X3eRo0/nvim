require("formatter").setup({
    logging = false,
    filetype = {
        javascript = {
            -- prettier
            function()
                return {
                    exe = "prettierd",
                    args = { vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
                    stdin = true,
                    env = {
                        string.format("PRETTIERD_DEFAULT_CONFIG=%s", vim.fn.expand("~/.config/nvim/.prettierrc")),
                    },
                }
            end,
        },
        sh = {
            -- Shell Script Formatter
            function()
                return {
                    exe = "shfmt",
                    args = { "-i", 4 },
                    stdin = true,
                }
            end,
        },
        rust = {
            -- Shell Script Formatter
            function()
                return {
                    exe = "rustfmt",
                    args = { "--config", "hard_tabs=false,tab_spaces=4" },
                    stdin = true,
                }
            end,
        },
        cpp = {
            -- clang-format
            function()
                return {
                    exe = "clang-format",
                    args = {
                        "-style='{BasedOnStyle: WebKit, IndentWidth: 4, SortIncludes: false}'",
                        "--assume-filename",
                        vim.api.nvim_buf_get_name(0),
                    },
                    stdin = true,
                    cwd = vim.fn.expand("%:p:h"), -- Run clang-format in cwd of the file.
                }
            end,
        },
        c = {
            -- clang-format
            function()
                return {
                    exe = "clang-format",
                    args = {
                        "-style='{BasedOnStyle: WebKit, IndentWidth: 4, SortIncludes: false}'",
                        "--assume-filename",
                        vim.api.nvim_buf_get_name(0),
                    },
                    stdin = true,
                    cwd = vim.fn.expand("%:p:h"), -- Run clang-format in cwd of the file.
                }
            end,
        },
        html = {
            -- prettier
            function()
                return {
                    exe = "prettierd",
                    args = {
                        vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
                    },
                    stdin = true,
                }
            end,
        },
        htmldjango = {
            -- prettier
            function()
                return {
                    exe = "prettierd",
                    args = {
                        vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
                    },
                    stdin = true,
                }
            end,
        },
        lua = {
            -- luafmt
            function()
                return {
                    exe = "stylua",
                    args = { "--indent-width", "4", "--line-endings", "Unix", "--indent-type", "Spaces", "-" },
                    stdin = true,
                }
            end,
        },
        python = {
            -- Configuration for psf/black
            function()
                return {
                    exe = "black", -- this should be available on your $PATH
                    args = { "-" },
                    stdin = true,
                }
            end,
        },
    },
    ["*"] = {
        require("formatter.filetypes.any").remove_trailing_whitespace,
    },
})

local group = vim.api.nvim_create_augroup("formatter.nvim", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*",
    group = group,
    callback = function()
        vim.cmd("FormatWrite")
    end,
})
