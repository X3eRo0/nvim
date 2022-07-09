require("formatter").setup(
    {
        filetype = {
            javascript = {
                -- prettier
                function()
                    return {
                        exe = "/home/x3ero0/node_modules/.bin/prettier",
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
                        args = {"-i", 4},
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
            html = {
                -- prettier
                function()
                    return {
                        exe = "/home/x3ero0/node_modules/.bin/prettier",
                        args = {
                            "--stdin-filepath",
                            vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
                            "--single-quote",
                            "--tab-width",
                            "4",
                            "--end-of-line",
                            "lf"
                        },
                        stdin = true
                    }
                end
            },
            htmldjango = {
                -- prettier
                function()
                    return {
                        exe = "/home/x3ero0/node_modules/.bin/prettier",
                        args = {
                            "--stdin-filepath",
                            vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
                            "--single-quote",
                            "--tab-width",
                            "4",
                            "--end-of-line",
                            "lf"
                        },
                        stdin = true
                    }
                end
            },
            lua = {
                -- luafmt
                function()
                    return {
                        exe = "/home/x3ero0/node_modules/.bin/luafmt",
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
        },
        ["*"] = {
            require("formatter.filetypes.any").remove_trailing_whitespace
        }
    }
)

vim.api.nvim_exec(
    [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.c,*.cpp,*.py,*.lua,*.sh,*.js,*.html FormatWrite
augroup END
]],
    true
)
