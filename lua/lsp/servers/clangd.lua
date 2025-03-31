local common = require("lsp.common")

vim.lsp.config.clangd = {
    on_attach = common.on_attach,
    capabilities = common.capabilities,
    handlers = common.handlers,
    cmd = {
        "clangd",
        -- "--completion-style=detailed",
        -- "--background-index=false",
        -- "--header-insertion=iwyu",
    },
    filetypes = { "c", "cc", "cpp", "h", "hpp", "ixx", "cppm", "inl" },
    root_markers = { ".clang-format", ".git", "compile_commands.json", "CMakeLists.txt", "Makefile" },
}

vim.lsp.enable("clangd")
