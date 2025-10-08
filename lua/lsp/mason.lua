local ensure_installed = {
    "black",
    "clang-format",
    "clangd",
    "lua-language-server",
    "pyright",
    "rust-analyzer",
    "shfmt",
    "stylua",
    "vtsls",
}

require("mason").setup()
require("mason-tool-installer").setup({
    ensure_installed = ensure_installed,
})
