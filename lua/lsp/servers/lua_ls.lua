vim.lsp.config.lua = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".editorconfig", ".git", ".luarc.json", ".luarc.jsonc", vim.uv.cwd() },
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            workspace = {
                checkThirdParty = false,
                library = { vim.env.VIMRUNTIME, "${3rd}/luv/library" },
            },
        },
    },
}

vim.lsp.enable({ "lua" })
