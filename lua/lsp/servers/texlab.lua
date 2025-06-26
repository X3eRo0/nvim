-- TeXLab LSP server configuration for Neovim
vim.lsp.config.texlab = {
    cmd = { "texlab" },
    filetypes = { "tex", "bib", "latex", "plaintex" },
    root_markers = { ".git", "texlab.toml", ".latexmkrc" },
    settings = {
        texlab = {
            -- Build on save with latexmk
            build = {
                executable = "latexmk",
                args = {
                    "-pdf",
                    "-interaction=nonstopmode",
                    "-synctex=1",
                    "%f",
                },
                onSave = true,
                forwardSearchAfter = true,
            },
            -- Forward/inverse search with Zathura
            forwardSearch = {
                executable = "zathura",
                args = {
                    "--synctex-forward",
                    "%l:1:%f",
                    "%p",
                },
            },
            -- Linting (using ChkTeX)
            chktex = {
                onEdit = true,
                onOpen = true,
                executable = "chktex",
                args = { "-q", "-f%l:%c:%d:%k:%n:%m\n", "%f" },
            },
            -- Delay before diagnostics
            diagnosticsDelay = 300,
        },
    },
}

-- Enable TeXLab
vim.lsp.enable("texlab")
