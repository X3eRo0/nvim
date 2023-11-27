require("mason-lspconfig").setup({
    ensure_installed = { "pyright", "clangd", "lua_ls", "rust_analyzer" },
})
