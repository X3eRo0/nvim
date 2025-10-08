local common = require("lsp.common")

vim.lsp.config.vtsls = {
    cmd = { "vtsls", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
}
vim.lsp.enable("vtsls")
