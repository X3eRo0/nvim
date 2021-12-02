require("formatter").setup(
    {
        filetype = {
            javascript = {
                -- prettier
                function()
                    return {
                        exe = "prettier",
                        args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
                        stdin = true
                    }
                end
            },
            sh = {
                -- Shell Script Formatter
                function()
                    return {
                        exe = "shfmt",
                        args = {"-i", 2},
                        stdin = true
                    }
                end
            },
            cpp = {
                -- clang-format
                function()
                    return {
                        exe = "clang-format",
                        args = {
                            "-style='{BasedOnStyle: WebKit, IndentWidth: 4}'",
                            "--assume-filename",
                            vim.api.nvim_buf_get_name(0)
                        },
                        stdin = true,
                        cwd = vim.fn.expand("%:p:h") -- Run clang-format in cwd of the file.
                    }
                end
            },
            c = {
                -- clang-format
                function()
                    return {
                        exe = "clang-format",
                        args = {
                            "-style='{BasedOnStyle: WebKit, IndentWidth: 4}'",
                            "--assume-filename",
                            vim.api.nvim_buf_get_name(0)
                        },
                        stdin = true,
                        cwd = vim.fn.expand("%:p:h") -- Run clang-format in cwd of the file.
                    }
                end
            },
            lua = {
                -- luafmt
                function()
                    return {
                        exe = "luafmt",
                        args = {"--stdin"},
                        stdin = true
                    }
                end
            },
            python = {
                -- Configuration for psf/black
                function()
                    return {
                        exe = "black", -- this should be available on your $PATH
                        args = {"-"},
                        stdin = true
                    }
                end
            }
        }
    }
)

vim.api.nvim_exec(
    [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.c,*.cpp,*.py,*.lua FormatWrite
augroup END
]],
    true
)
