require("indent_blankline").setup({
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = false,
    buftype_exclude = { "terminal", "quickfix"},
    filetype_exclude = {
        "dashboard",
        "NvimTree",
        "packer",
        "startify",
        "dirbuf",
        "lsp-installer",
        "man",
        "dired",
        "mason",
        "qf",
    },
    show_end_of_line = false,
})
